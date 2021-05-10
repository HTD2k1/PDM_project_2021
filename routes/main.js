const express = require("express");
const router = express.Router();

// Homepage
router.get("/", (req, res) => {
    res.render("index");
});
// Register
router.get("/register", (req, res) => {
    res.render("register");
});
// Login
router.get("/login", (req, res) => {
    res.render("login");
});

module.exports = router;