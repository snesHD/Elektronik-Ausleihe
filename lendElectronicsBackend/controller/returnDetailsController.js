const returnDetails = require('../models/returnDetailsModel');

const returnArticle = (req, res) => {
    returnDetails.returnArticle(
        req.body.id_borrowed,
        req.body.amount
    ).then ( data => {
        res.status(200);
        res.send(data)
    });
}

module.exports = 
{
    returnArticle
}