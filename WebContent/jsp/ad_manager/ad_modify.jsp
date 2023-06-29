<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kickoff.dto.*" %>
<%@ page import="kickoff.vo.*" %>
<%@ page import="java.util.*" %>
<%
String no = request.getParameter("no");
ad_managerDTO dto = new ad_managerDTO();
ad_listDTO DTO    = new ad_listDTO();

ad_managerVO vo = dto.Read(no,true);
%> 
<!DOCTYPE html>
<html>
	<head>
	<meta charset="EUC-KR">
	<title>ad_write</title>
	<link href="../hfcss/header.css" rel="stylesheet" type="text/css">
	<link href="../hfcss/footer.css" rel="stylesheet" type="text/css">
	<link href="css/ad_modify.css" rel="stylesheet" type="text/css">
	<script src="../../js/jquery-3.6.3.js"></script>
	<script>
	window.onload = function()
	{
		$("#ad_name").focus();
	}
	
	function DoSave()
	{
		if($("#ad_name").val() == "")
		{
			alert("������ �����̸��� �Է��ϼ���");
			$("#ad_name").focus();
			return false;
		}
		if($("#ad_keyword").val() == "")
		{
			alert("������ ����Ű���带 �Է��ϼ���");
			$("#ad_keyword").focus();
			return false;
		}
		if($("#w_image").val() == "")
		{
			alert("������ ���� �̹����� ÷���ϼ���");
			$("#w_image").focus();
			return false;
		}
		if($("#h_image").val() == "")
		{
			alert("������ ���� �̹����� ÷���ϼ���");
			$("#h_image").focus();
			return false;
		}	
		if(confirm("������ ���������� �����Ͻðڽ��ϱ�?") == false)
		{
			return false;	
		}
		return true;
	}	
</script>
	<style>	
		  @import url('https://fonts.googleapis.com/css2?family=Hahmlet&display=swap');
	</style>
	</head>
	<body class="main_body">
		<div class="main_box">
			<div class="main_title" onclick="location.href='ad_modify.jsp?no=<%= no %>'">
				���� ����
			</div>
			<form enctype="multipart/form-data" method="post" id="ad_reg" action="ad_modifyok.jsp?no=<%= no %>" onsubmit="return DoSave();">
				<input type="submit" class="ad_reg" name="ad_reg" value="��������">
				<hr class="horizon">
				<table class="main_table">
					<tr>
						<td class="title_td">�����̸�</td>
						<td><input type="text" id="ad_name" name="ad_name" value="<%= vo.getAd_name() %>" style="width:95%"></td>
					</tr>
					<tr>
						<td class="title_td">����Ű����</td>
						<td><input type="text" id="ad_keyword" name="ad_keyword" value="<%= vo.getAd_keyword() %> "style="width:95%"></td>
					</tr>
					<tr>
						<td class="title_td">���� �����̹��� ÷��</td>
						<td><input type="file" id="w_image" name="w_image" class="w_img_attach">���� ÷�� ���� : <%= vo.getW_image_fname() %></td>
					</tr>
					<tr>
						<td class="title_td">���� �����̹��� ÷��</td>
						<td><input type="file" id="h_image" name="h_image" class="h_img_attach">���� ÷�� ���� : <%= vo.getH_image_fname() %></a></td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>