<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kickoff.dto.*" %>
<%@ page import="kickoff.vo.*" %>
<%@ page import="java.util.*" %>
<%
String reply_no = request.getParameter("reply_no");

ReplyDTO dto = new ReplyDTO();
dto.Delete(reply_no);

out.println("����� �����Ͽ����ϴ�.");
%>