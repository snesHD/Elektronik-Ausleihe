const
    router = require('express').Router()
    teacher = require('./controller/teacherController')
    article = require('./controller/articleController') 
    student = require('./controller/studentController')
    borrow = require('./controller/borrowController')
    returnDetails = require('./controller/returnDetailsController');

/*
    returnDetails
*/    

router.post('/returnarticle', (req, res) => {
    console.log("returnDetails" + req.body);
    return returnDetails.returnArticle(req,res);
})


/*
    borrow
*/
router.post('/loanout', (req,res) => {
    console.log('reached borrow');
    return borrow.loanOut(req,res);
});


/*
    Student
*/
router.get('/lentarticlebystudent/:id_student/:id_article', (req, res) =>{
    return student.lentArticleByStudent(req,res);
});

router.get('/studentbyemail/:email', (req, res) => {
    return student.getStudentByEmail(req,res);
});

/*
    Article
*/
router.get('/allarticle', (req,res) => {
    return article.getAllArticle(req,res);
});

/*
        Teacher
*/
router.get('/allteacher', (req,res) => {    
        return teacher.getAllTeacher(req,res);
});

router.get('/getteacherbyid/:id', (req,res) => {
    return teacher.getTeacherById(req,res);
});

/*
    about
*/
router.post('/about', (req,res)=>{
  
    let id = req.body.id;
    console.log(id);
    return res.send("/about :" + id);
});

module.exports = router;


