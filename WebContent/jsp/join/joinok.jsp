<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import="kickoff.dto.*" %>
<%@ page import="kickoff.vo.*" %>
<%@ page import="java.util.*" %>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>ȸ������</title>
		<link href="css/join.css" rel="stylesheet" type="text/css">
		<link href="../hfcss/header.css" rel="stylesheet" type="text/css">
		<link href="../hfcss/footer.css" rel="stylesheet" type="text/css">
		<script src="../../js/jquery-3.6.3.js"></script>
	</head>
	<%@ include file="../include/header.jsp" %>
<!-- ������ ��� �Ǵ°� -------------------------- -->
<%
request.setCharacterEncoding("EUC-KR");

String id          = request.getParameter("userid");
String pw          = request.getParameter("userpw");
String name        = request.getParameter("name");
String nick        = request.getParameter("nickname");
String gender      = request.getParameter("gender");
String mail        = request.getParameter("mail");

if(id == null || pw == null || name == null || nick == null || mail == null)
{
	%>
	<script>
		alert("�ʼ� �Է¶��� �Է����ּ���.");
		document.location = "/kick_off_view/jsp/join/join.jsp";
	</script>
	<%
	return;
}

UserinfoVO vo = new UserinfoVO();
vo.setUser_id(id);
vo.setUser_pw(pw);
vo.setUser_name(name);
vo.setUser_nick(nick);
vo.setUser_gender(gender);
vo.setUser_mail(mail);

UserinfoDTO dto = new UserinfoDTO();

dto.Join(vo);

%>
<script>
	alert("ȸ�������� �Ϸ�Ǿ����ϴ�.")
	document.location = "/kick_off_view/jsp/login/login.jsp";
</script>
<!-- ������ ��� �Ǵ°� -------------------------- -->
<%@ include file="../include/footer.jsp" %>