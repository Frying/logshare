import db_mysql

proc add*(a:string, b:string, c:string, d:string, e:string) =
  let db_conn = open("localhost","root","123123","pastans")
  db_conn.exec(sql"start transaction")
  db_conn.exec(sql"insert into log_table(ID, LogSubject, Reporter, ReportDate, LogDetail) values(?,?,?,?,?)", a, b, c, d, e)
  db_conn.exec(sql"commit")
  close(db_conn)

proc getLogDetail*(id:string) : seq =
  let db_conn = open("localhost","root","123123","pastans")
  var y = db_conn.getRow(sql"select * from log_table where ID=?", id)
  close(db_conn)
  return y
