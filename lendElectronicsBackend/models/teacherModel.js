const dbc = require('./dbConnection');
require('dotenv').config();
const getAllTeacher = async () => {
    let conn;
    try {
        conn = await dbc.pool.getConnection();
        const rows = await conn.query("SELECT * FROM teacher;");
        return rows;
    } catch (err)
    {
        throw err;
    } finally {
        if (conn) conn.end();
    }
}


const getTeacherById = async id => {
    let conn;
    try {
        conn = await dbc.pool.getConnection();
        const rows = await conn.query("SELECT * FROM teacher WHERE id = ?;",id);
        
        return rows;    
    } catch (err)
    {
        throw err;
    } finally {
        if (conn) {conn.end();}
    }  
}


module.exports = {
    getAllTeacher,
    getTeacherById
}


//Test
/*
function showData(rows){
    rows.forEach(element => {
        console.log(element['id'] + ", " + element['kuerzel'] +', '+ element['Name']);
    })
};


console.log("Test");
getAllTeacher()
    .then(showData);

getTeacherById(1)
    .then(showData);
*/