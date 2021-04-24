const studentModel = require('../models/studentModel');

const getStudentByEmail = (req, res) => {
    console.log("Parameter: " + req.params.email);
    studentModel.getStudentByEmail(req.params.email)
    .then( data => {
        res.status(200);
        res.send(data);
    });
};

const lentArticleByStudent = (req, res) => {
    studentModel.lentArticleByStudent(req.params.id_student, req.params.id_article)
    .then( data => {
        res.status(200);
        res.send(data);
    });
};

module.exports = 
{
    getStudentByEmail,
    lentArticleByStudent
}