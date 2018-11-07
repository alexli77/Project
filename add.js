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
