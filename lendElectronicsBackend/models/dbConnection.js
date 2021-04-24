const mariadb = require('mariadb');
require('dotenv').config();

/*const pool = mariadb.createPool({
    host: process.env.HOST, 
    username: process.env.USER,
    database: 'electronics',
    password: process.env.PASSWORD,
    connectionLimit: 5
});
*/

const pool = mariadb.createPool({
     host: 'localhost', 
     user:'root', 
     database:'electronics',
     password: '',
     connectionLimit: 5
});

module.exports = {
    pool
};

