const teacherModel = require('../models/teacherModel');

const getAllTeacher = (req, res) => {
    teacherModel.getAllTeacher()
        .then( data => {
            //console.log(typeof(JSON.parse(JSON.stringify(data))));
            res.status(200);
            res.send(data);
            //res.json(data)
        });     
};

const getTeacherById = (req, res) => {
    
    teacherModel.getTeacherById(req.params.id)
    .then( data => {     
        console.log(typeof(JSON.parse(JSON.stringify(data))));
        res.status(200);
        res.send(JSON.stringify(data));
    });
};

/*const createTeacher = (req, res) = {
    
}*/

module.exports = 
{
    getAllTeacher,
    getTeacherById
}




