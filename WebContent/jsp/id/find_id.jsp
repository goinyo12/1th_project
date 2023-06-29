<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>���̵� ã��</title>
		<link href="css/find_id.css" rel="stylesheet" type="text/css">
		<link href="../hfcss/header.css" rel="stylesheet" type="text/css">
		<link href="../hfcss/footer.css" rel="stylesheet" type="text/css">
		<script src="../../js/jquery-3.6.3.js"></script>
	</head>
	<script>
		window.onload = function()
		{
			$(".sidead").css({"display" : "none"});
		}
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
		function DoBack()
		{
			document.location = "/kick_off_view/jsp/index/index.jsp";
		}
		function SendID()
		{
			if(confirm("���̵� �����Ͻðڽ��ϱ�?") == false)
			{
				return;
			}
			if($("#user_name").val() == "")
			{
				alert("�̸��� �Է����ּ���.")
				$("#user_name").focus()
				return;
			}
			if($("#user_mail").val() == "")
			{
				alert("�̸����� �Է����ּ���.")
				$("#user_mail").focus()
				return;
			}
			$.ajax({
				type : "post",
				url: "/kick_off_view/jsp/mail/findid_mail.jsp",
				data    : 
				{
					user_name : $("#user_name").val(),
					user_mail : $("#user_mail").val()
				},
				dataType: "html",
				success : function(data) 
				{
					data = data.trim()
					alert(data);
				}			
			});
			document.location = "/kick_off_view/jsp/login/login.jsp";
		}
	</script>
<%@ include file="../include/header.jsp" %>
<!-- main ���� -->
		<div class="main">
			<h1 class="sitename"><a href="/kick_off_view/jsp/index/index.jsp">Kick off</a></h1>
			<div class="loginbackground">
				<form class="login" name="login" method="post" action="/kick_off_view/jsp/mail/findid_mail.jsp" >
				<table class="logintbl">
					<tr>
						<td>&nbsp;&nbsp;�̸�
						<br><br>
						<input type="text" class="userid" name="user_name" id="user_name" placeholder="�̸��� �Է����ּ���.">
						<br><br>
						</td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;E-mail
						<br><br>
						<input type="text" class="userpw" name="user_mail" id="user_mail" placeholder="e-mail�� �Է����ּ���.">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<br>
							<input type="button" class="button" value="���̵� ����"  onclick="SendID();" >
							<br><br>
							<input type="button" class="button" value="���" onclick="DoBack();">
						</td>
					</tr>					
				</table>
				</form>		
				<table class="tap">
					<tr>
						<td><a href="/kick_off_view/jsp/pw/find_pw.jsp">��й�ȣ ã��</a></td>
						<td>&nbsp;|&nbsp;</td>
						<td><a href="/kick_off_view/jsp/join/join.jsp">ȸ������</a></td>
					</tr>
				</table>
			</div>
		</div>
		<br>
		<!-- main �� -->
<%@ include file="../include/footer.jsp" %>