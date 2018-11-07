     /* add a country */
 
 router.post('/', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO endorse_country (Cname) VALUES (?)";
        var inserts = [req.body.Cname];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                console.log(JSON.stringify(error))
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/country');
            }
        });
    });

    /*Display all countries*/
    router.get('/', function(req, res){
        var callbackCount = 0;
        var context = {};
        var mysql = req.app.get('mysql');
        getCountry(req,res, mysql, context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 2){
                res.render('country', context);
            }

        }
    });
function getCountry(res, mysql, context, complete) {
        mysql.pool.query("SELECT * FROM endorse_country", function (error, results, fields) {
            if (error) {
                res.write(JSON.stringify(error));
                res.end();
            }
            context.country = results;
            complete();
        });
    }
