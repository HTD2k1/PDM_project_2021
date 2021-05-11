
const mysql2 = require('mysql2');
// Database connection
const db = mysql2.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: 'Phna0220',
    database: 'health_system'
})

module.exports = db;