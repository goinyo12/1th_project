<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="mail.SMTPAuthenticator"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.*" %>
<%@page import="java.util.Properties"%>
<%@page import="java.util.*" %>
<%@ page import="kickoff.dto.*" %>
<%@ page import="kickoff.vo.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("UTF-8");

String user_name = request.getParameter("user_name");
String user_mail = request.getParameter("user_mail");

//��ġ�ϴ� ���̵� ã��
UserinfoDTO dto = new UserinfoDTO();
String user_id  = dto.FindID(user_name, user_mail);
if(user_id == null)
{
	out.print("��ġ�ϴ� ���̵� �������� �ʽ��ϴ�.");
	return;
}
if(user_id.equals("y"))
{
	out.print("Ż���� ȸ���Դϴ�.");
	return;
}


String from    = "na_falen@naver.com";
String to      = user_mail;
String subject = "kickoff ȸ�����̵� �Դϴ�.";
String content = "ȸ������ ID�� ";
content += "<br><br><b>" + user_id + "</b> &nbsp;&nbsp; �Դϴ�.";
content += "<br><br> �����մϴ�.";
// �Է°� ����

Properties p = new Properties(); // ������ ���� ��ü

p.put("mail.smtp.host","smtp.naver.com"); // ���̹� SMTP

p.put("mail.smtp.port", "465");
p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.auth", "true");
p.put("mail.smtp.debug", "true");
p.put("mail.smtp.socketFactory.port", "465");
p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback", "false");
// SMTP ������ �����ϱ� ���� ������

try{
    SMTPAuthenticator auth = new SMTPAuthenticator();
    Session           ses  = Session.getInstance(p, auth);
    
    ses.setDebug(true);
    
    MimeMessage msg = new MimeMessage(ses); // ������ ������ ���� ��ü
    msg.setSubject(subject); // ����
    
    Address fromAddr = new InternetAddress(from);
    msg.setFrom(fromAddr); // ������ ���
    
    Address toAddr = new InternetAddress(to);
    msg.addRecipient(Message.RecipientType.TO, toAddr); // �޴� ���
    
    msg.setContent(content, "text/html;charset=EUC-KR"); // ����� ���ڵ�
    
    Transport.send(msg); // ����
} catch(Exception e){
    e.printStackTrace();
    out.print("���ۿ� �����߽��ϴ�.");
    // ���� �߻��� �ڷ� ���ư�����
    return;
}

out.print("���̵� ���۵Ǿ����ϴ�.");
// ���� ��
%>