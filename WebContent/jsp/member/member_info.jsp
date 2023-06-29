<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>����������</title>
		<link href="../hfcss/header.css" rel="stylesheet" type="text/css">
		<link href="../hfcss/footer.css" rel="stylesheet" type="text/css">
		<link href="css/member_info.css" rel="stylesheet" type="text/css">
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
	function DoExit(no)
	{
		if(confirm("Ż���Ͻðڽ��ϱ�?") == false)
		{
			return;
		}
		$.ajax({
			type : "get",
			url: "/kick_off_view/jsp/member/member_exit.jsp?no=" + no,
			dataType: "html",
			success : function(data) 
			{
				alert(data)
				document.location = "index.jsp";
			}			
		});
	}
	function DoLogout()
	{
		if(confirm("�α׾ƿ� �Ͻðڽ��ϱ�?") != true) return;
		document.location = "/kick_off_view/jsp/logout/logout.jsp";
	}
	</script>
	<%@ include file="../include/header.jsp" %>
<!-- main ���� -->
		<div class="main">
			<div class="profileimg">
				<img class="userimg2" src="../../img/user.png">
				<p><%= login_vo.getUser_name() %> ��</p>
			</div>
			<div class="profileframe">
			<%
				String info = "";
				info += "?user_name=" + login_vo.getUser_name();
				info += "&user_id=" + login_vo.getUser_id();
			%>
				<div class="profiletext">
					<a href="/kick_off_view/jsp/member/member_modify.jsp">ȸ������ ����
					<b class="gt">&gt;</b></a>
					<hr>
					<br>
					<a href="/kick_off_view/jsp/pw/pw_modify.jsp<%= info %>">��й�ȣ ����
					<b class="gt">&gt;</b></a>
					<hr>
					<br><br><br><br><br>
					<a href="javascript:DoLogout();">�α׾ƿ�
					<b class="gt">&gt;</b></a>
					<hr>
					<br>
					<a href="javascript:DoExit(<%= login_vo.getUser_no() %>);">ȸ��Ż��
					<b class="gt">&gt;</b></a>
					<hr>
				</div>
			</div>
		</div>
			
<!-- main �� -->
<%@ include file="../include/footer.jsp" %>
	