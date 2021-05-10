const express = require("express");
const router = express.Router();

// Tap on Icon
router.get("/", (req, res) => {
    res.render('./user/userHome')
});
// Homepage
router.get("/homepage", (req, res) => {
    res.render('./user/userHome')
});
// Specialist
router.get("/doctor", (req, res) => {
    res.render('./user/profile')
});
// Logout
router.get("/logout", (req, res) => {
    res.render('./user/logout')
});

module.exports = router;