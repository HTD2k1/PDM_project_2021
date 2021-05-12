const express = require("express");
const router = express.Router();
const userController = require('../controllers/user.controller');
const db = require('../models/model.database');

function correctUsername(username) {
    username = username.toLowerCase();
    var words = username.split(" ");
    for (let i = 0; i < words.length; i++) {
        words[i] = words[i][0].toUpperCase() + words[i].substr(1);
    }
    username = words.join(" ");
    return username;
}
// GET
router.get("/", async (req, res) => {
    var username = req.cookies.username;
    var password = req.cookies.password;
    var correctedName = correctUsername(username);
    db.query(`SELECT user.userID, user.fullname, user.dob, user.email, user.phone
                FROM users user, account acc
                WHERE user.userID = acc.userID AND acc.username = ? AND acc.password = ?`,
        [username, password], (error, result) => {
            if (error) {
                console.log("Failed to retrieve user info. Returning to main page!");
                res.status(400).redirect("/");
            } else {
                const user = result[0];
                return res.render('./user/userHome', {
                    userID: user.userID,
                    username: correctedName,
                    fullname: user.fullname,
                    dob: user.dob,
                    email: user.email,
                    phone: user.phone
                });
            }
        });
});
router.get("/homepage", (req, res) => {
    var username = req.cookies.username;
    var password = req.cookies.password;
    var correctedName = correctUsername(username);
    db.query(`SELECT user.userID, user.fullname, user.dob, user.email, user.phone
                FROM users user, account acc
                WHERE user.userID = acc.userID AND acc.username = ? AND acc.password = ?`,
        [username, password], (error, result) => {
            if (error) {
                console.log("Failed to retrieve user info. Returning to main page!");
                res.status(400).redirect("/");
            } else {
                const user = result[0];
                return res.render('./user/userHome', {
                    userID: user.userID,
                    username: correctedName,
                    fullname: user.fullname,
                    dob: user.dob,
                    email: user.email,
                    phone: user.phone
                });
            }
        });
});
router.get("/search", (req, res) => {
    res.render('./user/userSearch');
});
router.get("/logout", (req, res) => {
    res.clearCookie('jwt');
    res.clearCookie('username');
    res.clearCookie('password');
    res.redirect('/');
});

// POST
router.post("/search-symptom", userController.searchSymptom); 
module.exports = router;