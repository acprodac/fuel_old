<%

	
		Dim sMSG, sNome, sTel, sComentario, sEmail
	
	
	sNome = Request.Form(Ucase("nome"))
	sEmail = Request.Form(Lcase("email"))
	sEmpresa = Request.Form("empresa")
	sTel = Request.Form("telefone")
	sEndereco = Request.Form("endereco")
	sBairro = Request.Form("bairro")
	sCidade = Request.Form("cidade")
	sUF = Request.Form("uf")
	sCep = Request.Form("cep")
	sApresentacao = Request.Form("optApresentacao")
		
	sBody = "Nome .: " & sNome & vbcrlf
	sBody = sBody & "Email .: " & lCase(sEmail) & vbcrlf
	sBody = sBody & "Empresa .: " & sEmpresa & vbcrlf
	sBody = sBody & "Telefone .: " & sTel & vbcrlf
	sBody = sBody & vbcrlf
	sBody = sBody & "Endere�o .: " & sEndereco & vbcrlf
	sBody = sBody & "Bairro .: " & sBairro & vbcrlf
	sBody = sBody & "Cidade .: " & sCidade & vbcrlf
	sBody = sBody & "UF .: " & sUF & vbcrlf
	sBody = sBody & "CEP .: " & sCep & vbcrlf
	sBody = sBody & "Desejo receber apresentacao da empresa por .: " & sApresentacao & vbcrlf
	
	Set Mailer = Server.CreateObject("SMTPsvg.Mailer") 
	Mailer.FromName = sNome
	Mailer.FromAddress= sEmail
	Mailer.RemoteHost = "smtp2.locaweb.com.br;smtp.uol.com.br"
	Mailer.AddRecipient "Prodac", "adm@prodac.com.br" 
	Mailer.Subject = "Contato pelo Site"
	Mailer.BodyText = sBody
	If Mailer.SendMail Then 
    sMSG = "Ol� " & sNome & ",<br><br>Seu cadastro foi enviada com sucesso." 
	sMSG = sMSG & "<br><br>Agradecemos seu contato"
	sMSG = sMSG & "<br><br>Prodac"
	Else 
    sMSG = "Ocorreu um erro ao enviar sua solicita��o, por favor tente novamente .:<br><br>#Error# " & Mailer.Response 
	End If

%>
<html>
<head>
<title>:: Prodac ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<link rel="stylesheet" href="estilo.css">
<body background="designa.jpg" leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="25%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="253" height="133">
        <param name="movie" value="menufla2.swf">
        <param name="quality" value="high">
        <embed src="menufla2.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="253" height="133"></embed></object></td>
    <td width="75%"><img src="branco.gif" width="101" height="127"><a href="index.htm"><img src="branco.gif" width="227" height="127" border="0"></a></td>
  </tr>
  <tr valign="top"> 
    <td height="531" colspan="2"> 
      <table width="100%" height="500" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="23%" height="531" valign="top">
<table width="97%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><a href="obra1.htm"><img src="branco.gif" width="161" height="25" border="0"></a></td>
              </tr>
              <tr>
                <td height="32"><a href="obra2.htm"><img src="branco.gif" width="161" height="25" border="0"></a></td>
              </tr>
              <tr>
                <td height="29"><a href="obra3.htm"><img src="branco.gif" width="161" height="25" border="0"></a></td>
              </tr>
              <tr>
                <td height="29"><a href="obra4.htm"><img src="branco.gif" width="161" height="25" border="0"></a></td>
              </tr>
              <tr>
                <td height="29"><a href="obra5.htm"><img src="branco.gif" width="161" height="25" border="0"></a></td>
              </tr>
              <tr>
                <td height="30"><a href="obra6.htm"><img src="branco.gif" width="161" height="25" border="0"></a></td>
              </tr>
              <tr>
                <td height="28"><a href="obra7.htm"><img src="branco.gif" width="161" height="25" border="0"></a></td>
              </tr>
              <tr>
                <td height="30"><a href="obra8.htm"><img src="branco.gif" width="161" height="25" border="0"></a></td>
              </tr>
              <tr>
                <td height="30"><a href="obra9.htm"><img src="branco.gif" width="161" height="25" border="0"></a></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table>
          </td>
          <td width="77%" valign="top"><table width="96%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td valign="top"><img src="branco.gif" width="269" height="38"><br> 
                  <div align="justify"><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>:: 
                    Cadastro ::</strong> </font> </div>
                  <p align="justify"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><%= sMSG%></font></p>
                  <p></p>
                  <p align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><img src="tira.jpg" width="90%" height="2"><br>
                    PRO DAC Ar Condicionado LTDA.<br>
                    Rua Belford Duarte, 716- Vl. Sta. Catarina- Cep 04375-000- 
                    S&atilde;o Paulo- SP<br>
                    Fone: (11) 5566-6556 Fax: (11) 5563-5200 E-mail </font></p>
                  <p></p></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>