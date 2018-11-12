var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'classmysql.engr.oregonstate.edu',
  user            : 'cs290_lihua',
  password        : '4779',
  database        : 'cs290_lihua'
});

module.exports.pool = pool;