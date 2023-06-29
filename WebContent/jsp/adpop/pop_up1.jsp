<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kickoff.dto.*" %>
<%@ page import="kickoff.dao.*" %>
<%@ page import="kickoff.vo.*" %>
<%@ page import="java.util.*" %>
<script src="../../js/jquery-3.6.3.js"></script>
<% 
String no = request.getParameter("no");

if( no == null || no.equals("") ) { return; }

PostDTO post   = new PostDTO();
ad_listDTO dto = new ad_listDTO();
pop_upDTO popDTO = new pop_upDTO();
ArrayList<analyze1VO> word_list1  = popDTO.Read1(no);
PostVO vo = popDTO.Read(no);

ArrayList<ad_managerVO> list = dto.GetList();

pythonbrowse test = new pythonbrowse();

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>�м��˾�1</title>	
	</head>			
<style>
	@import url('https://fonts.googleapis.com/css2?family=Hahmlet&display=swap');
	
	body
	{
		background-color:#0c0c0c;
		color:#FFFFFF;
		font-family: 'Hahmlet', serif;
	}
	
	.side_ad_div
	{
		padding:auto;
		background-color:#0c0c0c;
		width:100%; 
	}
	
	table
	{
		border-collapse:collapse;
		border:1px solid white;
		width:100%;
	}
	
	th
	{
		padding:10px 3px;
		border:1px solid white;
		color:white;
	}
	
	td
	{
		text-align:center;
		border:1px solid white;
		color:white;
	}
	
	.title
	{
		font-size:20px;
	}
	
	.data_img
	{
		width:460px;
		height:100%;
		object-fit: cover;
	}
	
	.left_div
	{
		margin: 0 0 0 0;
		width:450px;
	}
	
	.rifgt_div
	{
		
	}
	.pybutton
	{
		width:150px;
		height:50px;
		cursor:pointer;
		background-color:#cccccc;
		color:black;
		font-weight:800;
		font-size:15pt;
		padding:1px 9px 4px 9px;
		border:1px solid white;
		text-align:center;
		
	}
</style>
<script>
window.onload = function()
{	
	$("#tap1,#tap2,#tap3,#tap4,#tap5").click(function(){
		var tapID = $(this).attr("id");
		
		$("#tap_table1,#tap_table2,#tap_table3,#tap_table4,#tap_table5").css("display","none");
		switch(tapID)
		{
			case "tap1" : $("#tap_table1").toggle();
				break;
			case "tap2" : $("#tap_table2").toggle();
				break;
			case "tap3" : $("#tap_table3").toggle();
				break;
			case "tap4" : $("#tap_table4").toggle();
				break;
			case "tap5" : $("#tap_table5").toggle();
				break;
		}
	});
	
	$("#tap1,#tap2,#tap3,#tap4,#tap5")
	.mouseover(function(){
		$(this).css("background-color","black");
	})
	.mouseout(function(){
		$(this).css("background-color","black");
	});
	
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	$("#click_pop").click(function(){
		var tapID = $(this).attr("id");
		
		$("#mini_pop").css("display","none")
		{
			$("#mini_pop").toggle();
		}
	});
	
	$("#click_pop")
	.mouseover(function(){
		$(this).css("background-color","black");
	})
	.mouseout(function(){
		$(this).css("background-color","black");
	});
	
	$("#mini_pop").mouseleave(function(){
		$(this).toggle();
	});

}
</script>
<body>
	<div class="side_ad_div">
		<table>
			<tr>
				<th width="30%" class="title">����������</th>
				<th width="35%" class="title">���������</th>
				<th class="title">��������</th>
			</tr>
			<tr>
				<td style="vertical-align:top;width:464px;">
					<table>
						<tr>
							<th>�Խù� �����</th>
							<td><%= vo.getPost_posneg() %></td>
						</tr>
						<tr>
							<th>����� �ۼ�Ʈ</th>
							<td><%= vo.getPost_percent() %> %</td>
						</tr>
						<tr>
							<th colspan="2">���庰 �����</th>
						</tr>
						<tr>
							<td colspan="2">
								<table>
									<tr>
										<td colspan="4">
											<table border="1">
												<tr>
													<td class="data_img"><img class="data_img" src="../../python/pos_neg/pos_neg_fig/<%= vo.getPost_figname() %>"></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<td style="vertical-align: top;">
					<div class="left_div">
						<table>
							<tr>
								<th>�󵵼�</th>
								<th>��  ��</th>
								<th>�����ܾ�</th>
								<th>�ܾ�� �����ܾ��� ���絵</th>
							</tr>
							<%
							ad_managerVO ad_vo = null;
							String ad_key = "";
							String ans_key = "";
							String ans_per = "";
							String find_ad_key = "";
							
							int flag = 0;
							// �� ����Ʈ �ݺ�
							for( analyze1VO item : word_list1 )
							{
								int count = 0;
								// ���� �ܾ� ����Ʈ �ݺ�
								ArrayList<analyze2VO> word_list2  = popDTO.Read2(item.getAnal_no());
								for( analyze2VO object : word_list2 )
								{
									// ��Ī�� ���� ã�� ��������
									if( flag == 0 )
									{
										if( count == 0 ){	// �� �ܾ�� �˻�
											ad_key = item.getMorph_origin_key();
										}else{	// �����ܾ�� �˻�
											ad_key = object.getMorph_relation_key();
										}
										System.out.println("�˻��� Ű���� : " + ad_key);
										int ad_no = popDTO.Find_ad(ad_key);	// �˻� �� Ű����� ���� �˻��Ѵ�
										if( ad_no > 0 ){
											ad_vo = popDTO.Read_ad(ad_no);
											if( ad_vo == null) return;
											flag = 1;
											find_ad_key = item.getMorph_origin_key();
											System.out.println(find_ad_key + "("+ad_key+")�� ���� �˻��Ǿ����ϴ�.\nflag : " + flag );
										} // ���� ��ȣ�� �Ѿ���� ���� �˻��Ȱ� : ���� ��ȣ�� ���� vo��ü�� ����
										// ���� ��ü�� �����Ǿ����� �÷��׸� ����
									}
							%>		<tr id="click_pop"> <%
									String style = "";
									if( count == 0 )
									{
										
										if( flag == 1 && item.getMorph_origin_key().equals(ad_key) ) {
											ans_key = item.getMorph_origin_key();
											ans_per = "";
											style = "style='background-color:silver; color:black;'";
										}	%>
										<td rowspan="5"><%= item.getAnal_count() %></td>
										<td rowspan="5" <%= style %>><%= item.getMorph_origin_key() %></td> <%
										style = "";
									}
									if( flag == 1 && object.getMorph_relation_key().equals(ad_key) ) {
										style = "style='background-color:silver; color:black;'";
										ans_key = object.getMorph_relation_key();
										ans_per = object.getSim().substring(0,6);
									}
							%>
										<td <%= style %>><%= object.getMorph_relation_key() %></td>
										<td <%= style %>><%= object.getSim().substring(0,6) %></td>
									</tr>	<%
									count++;
								}
//								if( flag != 0 )	{ break; }
							}
								%>
						</table>
					</div>
				</td>
				<td>
					<%
						String[] keyword = null;
						if(ad_vo != null)
						{
							keyword = ad_vo.getAd_keyword().split(",");
						}
					%>
					<div class="right_div">
<%-- 						<table width="100%">
							<%
							for(ad_managerVO LVO : list)
							{
								String keyword[] = (LVO.getAd_keyword()).split(",");
							%>
							<tr>
								<td><%= keyword[0] %></td><td rowspan="5"><%= LVO.getAd_name() %></td>
							</tr>
							<tr>
								<td><%= keyword[1] %></td>
							</tr>
							<tr>
								<td><%= keyword[2] %></td>
							</tr>
							<tr>
								<td><%= keyword[3] %></td>
							</tr>
							<tr>
								<td><%= keyword[4] %></td>
							</tr>
							<%
							}
							%>
						</table> --%>
						<%
						if( keyword != null && ad_vo.getAd_name() != null)
						{
							String style = "style='height:200px; font-weight:bold; font-size:15pt;'";
						%>
							<table width="100%">
								<tr>
									<th>�����ܾ�</th>
									<th>���絵</th>
								</tr>
								<tr>
									<td><%= ans_key %></td>
									<td><%= ans_per %></td>
								</tr>
							</table>
							<br><br>
							<table width="100%">
								<tr>
									<th>����Ű����</th><th>�����̸�</th>
								</tr>
								<tr>
									<td <%= style %>><%= ans_key %></td>
									<td rowspan="5" <%= style %>><%= ad_vo.getAd_name() %></td>
								</tr>
							</table>
							<br><br>
							<script>
							function OpenGraph()
							{
								if(confirm("�׷��� �������� �̵��Ͻðڽ��ϱ�?") == false)
								{
									return;
								}
								$.ajax({
									type    : "get",
									url     : "/kick_off_view/jsp/adpop/graphlink.jsp?ans_key=<%= find_ad_key %>" ,
									dataType: "html",
									success : function(data) 
									{	
										// ����� ���������� �̷�������� �� �Լ��� Ÿ�Եȴ�.
										return;
									}
								});
							}
							</script>
							<input type="button" class="pybutton" onclick="OpenGraph();" value="�׷�������">
						<%
						}else
						{
						%>
							<table style="display:none;" width="100%">
								<tr>
									<td></td><td rowspan="5"></td>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td></td>
								</tr>
							</table>
						<%
						}
						%>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>