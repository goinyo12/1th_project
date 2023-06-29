<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">	
		<title>���� �ۼ���</title>
		<link href="../hfcss/header.css" rel="stylesheet" type="text/css">
		<link href="../hfcss/footer.css" rel="stylesheet" type="text/css">
		<link href="css/news_modify.css" rel="stylesheet" type="text/css">
		<script src="../../js/jquery-3.6.3.js"></script>
		<script src="../../summernote/summernote-lite.js"></script>
		<script src="../../summernote/lang/summernote-ko-KR.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	</head>
	<script>
		window.onload = function()
		{
			$("#title").focus();
		}
		$(document).ready(function() {
			//���� �Ʒ� �κ�
			$('#summernote').summernote({
				  height: 300,                 // ������ ����
				  minHeight: null,             // �ּ� ����
				  maxHeight: null,             // �ִ� ����
				  focus: true,                  // ������ �ε��� ��Ŀ���� ������ ����
				  lang: "EUC-KR",					// �ѱ� ����
				  placeholder: '�ִ� 2048�ڱ��� �� �� �ֽ��ϴ�'	//placeholder ����
			});
		});
		
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
		function DoModify()
		{
			$("#write").submit();
		}
		function DoSave()
		{
			if($("#title").val() == "" || $("#title").val() == null)
			{
				alert("������ �Է����ּ���.");
				$("#title").focus();
				return false;
			}
			if($("#summernote").val() == "" || $("#summernote").val() == null)
			{
				alert("������ �Է����ּ���.");
				$("#summernote").focus();
				return false;
			}
			if(confirm("�Խù��� �����Ͻðڽ��ϱ�?") == false)
			{
				return false;
			}
			return true;
		}
	</script>
	<%@ include file="../include/header.jsp" %>
<% 
String mcate       = request.getParameter("mcate");
String source      = request.getParameter("source");
String sort        = request.getParameter("sort");
String pageno      = request.getParameter("page");
String no          = request.getParameter("no");
String keyword     = request.getParameter("keyword");
String search_type = request.getParameter("search_type");
	
PostDTO dto = new PostDTO();
PostVO  vo  = dto.Read(no, true);
%>
<!-- main ���� -->
		<div class="main">
			<div class="news_frame">
				<form id="write" enctype="multipart/form-data" method="post" action="/kick_off_view/jsp/news/news_modifyok.jsp" onsubmit="return DoSave();">
				<input type="hidden" name="no" value="<%= no %>"> 
				<input type="hidden" name="oname" value="<%= vo.getPost_oname() %>">
				<input type="hidden" name="pname" value="<%= vo.getPost_pname() %>">
				<div class="tab"><a href="news.jsp" class="tabtitle_text">����</a></div>
				<div><hr class="line"></div>
				<div align="center">
					<table>
						<tr>
							<td style="font-size:20pt; font-weight:500;">���� : </td>
							<td><input type="text" class="textbox" id="title" name="title" value="<%= vo.getPost_title() %>"></td>
							<td>
								<select class="select" name="mcate">
									<option value="p" <%= vo.getPost_mcate().equals("p") ? "selected" : "" %>>EPL</option>
									<option value="l" <%= vo.getPost_mcate().equals("l") ? "selected" : "" %>>�󸮰�</option>
									<option value="c" <%= vo.getPost_mcate().equals("c") ? "selected" : "" %>>è�Ǿ𽺸���</option>
									<option value="b" <%= vo.getPost_mcate().equals("b") ? "selected" : "" %>>�е�������</option>
									<option value="s" <%= vo.getPost_mcate().equals("s") ? "selected" : "" %>>������A</option>
								</select>
							</td>
							<td class="username">�ۼ��� : <%= vo.getUser_name() %></td>
						</tr>
						<tr>
							<td style="font-size:15pt; font-weight:500;">��ó : </td>
							<td><input type="text" placeholder="��ó�� �Է����ּ���." class="textbox" id="title" name="source" value="<%= vo.getPost_source() %>"></td>
						</tr>
					</table>
				</div>
				<textarea id="summernote" name="note"><%= vo.getPost_note() %></textarea>
				<div class="file_button">
					<input type="file" id="attach" name="attach">
					<%
					if(vo.getPost_oname() != null)
					{
						%>
						���� ÷������ : <a href="/kick_off_view/jsp/news/down.jsp?no=<%= no %>"><%= vo.getPost_oname() %></a>
						<%
					}
					else
					{
						%>
						��ϵ� ÷�������� �����ϴ�.
						<%
					}
					%>
				</div>
				<div class="okbutton"><a href="javascript:DoModify();" class="button_text">����</a></div>
				<div class="clebutton"><a href="/kick_off_view/jsp/news/news_view.jsp?no=<%= no %>&mcate=<%= mcate %>&sort=<%= sort %>&page=<%= pageno %>" class="button_text">���</a></div>
				</form>
			</div>
		</div>
		
<!-- main �� -->
<%@ include file="../include/footer.jsp" %>