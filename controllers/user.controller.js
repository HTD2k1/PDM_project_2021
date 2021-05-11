const db = require('../models/model.database.js');
const authController = require('./auth.controller');
const bcrypt = require('bcrypt');
const { reset } = require('nodemon');

exports.getUserInfo = (req, res) => {
    const username = cookie.username;
    const password = cookie.password;
    const userInfo = db.query(`SELECT user.userID, user.fullname, user.dob, user.email, user.phone
                FROM users user, account acc
                WHERE user.userID = acc.userID AND acc.username = ? AND acc.password = ?`,
        [username, password], (error, result) => {
            if (error) {
                console.log("Failed to retrieve user info. Returning to main page!");
                res.status(400).redirect("/");
            } else {
                const user = result[0];
                console.log(user);
                return res.send({
                    userID: user.userID,
                    fullname: user.fullname,
                    dob: user.dob,
                    email: user.email,
                    phone: user.phone
                });
            }
        });
    console.log(userInfo);
}

exports.searchSymptom = (req, res) => {

}

exports.searchDoctor = (req, res) => {

}
