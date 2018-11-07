    /*Display all countries*/
    router.get('/filter/:country', function(req, res){
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
