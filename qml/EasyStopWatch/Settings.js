function getDatabase() {
     return openDatabaseSync("EasyStopWatch", "1.0", "EASYSTOPWATCH DB", 1000000);
}
function init() {
    var db = getDatabase();
    db.transaction(
        function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS settings(setting TEXT UNIQUE, value TEXT)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS kennzeichen(kennzeichen TEXT UNIQUE)');
      });
}

function set(setting, value) {
   // setting: string representing the setting name (eg: “username”)
   // value: string representing the value of the setting (eg: “myUsername”)
   init()
   var db = getDatabase();
   var res = "";
   db.transaction(function(tx) {
        var rs = tx.executeSql('INSERT OR REPLACE INTO settings VALUES (?,?);', [setting,value]);
              //console.log(rs.rowsAffected)
              if (rs.rowsAffected > 0) {
                res = "OK";
              } else {
                res = "Error";
              }
        }
  );
  return res;
}

function get(setting) {
   init()
   var db = getDatabase();
   var res="";
   db.transaction(function(tx) {
     var rs = tx.executeSql('SELECT value FROM settings WHERE setting=?;', [setting]);
     if (rs.rows.length > 0) {
          res = rs.rows.item(0).value;
     } else {
         res = "";
     }
  })
  return res
}
function getvol(setting) {
   init()
   var db = getDatabase();
   var res="";
   db.transaction(function(tx) {
     var rs = tx.executeSql('SELECT value FROM settings WHERE setting=?;', [setting]);
     if (rs.rows.length > 0) {
          res = rs.rows.item(0).value;
     } else {
         res = "0.75";
     }
  })
  return res
}


function clear (setting, value){

    init()
    var db = getDatabase();
    var res = "";
    db.transaction(function(tx) {
         var rs = tx.executeSql('INSERT OR REPLACE INTO settings VALUES (?,?);', [setting,value]);
               if (rs.rowsAffected > 0) {
                 res = "";
               } else {
                   res = "";
               }
         }
   );
   return res;

}


