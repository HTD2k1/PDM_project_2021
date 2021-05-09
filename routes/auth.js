const express = require("express");
const authController = require("../controllers/auth.controller.js");
const router = express.Router();

// When this route is called by App.js, load authController as imported above and the function register
router.post('/register', authController.register);
router.post('/login', authController.login);

module.exports = router;