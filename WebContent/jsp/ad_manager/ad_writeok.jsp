<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kickoff.vo.*" %>
<%@ page import="kickoff.dto.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
String uploadPath = "D:\\GIY\\java\\study\\kick_off_view\\WebContent\\adimg";
//���ε尡 ������ �ִ� ���� ũ�⸦ �����Ѵ�.
int size = 10 * 1024 * 1024;

MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"EUC-KR",new DefaultFileRenamePolicy());

String ad_name    = multi.getParameter("ad_name");
String ad_keyword = multi.getParameter("ad_keyword");
String phyname1   = ""; //adfe-sdfdsd-eddf
String fname1     = ""; //dog.jpg
String phyname2   = ""; //adfe-sdfdsd-eddf
String fname2     = ""; //dog.jpg

//÷�������� ������ �߰��Ѵ�.
//���ε�� ���ϸ��� ��´�.
Enumeration files = multi.getFileNames();

String w_image   = (String) files.nextElement();
String h_image   = (String) files.nextElement();
String filename1 = (String) multi.getFilesystemName("w_image");
String filename2 = (String) multi.getFilesystemName("h_image");

fname1   = filename1;		


//���� �̸� ����
/*
String orgName1 = uploadPath + "\\" + filename1;
String newName1 = uploadPath + "\\" + phyname1;		

File srcFile1    = new File(orgName1);
File targetFile1 = new File(newName1);
srcFile1.renameTo(targetFile1);

out.println("���� ���ϸ� : " + orgName1 + "<br>");
out.println("�ٲ� ���ϸ� : " + newName1 + "<br>");
*/

fname2   = filename2;		

//���� �̸� ����
/*
String orgName2 = uploadPath + "\\" + filename2;
String newName2 = uploadPath + "\\" + phyname2;		

File srcFile2    = new File(orgName2);
File targetFile2 = new File(newName2);
srcFile2.renameTo(targetFile2);

out.println("���� ���ϸ� : " + orgName2 + "<br>");
out.println("�ٲ� ���ϸ� : " + newName2 + "<br>");
*/

ad_managerVO vo = new ad_managerVO();
vo.setAd_name(ad_name);
vo.setAd_keyword(ad_keyword);
vo.setW_image_fname(fname1);
vo.setH_image_fname(fname2);

ad_managerDTO dto = new ad_managerDTO();
dto.Insert(vo);

response.sendRedirect("ad_main.jsp");
%>