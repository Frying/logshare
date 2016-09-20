import db_mysql

var db_conn = open("localhost","root","123123","pastans")

proc add*(a:string, b:string, c:string, d:string, e:string) =
  db_conn.exec(sql"start transaction")
  db_conn.exec(sql"insert into log_table(ID, LogSubject, Reporter, ReportDate, LogDetail) values(?,?,?,?,?)", a, b, c, d, e)
  db_conn.exec(sql"commit")

proc getLogDetail*(id:string) : seq =
  var y = db_conn.getRow(sql"select * from log_table where ID=?", id)
  return y
