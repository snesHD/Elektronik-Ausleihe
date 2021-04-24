const articleModel = require('../models/articleModel');

const getAllArticle = (req, res) => {
    articleModel.getAllArticle()
        .then( data => {
            res.status(200);
            res.send(data);
        });
    };

module.exports = {
    getAllArticle
}