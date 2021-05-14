const express = require('express');
const app = express();
const path = require('path');
const cookieParser = require('cookie-parser');
const db = require('./models/model.database');
// Set views and public directory for rendering
const publicDirectory = path.join(__dirname, './public');
const userViewDirectory = path.join(__dirname, './views');
app.use(express.static(publicDirectory));
app.use(express.static(userViewDirectory));

// Set view engine
app.set('view engine', 'hbs')
// Parse URL-encoded bodies (as sent by HTML forms)
app.use(express.urlencoded({ extended: false }))
// Parse JSON bodies (as sent by API clients)
app.use(express.json());
// User Cookie parser to set up cookies
app.use(cookieParser());

// Define Routes: whatever has the route such as '/auth/register' in register.hbs, go to the defined router, here is 'auth.js'
app.use('/', require('./routes/main'));
app.use('/auth', require('./routes/auth'));
app.use('/user', require('./routes/user'));

// Open App
app.listen(3000, () => {
    console.log("Server successfully started on Port 3000");
})

// Environment
const dotenv = require('dotenv');
dotenv.config({
    path: "./.env"
})

db.connect((err, res) => {
    if (err) {
        console.log("|| Database failed to connect...")
        console.log(err);
    } else {
        console.log("|| Database successfully connected!!!")
    }
})