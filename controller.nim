import jester, asyncdispatch, htmlgen, base64, times, strutils, templates, views, models

settings:
  port = Port(8090)
  appName = ""
  bindAddr = "0.0.0.0"

routes:
  get "/":
    resp views.logForm()

  post "/save-log":
    var sbj = @"subject"
    var rpt = @"reporter"
#    var dte = format(getLocalTime(getTime()), "d MMMM yyyy HH:mm")
    var dte = format(getLocalTime(getTime()), "yyyy-MM-dd")
    var dtl = @"detail"
    var hashing = encode(getClockStr())

    add(hashing, sbj, rpt, dte, dtl)
    resp linkBuilder(hashing)

  get "/get/@id":
    var data_string: array[5, string]
    var i = 0
    for x in getLogDetail(@"id"):
        data_string[i] = x
        i=i+1

    resp viewDetail(data_string)

  #get "/report/@name":
  #  var x = db_conn.getValue(sql"select LogSubject, ReportDate, LogDetail from log_table where reporter=?", @"name")
  #  resp logDetail(x)

runForever()
