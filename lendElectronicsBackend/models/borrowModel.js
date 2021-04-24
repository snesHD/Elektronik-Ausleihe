const dbc = require('./dbConnection');

require('dotenv').config();

const loanOut = async (id_student, id_article, amount) => {
    let conn;
    try {
        conn = await dbc.pool.getConnection();
        const response = await conn.query(
            "INSERT INTO borrowed" 
            + "(id_student, id_article, amount)"
            + "VALUES (?,?,?);"
            , [id_student, id_article, amount]);
        return response;         
    } catch (error) {
        throw error;
    } finally {
        if (conn)
            {conn.end();}
    }
}

module.exports = {
    loanOut
}
