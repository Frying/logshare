import jester, asyncdispatch, htmlgen, base64, times, strutils, templates, views, models

settings:
  port = Port(8090)
  appName = ""
  bindAddr = "0.0.0.0"

routes:
  get "/":
    resp views.logForm()

  post "/save-log":
    var sbj = @"subject".strip()
    var rpt = @"reporter".strip()
    var dte = format(getLocalTime(getTime()), "yyyy-MM-dd HH:mm:ss")
    var dtl = @"detail"
    var hashing = encode(getClockStr())

    if len(sbj) > 0 and len(rpt) > 0 and len(dtl.strip()) > 0:
      add(hashing, sbj.strip(), rpt.strip(), dte, dtl)
      resp linkBuilder(hashing)
    else:
      resp """Incomplete information. Please <a href="http://logshare.digakusite.com">try again.</a>"""

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
