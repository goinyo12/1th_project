<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kickoff.dto.*" %>    
<%
String code   = request.getParameter("code");
String check  = (String)session.getAttribute("checkkey");

if(code == null || code.equals(""))
{
	out.println("������ȣ�� �Է����ּ���.");
	return;
}

if(!check.equals(code))
{
	out.println("������ȣ�� ��ġ���� �ʽ��ϴ�.");
}
else
{
	out.println("������ �Ϸ�Ǿ����ϴ�.");
}
%>