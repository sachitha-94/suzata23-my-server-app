const fs = require('fs');
const sqlite3 = require('sqlite3').verbose();
// Read the SQL file
var dataSql = fs.readFileSync('./CourseManagmentSystem.db.sql').toString();
dataSql = dataSql.replace(/(\r\n|\n|\r)/gm, "");
var dataSqlArray = dataSql.toString().split(';');

// open the database
let db = new sqlite3.Database('courceManagementdb.db', (err) => {
    if (err) {
      console.error(err.message);
      throw err
    }
  console.log('Connected to the courceManagementdb database.');
  });



db.serialize(() => {
  // db.run runs your SQL query against the DB
  db.run('PRAGMA foreign_keys=OFF;');
  db.run('BEGIN TRANSACTION;');
  // Loop through the `dataArr` and db.run each query
  dataSqlArray.forEach((query) => {
    if (query) {
      db.run(query, (err) => {
        if (err) {
          console.log(err.message);
        };
      });
    }
  });
  db.run('COMMIT;');
});

  // // create table 'book'
  // const sql='CREATE TABLE book(name text)';
  // db.run(sql, (err) => {
  //   if (err) {
  //       // Table already created
  //       console.log('Table already created.');
  //   }else{
  //     console.log('Table created.');
      
  //     // First time Table created, insert some rows
  //     console.log('First time Table created, creating some rows.');
      
  //     var insert = 'INSERT INTO book(name) VALUES(?)';
  //     db.run(insert, ['JavaScript Programming']);
  //     db.run(insert, ['React with Hooks']);
  //   }
  // });


// export as module, called db
module.exports = db
