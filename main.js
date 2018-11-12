var express = require('express');
var mysql = require('./dbcon.js');
var bodyParser = require('body-parser');

var app = express();
var handlebars = require('express-handlebars').create({defaultLayout:'main'});


app.engine('handlebars', handlebars.engine);
app.use(bodyParser.urlencoded({extended:true}));
app.use('/static', express.static('public'));
app.set('view engine', 'handlebars');

app.set("port", 13415);        

app.set('mysql', mysql);


app.use(express.static('files'));
app.use(express.static('public'));

app.get('/', (req, res)=> {
    res.sendFile(path.join(__dirname + '/public/home'));
});
app.get('/',function(req,res,next){
  res.render('home', context);
});

app.use('/athlete', require('./atlete.js'));
app.use('/country', require('./country.js'));
app.use('/brand', require('./brand.js'));
app.use('/sport', require('./sport.js'));
app.use('/country', require('./country.js'));



app.use(function(req,res){
  res.status(404);
  res.render('404');
});

app.use(function(err, req, res, next){
  console.error(err.stack);
  res.status(500);
  res.render('500');
});

app.listen(app.get('port'), function(){
  console.log('Express started on http://localhost:' + app.get('port') + '; press Ctrl-C to terminate.');
});


