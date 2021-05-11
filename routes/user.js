const express = require("express");
const router = express.Router();
const authController = require('../controllers/auth.controller');
const userController = require('../controllers/user.controller');
const db = require('../models/model.database');

// GET
router.get("/", async (req, res) => {
    res.render('./user/userHome');
});
router.get("/homepage", (req, res) => {
    res.render('./user/userHome')
});
router.get("/profile", (req, res) => {
    const username = req.cookies.username;
    const password = req.cookies.password;
    db.query(`SELECT user.userID, user.fullname, user.dob, user.email, user.phone
                FROM users user, account acc
                WHERE user.userID = acc.userID AND acc.username = ? AND acc.password = ?`,
        [username, password], (error, result) => {
            if (error) {
                console.log("Failed to retrieve user info. Returning to main page!");
                res.status(400).redirect("/");
            } else {
                const user = result[0];
                return res.render('./user/userProfile', {
                    userID: user.userID,
                    fullname: user.fullname,
                    dob: user.dob,
                    email: user.email,
                    phone: user.phone
                });
            }
        });
});
router.get("/logout", (req, res) => {
    res.render('./user/userLogout')
});


module.exports = router;