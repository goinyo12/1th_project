<%@ page import="kickoff.dto.*" %>
<%@ page import="kickoff.vo.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("UTF-8");

String user_name = request.getParameter("user_name");
String user_id   = request.getParameter("user_id");

//id,name ��ġ�ϴ� ȸ������ Ȯ��
UserinfoDTO dto = new UserinfoDTO();
String    check = dto.CheckInfo(user_name, user_id);

if(check == null)
{
	out.print("��ġ�ϴ� ȸ�������� �������� �ʽ��ϴ�.");
	return;
}

if(check.equals("exit"))
{
	out.print("Ż���� ȸ���Դϴ�.");
	return;
}

if(check.equals("ok"))
{
	out.print("ok");
	return;
}
%>