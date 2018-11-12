var express = require('express');             
var app = express();
var path = require('path');
app.use(express.static('public'));


var mysql = require('./dbcon.js');

app.set("port", 13451);                             

app.get('/', (req, res)=> {
    res.sendFile(path.join(__dirname + '/public/view/index.html'));
});

app.get('/Brand', (req, res)=> {
    res.sendFile(path.join(__dirname + '/public/view/Brand.html'));
});

app.get('/Country', (req, res)=> {
    res.sendFile(path.join(__dirname + '/public/view/Country.html'));
});

app.get('/Sport', (req, res)=> {
    res.sendFile(path.join(__dirname + '/public/view/Sport.html'));
});

app.get('/Athlete', (req, res)=> {
    res.sendFile(path.join(__dirname + '/public/view/Athlete.html'));
});

app.get('/Contract', (req, res)=> {
    res.sendFile(path.join(__dirname + '/public/view/Contract.html'));
});

app.listen(app.get("port"), function(){             //Let's us know the port is up and running
	console.log('ok ');
});

