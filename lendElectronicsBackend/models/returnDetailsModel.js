const dbc = require('./dbConnection');

require('dotenv').config();

const returnArticle = async (id_borrowed, amount) => {
    let conn;
    console.log("id_borrowed: " + id_borrowed + ' amount: ' + amount);
    try {
        conn = await dbc.pool.getConnection();
        const response = await conn.query(
            "INSERT INTO returnDetails(id_borrowed, amount)"+
            "VALUES (?,?);",[id_borrowed, amount]);
        return response;
    } catch (error) {
        throw error;
    } finally {
        if (conn)
            {conn.end();}
    }
}

module.exports = {
    returnArticle
}