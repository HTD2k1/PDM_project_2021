const mysql = require('mysql2');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

const db = mysql.createConnection({
    host: 'sql6.freemysqlhosting.net',
    user: 'sql6410357',
    password: 'hDtPUhhXI6',
    database: 'sql6410357'
})

exports.register = (req, res) => {
    console.log(req.body);
    const { fullname, dob, email, phone, username, password, password_confirm } = req.body;
    // Check for existing user in USER TABLE
    db.query("SELECT userID FROM user WHERE fullname = ? AND dob = ? AND email = ? AND phone = ?",
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
                db.query("SELECT username FROM account WHERE username = ?", [username], async (error, results) => {
                    var resultArray = Object.values(JSON.parse(JSON.stringify(results)))
                    if (error) {
                        console.log(error);
                    }
                    if (resultArray.length > 0) {
                        return res.render("register", {
                            errorMessage: "That username is already registered!"
                        })
                    } else if (password != password_confirm) {
                        return res.render("register", {
                            errorMessage: "Password do not match!"
                        })
                    }
                })
                // If no existing user, create new_user in USER table
                db.query('INSERT INTO user SET ?',
                    { fullname: fullname, dob: dob, email: email, phone: phone }, (error) => {
                        if (error)
                            console.log(error);
                        else
                            console.log("User has been created");
                    });
                // Retrieve new_user from USER table
                db.query("SELECT userID FROM user WHERE fullname = ? AND dob = ? AND email = ? AND phone = ?",
                    [fullname, dob, email, phone], (error, results) => {
                        var new_user = Object.values(JSON.parse(JSON.stringify(results)))
                        if (error)
                            console.log(error)
                        else {
                            db.query('INSERT INTO account SET ?', { userID: new_user[0], username: username, password: password },
                                (error, results) => {
                                    if (error)
                                        console.log(error);

                                });
                            console.log("Result from insertion \n", results);
                        }
                    });
                console.log("Final results from request \n", final_results);

                return res.render('register', {
                    confirmMessage: "User is now registered!"
                });
            }
        });
}

exports.login = async (req, res) => {
    try {
        const { username, password } = req.body;
        if (!username || !password) {
            return res.status(400).render('login', {
                errorMessage: 'Please provide both your username and password'
            });
        }

        db.query("SELECT * FROM user WHERE username = ? AND password = ?", [username, password], async (error, results) => {
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
                const cookieOptions = {
                    expiresIn: new Date(
                        Date.now() + 86400
                    )
                }
                res.cookie('jwt', token, cookieOptions);
                res.status(200).redirect('/user/homepage');
            }
        });
    } catch (error) {
        console.log(error)

    }
}