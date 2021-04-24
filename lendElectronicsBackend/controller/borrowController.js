const borrowModel = require('../models/borrowModel');

const loanOut = (req,res) => {
    let 
        id_student = req.body.id_student
        id_article = req.body.id_article
        amount = req.body.amount;

    console.log("borowController: " + id_student + ", " + id_article +", "+ amount);

    borrowModel.loanOut (id_student, id_article, amount)
        .then( data => {
            res.status(201);
            res.send(data);
        });
} 

module.exports = {
    loanOut
}