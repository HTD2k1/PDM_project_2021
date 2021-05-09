const express = require("express");
const router = express.Router();

// Homepage
router.get("/", (req, res) => {
    res.render('./user/userHome')
});
// Register
router.get("/homepage", (req, res) => {
    res.render('./user/userHome')
});
// Login
router.get("/doctor", (req, res) => {
});

module.exports = router;