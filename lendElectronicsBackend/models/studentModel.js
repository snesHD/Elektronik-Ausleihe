const dbc = require('./dbConnection');
require('dotenv').config();

const getStudentByEmail = async email => {
    let conn;
    try {
        console.log('email')
        conn = await dbc.pool.getConnection();
        const rows = await conn.query("SELECT * FROM student WHERE Email LIKE ?;", email+'%');
        return rows;
    } 
    catch (err) {
        throw err;
    } 
    finally {
        if (conn) { 
           conn.end();
        }
    }
}

const lentArticleByStudent = async (id_student, id_article) => {
    let conn;
    try {
            conn = await dbc.pool.getConnection();         
            const rows = await conn.query(
                "SELECT borrowed.id as id, COALESCE(borrowed.amount - Rd.amount, borrowed.amount) as amount " + 
                "FROM borrowed " + 
                "LEFT JOIN ( " +
                    "SELECT returnDetails.id_borrowed, sum(amount) AS amount " +
                    "FROM returnDetails " +
                    "GROUP BY returnDetails.id_borrowed " +
                ") AS Rd " +
                "ON borrowed.id=Rd.id_borrowed " + 
                "WHERE id_student = ? AND id_article = ? " +
                "AND ( " +
                        "borrowed.amount>Rd.amount " + 
                        "OR " +
                        "Rd.amount is null " +
                    ")" +
                ";", [id_student, id_article]
            );
            return rows;
        }
        catch (err) {
            throw err;
        } 
        finally {
            if (conn) { 
                conn.end();
            }
        }   
}

module.exports = {
    getStudentByEmail,
    lentArticleByStudent
}