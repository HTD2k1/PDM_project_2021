const mysql2 = require('mysql2');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

const db = mysql2.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: 'Phna0220',
    database: 'health_system'
})

exports.searchDoctor = (req, res) => {
    
}