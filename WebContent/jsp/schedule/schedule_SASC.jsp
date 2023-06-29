<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.net.*, java.io.*"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%
// �Ķ��Ÿ�� ��ȸ�� ������ �޴´�
String season = request.getParameter("season");
// �Ķ��Ÿ�� ��ȸ�� ���(������)�� �޴´�
String month = request.getParameter("month");
// �Ķ��Ÿ�� ��ȸ�� �����ϰ� �������� �޴´�
String datefrom = request.getParameter("fDate");
String dateto = request.getParameter("eDate");

// ��� �Ķ��Ÿ�� �ȳѾ����, ���� ���� 1�� ������ �����͸� �ҷ��´�
if( season == null && month == null && datefrom == null ) { datefrom = "2022-06-01"; dateto   = "2023-06-30"; }
if( season   == null ) { season   = ""; };
if( month    == null ) { month    = ""; };
if( datefrom == null ) { datefrom = ""; };
if( dateto   == null ) { dateto   = ""; };

String session_name = "SSASC_" + month;
System.out.println("session name :" + session_name);
		String ln = (String)session.getAttribute(session_name);
		if(ln == null)
		{
			ln = "";
			System.out.println("API�� �����͸� �����մϴ�.");
			//�Ű����� �����Ͽ� api �ּ� �����
			String address = "https://api.football-data.org/v4/competitions/SA/matches";
			// �Ķ��Ÿ�� �ȳѾ���ų�, ������, �������� �Ѿ������
			if( datefrom.equals("") != true )
			{
				address += "?dateFrom=" + datefrom + "&dateTo=" + dateto;
			}
			// ���� ������ �Ѿ������
			if( !season.equals("") )
			{
				address += "?dateFrom=20" + season + "-08-01" + "&dateTo=20" + ( season + 1 ) + "-05-31";
			}
			// ����� �Ѿ����
			if( !month.equals("") )
			{
				address += "?dateFrom=" + month + "-01" + "&dateTo=" + month + "-31";
			}
			
//			System.out.println("address : " + address);
			//��ü ���� �� url ����
			URL url = new URL(address);
			URLConnection urlConn = url.openConnection();
			urlConn.setRequestProperty("X-Auth-token", "d5e1fe0b1f084179af33060ed794581f");
			///������ �޾ƿ���
			InputStreamReader inputStream = new InputStreamReader(urlConn.getInputStream(),"UTF-8");
			BufferedReader bufferRead = new BufferedReader(inputStream);
			//bufferedreader �ִ���� �޾ƿü��ֵ��� �ݺ�
			String str = null;		
			do
			{
				str = bufferRead.readLine();
				if( str != null ) ln += str;	
			}while(str != null);
			session.setAttribute(session_name,ln);
		}else{ System.out.println("API�� ���ǿ��� �޾ҽ��ϴ�."); }
//		System.out.println(ln);
		out.print(ln);
%>