<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kickoff.vo.*" %>
<%@ page import="kickoff.dto.*" %>
<%@ page import="java.util.*" %> 
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%
String no = request.getParameter("no");
if( no == null || no.equals("") )
{
	response.sendRedirect("/kick_off_view/jsp/index/index.jsp");
	return;
}

PostDTO dto = new PostDTO();
PostVO vo = dto.Read(no, false);
String post_pname = vo.getPost_pname();
String post_oname = vo.getPost_oname();

//÷�������� �ϵ��ũ���� �о �������� �����Ѵ�.
String uploadPath = "D:\\GIY\\java\\study\\kick_off\\WebContent\\download";
String fileName = uploadPath + "\\" + post_pname;
//out.println(fileName);

//�������� ���ϸ��� ������.
post_oname = URLEncoder.encode(post_oname,"utf-8");
//System.out.println(fname);
response.setContentType("application/octet-stream");   
response.setHeader("Content-Disposition","attachment; filename=" + post_oname);

File file = new File(fileName);
FileInputStream fileIn = new FileInputStream(file);
ServletOutputStream ostream = response.getOutputStream();

byte[] outputByte = new byte[4096];
//copy binary contect to output stream
while(fileIn.read(outputByte, 0, 4096) != -1)
{
	ostream.write(outputByte, 0, 4096);
}
fileIn.close();
ostream.flush();
ostream.close();
%>