const jwt = require('jsonwebtoken');
const db = require('../models/model.database');
const cookieOptions = {
    expiresIn: new Date(
        Date.now() + 86400
    )
}

exports.register = (req, res) => {
    console.log(req.body);
    const { fullname, dob, email, phone, username, password, password_confirm } = req.body;
    // Check for existing user in USER TABLE
    db.query("SELECT userID FROM users WHERE fullname = ? AND dob = ? AND email = ? AND phone = ?",
        [fullname, dob, email, phone], (error, final_results) => {
            var new_user_array = Object.values(JSON.parse(JSON.stringify(final_results)));
            console.log(new_user_array)
            if (new_user_array.length != 0) {
                console.log(error);
                return res.render("register", {
                    errorMessage: "The user has already registered before!"
                });
            } else {
                // Check for existing account in ACCOUNT table
                db.query("SELECT username FROM account WHERE username = ?", [username], (error, results) => {
                    var resultArray = Object.values(JSON.parse(JSON.stringify(results)))
                    if (error) {
                        console.log(error);
                    } else if (resultArray.length > 0) {
                        return res.render("register", {
                            errorMessage: "That username is already registered!"
                        })
                    } else if (password != password_confirm) {
                        return res.status(400).render("register", {
                            errorMessage: "Passwords do not match!"
                        })
                    }
                })
                // If no existing user, create new_user in USER table
                db.query('INSERT INTO users SET ?',
                    { fullname: fullname, dob: dob, email: email, phone: phone }, (error) => {
                        if (error) {
                            console.log(error);
                            return res.status(401).render("register", {
                                errorMessage: "Error when creating new user! Please try again later."
                            })
                        } else
                            console.log("User has been created");
                    });
                // Retrieve new_user from USER table
                db.query("SELECT userID FROM users WHERE fullname = ? AND dob = ? AND email = ? AND phone = ?",
                    [fullname, dob, email, phone], (error, results) => {
                        var new_userID = results[0].userID;
                        var new_account = { userID: new_userID, username: username, password: password };
                        console.log("New user has ID: ", new_userID);
                        if (error) {
                            console.log(error)
                            return res.status(401).render("register", {
                                errorMessage: "Cannot query user from database!"
                            });
                        } else {
                            db.query('INSERT INTO account SET ?', new_account, (error, results) => {
                                if (error) {
                                    console.log(error)
                                    return res.status(401).render("register", {
                                        errorMessage: "Cannot query user from database!"
                                    });
                                } else {
                                    console.log("Result from insertion \n", results);
                                    return res.render('register', {
                                        confirmMessage: "User is now registered!"
                                    });
                                }
                            });
                        }
                    });
                console.log("Final results from request \n", final_results);
            }
        });
}

exports.login = async (req, res) => {
    const { username, password } = await req.body;
    try {
        if (!username || !password) {
            return res.status(400).render('login', {
                errorMessage: 'Please provide both your username and password'
            });
        }

        db.query("SELECT * FROM account WHERE username = ? AND password = ?", [username, password], async (error, results) => {
            console.log(results)
            if (!results) {
                res.status(401).render('login', {
                    errorMessage: 'Username or password is incorrect'
                })
            } else {
                const id = results[0].id;
                const token = jwt.sign({ id: id }, 'PDM2021Project', {
                    expiresIn: '1d'
                });
                console.log("The token is: " + token);
                res.cookie('jwt', token, cookieOptions);
                res.cookie('username', username, cookieOptions);
                res.cookie('password', password, cookieOptions);
                res.status(200).redirect('/user');
            }
        });
    } catch (error) {
        console.log(error)
        res.status(401).render('login', {
            errorMessage: 'Username or password is incorrect'});
    }
}