var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false });
var MongoClient = require('mongodb').MongoClient;
var url = 'mongodb+srv://koushik:koushik.05@cluster0-sjmap.mongodb.net/test?retryWrites=true&w=majority';
var db;
module.exports = (function (app) {
  app.get('/', function (req, res) {
    res.render('home');
  });
  app.get('/index.html',function(req,res){
    res.render('index');
  });
   app.get("/images/Charminar.png", function(req, res){
    res.writeHead(200, {'Content-Type': 'image/jpeg'});
    res.end("images/Charminar.png");
  }) 
  app.get('/hyderabad.html',function(req,res){
    res.render('hyderabad');
  });

  app.get('/bengaluru.html',function(req,res){
    res.render('bengaluru');
  });
  app.get('/mumbai.html',function(req,res){
    res.render('mumbai');
  });
  /* app.get('/ala.html',function(req,res){
    res.render('ala');
  }); */
  app.get('/register', function (req, res) {
    res.render('register');
  });
  app.get('/login', function (req, res) {
    res.render('login');
  });
  // Login TO DB==================================================================
  app.post('/demo', urlencodedParser, function (req, res) {
    MongoClient.connect(url, { useUnifiedTopology: true, useNewUrlParser: true }, function (err, client) {
      if (err) {
        console.log("err in db conn", err);
      }
      else {
        db = client.db("mydb");
        db.collection('userprofile').findOne({ name: req.body.name }, function (err, user) {
          if (user === null) {
            res.end("Login invalid");
          } else if (user.name === req.body.name && user.pass === req.body.pass) {
            res.render('completeprofile', { profileData: user });
            //res.render('index');
          } else {
            console.log("Credentials wrong");
            res.end("Login invalid");
          }
        });
      }
    });
  });
  //register to DB================================================================
  app.post('/regiterToDb', urlencodedParser, function (req, res) {
    var obj = JSON.stringify(req.body);
    var jsonObj = JSON.parse(obj);
    res.render('profile', { loginData: req.body });
  });
  //register profile to MongoDB================================================================
  app.post('/completeprofile', urlencodedParser, function (req, res) {
    var obj = JSON.stringify(req.body);
    console.log("Final reg Data : " + obj);
    var jsonObj = JSON.parse(obj);
    MongoClient.connect(url, function (err, client) {
      if (err) {
        console.log("err in db conn", err);
      }
      else {
        db = client.db("mydb");
        db.collection("userprofile").insertOne(jsonObj, function (err, res) {
          if (err) throw err;
          console.log("1 document inserted");
          //db.close();
        });
        res.render('completeprofile', { profileData: req.body });
      }
    });

  });
});