<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kickoff.dto.*" %>    
<%
String id   = request.getParameter("id");


if(id == null || id.equals(""))
{
	out.println("00:���̵� �Է��ϼ���.");
	return;
}

UserinfoDTO dto = new UserinfoDTO();
if(dto.CheckID(id) == true)
{
	out.println("01:�ߺ��� ���̵� �Դϴ�.");
}
else
{
	out.println("02:��� ������ ���̵� �Դϴ�.");
}
%>