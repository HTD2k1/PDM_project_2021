const mysql = require('mysql2');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

const db = mysql.createConnection({
    host: 'sql6.freemysqlhosting.net',
    user: 'sql6410357',
    password: 'hDtPUhhXI6',
    database: 'sql6410357'
})

exports.searchDoctor = (req, res) => {
    
}