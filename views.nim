import templates

proc linkBuilder*(hash:string):string =
  return """Data have been saved. Open it by <a href="http://127.0.0.1:8090/get/""" & hash & """">click this link.</a>"""

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
    <table align="center">
      <tr>
        <td width="7%">Created by</td>
        <td width="1%">:</td>
        <td width="92%">""" & $data[2] & """</td>
      </tr>
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
