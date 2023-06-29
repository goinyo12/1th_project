<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.net.*, java.io.*"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%
	//���ǿ��ٰ� �� �����س��� 
	String ln = "";
	
	ln = (String)session.getAttribute("CLSTANDING");
	if(ln == null)
	{
		System.out.println("API�� �����͸� �����մϴ�.");
		ln = "";
		
		//�Ű����� �����Ͽ� api �ּ� �����
		String address="https://api.football-data.org/v4/competitions/CL/standings";
	
		//��ü ���� �� url ����
		URL url = new URL(address); //url ��ä ����
		URLConnection urlConn = url.openConnection(); //url ��ü ���
		urlConn.setRequestProperty("X-Auth-token", "d5e1fe0b1f084179af33060ed794581f"); //���� Ű header�� �Է�
	
		//������ �޾ƿ���
		InputStreamReader inputStream = new InputStreamReader(urlConn.getInputStream(),"UTF-8");
		BufferedReader bufferRead = new BufferedReader(inputStream);
		
		//bufferedreader �ִ���� �޾ƿü��ֵ��� �ݺ�
		String str = null;		
		do
		{
			str = bufferRead.readLine();
			if( str != null ) ln += str;
		}while(str != null);
		
		session.setAttribute("CLSTANDING",ln);
	}else
	{
		System.out.println("API�� ���ǿ��� �޾ҽ��ϴ�.");
	}
	
	
	out.print(ln);
	
%>