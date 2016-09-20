import templates

proc linkBuilder*(hash:string):string =
  return """Log telah berhasil disimpan. Silahkan buka melalui <a href="http://127.0.0.1:8090/get/""" & hash & """">link ini.</a>"""

proc logForm*: string = tmpli html"""
  <form action="/save-log" method="POST" enctype="application/json">
  <table>
    <tr>
      <td>Subject</td>
      <td>:</td>
      <td><input type"text" name="subject"/></td>
    </tr>
    <tr>
      <td>Reporter</td>
      <td>:</td>
      <td><input type"text" name="reporter"/></td>
    </tr>
    <tr>
      <td>Log Detail</td>
      <td>:</td>
      <td><textarea rows="4" cols="50" name="detail"></textarea></td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td><button name="submit">Submit</input></td>
    </tr>
  </table>
  </form>
"""

proc viewDetail*(data:array[5,string]): string =
  var c = """
    <table border="1" width="80%" align="center">
      <tr>
        <td>Subject</td>
        <td>:</td>
        <td>""" & $data[1] & """</td>
      </tr>
      <tr>
        <td>Report Date</td>
        <td>:</td>
        <td>""" & $data[3] & """</td>
      </tr>
      <tr>
        <td valign="top">Detail Log</td>
        <td valign="top">:</td>
        <td><pre>""" & $data[4] & """</pre></td>
      </tr>
    </table>
  """
  return c
