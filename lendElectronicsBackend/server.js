const bodyParser = require('body-parser');
const express = require('express');
const cors = require('cors');
const routing = require('./router');

//let bodyParser = require('body-parser');

require('dotenv').config();

const app = express();

// Ermöglicht den Zugriff von allen Servern sollte eingeschränkt sein.
app.use(cors());

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended:true }));

app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
 
  next();
});

app.use('/teacher',routing);
app.use('/article',routing);
app.use('/student',routing);
app.use('/borrow',routing);
app.use('/returndetails',routing);

app.listen(process.env.PORT, () => {
  console.log('Example app listening on port' + process.env.PORT)
});