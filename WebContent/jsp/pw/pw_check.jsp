<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kickoff.dto.*" %>    
<%
String pw   = request.getParameter("pw");
String pwck = request.getParameter("pwck");

if(pw == null || pw.equals(""))
{
	out.println("00:��й�ȣ�� �Է��ϼ���.");
	return;
}

if(!pwck.equals(pw))
{
	out.println("01:��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
}
else
{
	out.println("02:��й�ȣ�� ��ġ�մϴ�.");
}
%>