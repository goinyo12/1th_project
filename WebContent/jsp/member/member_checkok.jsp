<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kickoff.dto.*" %>
<%@ page import="kickoff.vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>�����Ϸ�</title>
		<link href="../hfcss/header.css" rel="stylesheet" type="text/css">
		<link href="../hfcss/footer.css" rel="stylesheet" type="text/css">
		<link href="css/member_checkok.css" rel="stylesheet" type="text/css">
		<script src="../../js/jquery-3.6.3.js"></script>
	</head>
	<script>
	function DoSearch()
	{
		if($(".searcher").val() == "")
		{
			alert("�˻�� �Է����ּ���.")
			return;
		}
		else
		{
			$("#top_search").submit();
		}
	}
	</script>
	<%@ include file="../include/header.jsp" %>
<!-- main ���� -->

<%@ page import="java.io.*" %>    
<!-- ������ ��� �Ǵ°� -------------------------- -->
<%
request.setCharacterEncoding("EUC-KR");

String name   = request.getParameter("user_name");
String id     = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");


UserinfoDTO dto = new UserinfoDTO();
dto.DBOpen();
String sql = "";
sql  = "select user_no from userinfo ";
sql += "where user_pw=md5('" + dto._R(user_pw) + "') ";
dto.RunQuery(sql);
if(dto.GetNext() == false)
{
%>
	<script>
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.")
		window.history.back();
	</script>
<%
	dto.DBClose();
	return;
}
dto.DBClose();

%>
<%
response.sendRedirect("/kick_off_view/jsp/member/member_info.jsp");
%>
		<!-- main �� -->
<%@ include file="../include/footer.jsp" %>