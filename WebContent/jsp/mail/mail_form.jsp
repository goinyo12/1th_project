<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="/kick_off_view/jsp/mail/send_mail.jsp" method="post">
			<table>
				<tr><th colspan="2">JSP ���� ������</th></tr>
				<tr><td>from</td><td><input type="text" name="from" /></td></tr>
				<tr><td>to</td><td><input type="text" name="to" /></td></tr>
				<tr><td>subject</td><td><input type="text" name="subject" /></td></tr>
				<tr><td>content</td><td><textarea name="content" style="width:170px; height:200px;"></textarea></td></tr>
				<tr><td colspan="2" style="text-align:right;"><input type="submit" value="Transmission"/></td></tr>
			</table>
		</form>
	</div>
</body>
</html>