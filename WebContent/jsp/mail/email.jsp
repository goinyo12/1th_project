<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>���</title>
		<link href="../hfcss/header.css" rel="stylesheet" type="text/css">
		<link href="../hfcss/footer.css" rel="stylesheet" type="text/css">
		<link href="css/email.css" rel="stylesheet" type="text/css">
		<script src="../../js/jquery-3.6.3.js"></script>
	</head>
	<script>

		function Doyes()
		{
			if($(".input").val() == ""){
				alert("������ȣ�� �Է����ּ���.")
				$(".input").focus();
				return;
			}
			if($(".input").val() != ""){
				$(".emailck").submit();
				return;
			}
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
	</script>
	<%@ include file="../include/header.jsp" %>
<!-- main ���� -->
		<div class="main">
			<div class="email">
				<img src="img/email.png" class="emailimg">
				<p class="email1">E-mail ����</p>
				<p class="email2">�̸��� ������ ���� ȭ���Դϴ�.<br>
					��ϵ� �̸��Ϸ� ���۵� �����ڵ带 �Է����ּ���.
			</div>
			<form class="emailck" name="emailck" method="post" action="/kick_off_view/jsp/pw/pw_modify.jsp" >
				<div class="emailinput">
					<input type="text" name="e-mail" class="input" placeholder="������ȣ�� �Է����ּ���.">
				</div>
				<div class="submit">
					<input type="button" name="success" class="submitbutton" value="���� �Ϸ�" onclick="Doyes();">
				</div>
			</form>
		</div>
		<!-- main �� -->
<%@ include file="../include/footer.jsp" %>
	