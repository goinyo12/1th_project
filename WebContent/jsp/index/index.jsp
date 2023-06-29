<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Kick Off</title>
		<link href="css/index.css" rel="stylesheet" type="text/css">
		<link href="../hfcss/header.css" rel="stylesheet" type="text/css">
		<link href="../hfcss/footer.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	</head>
	<script> 
	var today = new Date();
	
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);

	var dateString = month+'��'+day+'��';
	var dateString2 = year + "-" + month + "-" + day;
//	console.log(dateString);
//	console.log(dateString2);
	//è�Ǿ𽺸��� ajax ȣ��
	function rank1(){
		$.ajax
		({
			type:"get",
			url:"../rank/rank1_CL.jsp",
			dataType:"json",
			success: function(data)
			{	
				$(".leaguemenu a:nth-child(1)").css({"color":"#616161"});
				$(".leaguemenu a:nth-child(2)").css({"color":"#616161"});
               	$(".leaguemenu a:nth-child(3)").css({"color":"#616161"});
               	$(".leaguemenu a:nth-child(4)").css({"color":"#616161"});
               	$(".leaguemenu a:nth-child(5)").css({"font-weight":"bold","color":"#ffffff"});
				console.log("��ż���");
				var v  = "";
				for(const value of data.standings) //���� for��
				{
						for(const item of value.table)
						{
							value.group = value.group.replace("GROUP_A","A")
													 .replace("GROUP_B","B")
													 .replace("GROUP_C","C")
													 .replace("GROUP_D","D")
													 .replace("GROUP_E","E")
													 .replace("GROUP_F","F")
													 .replace("GROUP_G","G")
													 .replace("GROUP_H","H");
							item.team.tla =item.team.tla.replace("NAP","������")
														.replace("LIV","����Ǯ FC")
														.replace("FCP","������")
														.replace("CLU","Ŭ�� ����� KV")
														.replace("FCB","FC ���̿��� ����")
														.replace("INT","FC ���͹ж�")
														.replace("TOT","��Ʈ�� �ֽ��� FC")
														.replace("SGE","����Ʈ����Ʈ ����ũǪ��Ʈ	")
														.replace("CHE","ÿ�� FC")
														.replace("MIL","AC �ж�")
														.replace("RMA","���� ���帮�� CF")
														.replace("RBL","RB ������ġ��")
														.replace("MCI","��ü���� ��Ƽ FC")
														.replace("BVB","����þ� ����Ʈ��Ʈ")
														.replace("BEN","SL ����ī")
														.replace("PSG","�ĸ� �������� FC");
							if(item.position == "1" || item.position == "2")
							{
								v1  = "<tr><td class='cell' id='otherWD'>"+value.group+"</td>"
								v1 += "<td id='otherWD'>"+item.position+"</td>"
				           		v1 += "<td class='name'>"+"<img src="+item.team.crest+">"+"&nbsp;&nbsp;&nbsp;"+item.team.tla+"</td>"
				           		v1 += "<td id='otherWD'>"+item.playedGames+"</td>"
				           		v1 += "<td id='otherWD'>"+item.points+"</td>"
				           		v1 += "<td id='otherWD'>"+item.won+"</td>"
				           		v1 += "<td id='otherWD'>"+item.draw+"</td>"
				           		v1 += "<td id='otherWD'>"+item.lost+"</td>"
				           		v1 += "</tr>"
				           		v += v1 ;		
							}
			           		$(".leaguedata").html(
			           				"<table class='leaguetable' border='1'>"
			               			+"<tr>"
			               			+"<th id='otherWD'>��</th>"
			    			  		+"<th id='other'>����</th>"
			    			  		+"<th id='teamWD'>����</th>"
			    			  		+"<th id='other'>����</th>"
			    			  		+"<th id='otherWD'>����</th>"
			    			  		+"<th id='otherWD'>��</th>"
			    			  		+"<th id='otherWD'>��</th>"
			    			  		+"<th id='otherWD'>��</th>"
			    			  		+"</tr>"
			    			  		+v+"</table>");
			           		
			           		$(".cell").each(function(){
								var tempString = $(this).text();
								var cell_rows = $(".cell").filter(function(){
									return $(this).text() == tempString;
								});
								if(cell_rows.length > 1){
									cell_rows.eq(0).attr("rowspan", cell_rows.length);
									cell_rows.not(":eq(0)").remove();
								}
							});
						}
					
				}
				
			}
		});
	}	
	//�󸮰� ȣ��
	function rank(mome)
	{
		
		switch(mome) {
	    case "3_PD":  $(".leaguemenu a:nth-child(1)").css({"color":"#616161"});
					$(".leaguemenu a:nth-child(2)").css({"font-weight":"bold","color":"#ffffff"});
			       	$(".leaguemenu a:nth-child(3)").css({"color":"#616161"});
			       	$(".leaguemenu a:nth-child(4)").css({"color":"#616161"});
			       	$(".leaguemenu a:nth-child(5)").css({"color":"#616161"});
 			break;
	    case "4_SA":  $(".leaguemenu a:nth-child(1)").css({"color":"#616161"});
					$(".leaguemenu a:nth-child(2)").css({"color":"#616161"});
			       	$(".leaguemenu a:nth-child(3)").css({"font-weight":"bold","color":"#ffffff"});
			       	$(".leaguemenu a:nth-child(4)").css({"color":"#616161"});
			       	$(".leaguemenu a:nth-child(5)").css({"color":"#616161"});
 			break;
	    case "5_BL1":  $(".leaguemenu a:nth-child(1)").css({"color":"#616161"});
					$(".leaguemenu a:nth-child(2)").css({"color":"#616161"});
			       	$(".leaguemenu a:nth-child(3)").css({"color":"#616161"});
			       	$(".leaguemenu a:nth-child(4)").css({"font-weight":"bold","color":"#ffffff"});
			       	$(".leaguemenu a:nth-child(5)").css({"color":"#616161"});
 			break;
	    case "2_PL": $(".leaguemenu a:nth-child(1)").css({"font-weight":"bold","color":"#ffffff"});
					$(".leaguemenu a:nth-child(2)").css({"color":"#616161"});
			       	$(".leaguemenu a:nth-child(3)").css({"color":"#616161"});
			       	$(".leaguemenu a:nth-child(4)").css({"color":"#616161"});
			       	$(".leaguemenu a:nth-child(5)").css({"color":"#616161"});
 			break;
		}
		$.ajax
		({
               type:"get",
               url:"../rank/rank"+mome+".jsp",
               dataType:"json",
               success: function(data)
               {
               	console.log("��ż���");
               	var v  = "";
	           	$.each(data.standings[0].table, function(index, value)
	           	{
					/*�����̾�*/
	           		value.team.tla= value.team.tla.replace("ARS","�ƽ��� FC")
												  .replace("MCI","��ü���� ��Ƽ FC")
												  .replace("NEW","��ĳ�� ������Ƽ�� FC")
												  .replace("TOT","��Ʈ�� Ȫ���� FC")
												  .replace("MUN","��ü���� ������Ƽ�� FC")
												  .replace("BHA","�����ư �� ȣ�� �˺�� FC")
												  .replace("AVL","�ƽ��� ���� FC")
												  .replace("LIV","����Ǯ FC")
												  .replace("BRE","�귻Ʈ���� FC")
												  .replace("FUL","Ǯ�� FC")
												  .replace("CHE","ÿ�� FC")
												  .replace("CRY","ũ����Ż �Ӹ��� FC")
												  .replace("LEE","���� ������Ƽ�� FC")
												  .replace("WOL","�����ư �������� FC")
												  .replace("WHU","����Ʈ�� ������Ƽ�� FC")
												  .replace("EVE","������ FC")
												  .replace("NOT","���þ� ������Ʈ FC")
												  .replace("BOU","AFC ���ӽ�")
												  .replace("LEI","������ ��Ƽ FC")
												  .replace("SOU","�������� FC")
					/*�󸮰�	*/					  .replace("FCB","FC �ٸ����γ�")
												  .replace("RMA","���� ���帮��")
												  .replace("ATL","Ŭ��� ��Ʋ��Ƽ�� �� ���帮��")
												  .replace("RSO","���� �ҽÿ��ٵ�")
												  .replace("BET","���� ��Ƽ�� �߷��ǿ�")
												  .replace("VIL","��߷��� CF")
												  .replace("ATH","��Ʋ��ƽ Ŭ���")
												  .replace("RAY","��� �ٿ�ī��")
												  .replace("CEL","CA �������")
												  .replace("OSA","RC ��Ÿ �� ���")
												  .replace("GIR","���γ� FC")
												  .replace("MAL","RCD ���丣ī")
												  .replace("SEV","����� FC")
												  .replace("GET","��Ÿ�� CF")
												  .replace("CAD","ī�� CF")
												  .replace("VDD","���� �پߵ�����")
												  .replace("VAL","�߷��þ� CF")
												  .replace("ESP","RCD �����Ĵ�")
												  .replace("ALM","UD �˸޸���")
												  .replace("ELC","��ü CF")
					/*������A*/					  .replace("NAP","SSC ������")
												  .replace("LAZ","SS ��ġ��")
												  .replace("MIL","AC �ж�")
												  .replace("INT","AS �θ�")
												  .replace("ROM","FC ���͹ж�")
												  .replace("ATA","��Ż��Ÿ BC")
												  .replace("JUV","�������� FC")
												  .replace("BOL","���γ� FC 1909")
												  .replace("FIO","ACF �ǿ���Ƽ��")
												  .replace("TOR","�丮�� FC")
												  .replace("UDI","���׼� Į��")
												  .replace("SAS","US ����÷� Į��")
												  .replace("MON","����")
												  .replace("EMP","������ FC")
												  .replace("SAL","�췹����Ÿ��")
												  .replace("USL","US ��ü")
												  .replace("SPE","��������")
												  .replace("HVE","���� ���γ� FC")
												  .replace("SAM","UC ����������")
												  .replace("CRE","US ũ����׼�")
					/*�е���*/					  .replace("FCB","FC ���̿��� ����")
												  .replace("BVB","����þ� ����Ʈ��Ʈ")
												  .replace("UNB","FC ��Ͽ� ������")
												  .replace("SCF","SC �����̺θ�ũ")
												  .replace("RBL","RB ������ġ��")
												  .replace("SGE","����Ʈ����Ʈ ����ũǪ��Ʈ")
												  .replace("B04","TSV ���̾� 04 ��������")
												  .replace("M05","FSV ������ 05")
												  .replace("WOB","VfL �������θ�ũ")
												  .replace("BMG","����þ� ����۶�Ʈ����")
												  .replace("SVW","SV ������ �극��")
												  .replace("FCA","FC �ƿ�ũ���θ�ũ")
												  .replace("KOE","FC �븥")
												  .replace("BOC","VfL ����")
												  .replace("TSG","TSG 1899 ȣ������")
												  .replace("BSC","�츣Ÿ BSC")
												  .replace("S04","FC ���� 04")
												  .replace("VFB","VfB ����Ʈ����Ʈ");
	           		if(value.position <11)
	           		{
	           			v1  = "<tr><td id='otherWD'>"+value.position+"</td>"
		           		v1 += "<td class='name'>"+"<img src="+value.team.crest+">"+"&nbsp;&nbsp;&nbsp;"+value.team.tla+"</td>"
		           		v1 += "<td id='otherWD'>"+value.playedGames+"</td>"
		           		v1 += "<td id='otherWD'>"+value.points+"</td>"
		           		v1 += "<td id='otherWD'>"+value.won+"</td>"
		           		v1 += "<td id='otherWD'>"+value.draw+"</td>"
		           		v1 += "<td id='otherWD'>"+value.lost+"</td>"
		           		v1 += "</tr>"
		           		v += v1 ;
	           		}
	           		$(".leaguedata").html(
           				"<table class='leaguetable' border='1'>"
               			+"<tr>"
    			  		+"<th id='other'>����</th>"
    			  		+"<th id='teamWD'>����</th>"
    			  		+"<th id='other'>����</th>"
    			  		+"<th id='otherWD'>����</th>"
    			  		+"<th id='otherWD'>��</th>"
    			  		+"<th id='otherWD'>��</th>"
    			  		+"<th id='otherWD'>��</th>"
    			  		+"</tr>"
    			  		+v+"</table>"); 
	           	 })
               }
       	});
	}
	
	function Season(mome,sDate,eDate)
	{
		let date_url = "../schedule/schedule_"+ mome +".jsp?fDate="+ sDate + "&eDate=" + eDate;
		$.ajax
		({
			type: "get",
			url: date_url,
			dataType:"json",
			success: function(data)
			{	
				
				var strHTML  = "";
				for(const value of data.matches)
				{
//					console.log(value.utcDate.replaceAll("-",".").substr(5,5));
//					console.log(value.homeTeam.name);
					/*�����̾�*/
	           		value.homeTeam.tla= value.homeTeam.tla.replace("ARS","�ƽ��� FC")
												  .replace("MCI","��ü���� ��Ƽ FC")
												  .replace("NEW","��ĳ�� ������Ƽ�� FC")
												  .replace("TOT","��Ʈ�� Ȫ���� FC")
												  .replace("MUN","��ü���� ������Ƽ�� FC")
												  .replace("BHA","�����ư �� ȣ�� �˺�� FC")
												  .replace("AVL","�ƽ��� ���� FC")
												  .replace("LIV","����Ǯ FC")
												  .replace("BRE","�귻Ʈ���� FC")
												  .replace("FUL","Ǯ�� FC")
												  .replace("CHE","ÿ�� FC")
												  .replace("CRY","ũ����Ż �Ӹ��� FC")
												  .replace("LEE","���� ������Ƽ�� FC")
												  .replace("WOL","�����ư �������� FC")
												  .replace("WHU","����Ʈ�� ������Ƽ�� FC")
												  .replace("EVE","������ FC")
												  .replace("NOT","���þ� ������Ʈ FC")
												  .replace("BOU","AFC ���ӽ�")
												  .replace("LEI","������ ��Ƽ FC")
												  .replace("SOU","�������� FC")
					/*�󸮰�	*/					  .replace("FCB","FC �ٸ����γ�")
												  .replace("RMA","���� ���帮��")
												  .replace("ATL","Ŭ��� ��Ʋ��Ƽ�� �� ���帮��")
												  .replace("RSO","���� �ҽÿ��ٵ�")
												  .replace("BET","���� ��Ƽ�� �߷��ǿ�")
												  .replace("VIL","��߷��� CF")
												  .replace("ATH","��Ʋ��ƽ Ŭ���")
												  .replace("RAY","��� �ٿ�ī��")
												  .replace("CEL","CA �������")
												  .replace("OSA","RC ��Ÿ �� ���")
												  .replace("GIR","���γ� FC")
												  .replace("MAL","RCD ���丣ī")
												  .replace("SEV","����� FC")
												  .replace("GET","��Ÿ�� CF")
												  .replace("CAD","ī�� CF")
												  .replace("VDD","���� �پߵ�����")
												  .replace("VAL","�߷��þ� CF")
												  .replace("ESP","RCD �����Ĵ�")
												  .replace("ALM","UD �˸޸���")
												  .replace("ELC","��ü CF")
					/*������A*/					  .replace("NAP","SSC ������")
												  .replace("LAZ","SS ��ġ��")
												  .replace("MIL","AC �ж�")
												  .replace("INT","AS �θ�")
												  .replace("ROM","FC ���͹ж�")
												  .replace("ATA","��Ż��Ÿ BC")
												  .replace("JUV","�������� FC")
												  .replace("BOL","���γ� FC 1909")
												  .replace("FIO","ACF �ǿ���Ƽ��")
												  .replace("TOR","�丮�� FC")
												  .replace("UDI","���׼� Į��")
												  .replace("SAS","US ����÷� Į��")
												  .replace("MON","����")
												  .replace("EMP","������ FC")
												  .replace("SAL","�췹����Ÿ��")
												  .replace("USL","US ��ü")
												  .replace("SPE","��������")
												  .replace("HVE","���� ���γ� FC")
												  .replace("SAM","UC ����������")
												  .replace("CRE","US ũ����׼�")
					/*�е���*/					  .replace("FCB","FC ���̿��� ����")
												  .replace("BVB","����þ� ����Ʈ��Ʈ")
												  .replace("UNB","FC ��Ͽ� ������")
												  .replace("SCF","SC �����̺θ�ũ")
												  .replace("RBL","RB ������ġ��")
												  .replace("SGE","����Ʈ����Ʈ ����ũǪ��Ʈ")
												  .replace("B04","TSV ���̾� 04 ��������")
												  .replace("M05","FSV ������ 05")
												  .replace("WOB","VfL �������θ�ũ")
												  .replace("BMG","����þ� ����۶�Ʈ����")
												  .replace("SVW","SV ������ �극��")
												  .replace("FCA","FC �ƿ�ũ���θ�ũ")
												  .replace("KOE","FC �븥")
												  .replace("BOC","VfL ����")
												  .replace("TSG","TSG 1899 ȣ������")
												  .replace("BSC","�츣Ÿ BSC")
												  .replace("S04","FC ���� 04")
												  .replace("VFB","VfB ����Ʈ����Ʈ");
	           		/*�����̾�*/
	           		value.awayTeam.tla= value.awayTeam.tla.replace("ARS","�ƽ��� FC")
												  .replace("MCI","��ü���� ��Ƽ FC")
												  .replace("NEW","��ĳ�� ������Ƽ�� FC")
												  .replace("TOT","��Ʈ�� Ȫ���� FC")
												  .replace("MUN","��ü���� ������Ƽ�� FC")
												  .replace("BHA","�����ư �� ȣ�� �˺�� FC")
												  .replace("AVL","�ƽ��� ���� FC")
												  .replace("LIV","����Ǯ FC")
												  .replace("BRE","�귻Ʈ���� FC")
												  .replace("FUL","Ǯ�� FC")
												  .replace("CHE","ÿ�� FC")
												  .replace("CRY","ũ����Ż �Ӹ��� FC")
												  .replace("LEE","���� ������Ƽ�� FC")
												  .replace("WOL","�����ư �������� FC")
												  .replace("WHU","����Ʈ�� ������Ƽ�� FC")
												  .replace("EVE","������ FC")
												  .replace("NOT","���þ� ������Ʈ FC")
												  .replace("BOU","AFC ���ӽ�")
												  .replace("LEI","������ ��Ƽ FC")
												  .replace("SOU","�������� FC")
					/*�󸮰�	*/					  .replace("FCB","FC �ٸ����γ�")
												  .replace("RMA","���� ���帮��")
												  .replace("ATL","Ŭ��� ��Ʋ��Ƽ�� �� ���帮��")
												  .replace("RSO","���� �ҽÿ��ٵ�")
												  .replace("BET","���� ��Ƽ�� �߷��ǿ�")
												  .replace("VIL","��߷��� CF")
												  .replace("ATH","��Ʋ��ƽ Ŭ���")
												  .replace("RAY","��� �ٿ�ī��")
												  .replace("CEL","CA �������")
												  .replace("OSA","RC ��Ÿ �� ���")
												  .replace("GIR","���γ� FC")
												  .replace("MAL","RCD ���丣ī")
												  .replace("SEV","����� FC")
												  .replace("GET","��Ÿ�� CF")
												  .replace("CAD","ī�� CF")
												  .replace("VDD","���� �پߵ�����")
												  .replace("VAL","�߷��þ� CF")
												  .replace("ESP","RCD �����Ĵ�")
												  .replace("ALM","UD �˸޸���")
												  .replace("ELC","��ü CF")
					/*������A*/					  .replace("NAP","SSC ������")
												  .replace("LAZ","SS ��ġ��")
												  .replace("MIL","AC �ж�")
												  .replace("INT","AS �θ�")
												  .replace("ROM","FC ���͹ж�")
												  .replace("ATA","��Ż��Ÿ BC")
												  .replace("JUV","�������� FC")
												  .replace("BOL","���γ� FC 1909")
												  .replace("FIO","ACF �ǿ���Ƽ��")
												  .replace("TOR","�丮�� FC")
												  .replace("UDI","���׼� Į��")
												  .replace("SAS","US ����÷� Į��")
												  .replace("MON","����")
												  .replace("EMP","������ FC")
												  .replace("SAL","�췹����Ÿ��")
												  .replace("USL","US ��ü")
												  .replace("SPE","��������")
												  .replace("HVE","���� ���γ� FC")
												  .replace("SAM","UC ����������")
												  .replace("CRE","US ũ����׼�")
					/*�е���*/					  .replace("FCB","FC ���̿��� ����")
												  .replace("BVB","����þ� ����Ʈ��Ʈ")
												  .replace("UNB","FC ��Ͽ� ������")
												  .replace("SCF","SC �����̺θ�ũ")
												  .replace("RBL","RB ������ġ��")
												  .replace("SGE","����Ʈ����Ʈ ����ũǪ��Ʈ")
												  .replace("B04","TSV ���̾� 04 ��������")
												  .replace("M05","FSV ������ 05")
												  .replace("WOB","VfL �������θ�ũ")
												  .replace("BMG","����þ� ����۶�Ʈ����")
												  .replace("SVW","SV ������ �극��")
												  .replace("FCA","FC �ƿ�ũ���θ�ũ")
												  .replace("KOE","FC �븥")
												  .replace("BOC","VfL ����")
												  .replace("TSG","TSG 1899 ȣ������")
												  .replace("BSC","�츣Ÿ BSC")
												  .replace("S04","FC ���� 04")
												  .replace("VFB","VfB ����Ʈ����Ʈ");
					if(value.homeTeam.name == null) { console.log("find null"); continue; };
					strHTML += "<tr><td class='date'id='date'>"+value.utcDate.replaceAll("-",".").substr(5,5)+"</td>"
					strHTML += "<td id='date'>"+value.utcDate.replaceAll("-",".").substr(11,5)+"</td>"
					strHTML += "<td class='home'>"+value.homeTeam.tla+"&nbsp;&nbsp;"
					strHTML += "<img src="+value.homeTeam.crest+"></td>"
					strHTML += "<td id='other'>"+((value.score.fullTime.home == null) ? "" : value.score.fullTime.home) +"&nbsp;"+((value.score.fullTime.home == null) ? "vs" : ":")+"&nbsp;"+((value.score.fullTime.away == null) ? "" : value.score.fullTime.away )+"</td>"
					strHTML += "<td class='away'><img src="+value.awayTeam.crest+">"
					strHTML += "&nbsp;&nbsp;"+value.awayTeam.tla+"</td></tr>"
				}
		
				const html_for_null = "<tr><td colspan='100' style='text-align:center; height:70px;'>������ �����ϴ�</td></tr>";
				$(".chams").html(
						"<table class='chamstbl' border='1'>"
						+"<tr>"
						+"<th>��¥</th>"
						+"<th>�ð�</th>"
						+"<th colspan='3' id='playedgame'>���</th>"
						+"</tr>"
						+ ((strHTML == "")? html_for_null : strHTML ) +"</table>"
				);
				 $(".date").each(function(){
					var tempString = $(this).text();
					var date_rows = $(".date").filter(function(){
						return $(this).text() == tempString; });

					if(date_rows.length > 1){
						date_rows.eq(0).attr("rowspan", date_rows.length);
						date_rows.not(":eq(0)").remove();
					}
				}); 
			}
		});
		switch(mome) {
	    case "PL":  $(".leaguemenu2 a:nth-child(1)").css({"font-weight":"bold","color":"#ffffff"});
					$(".leaguemenu2 a:nth-child(2)").css({"color":"#616161"});
			       	$(".leaguemenu2 a:nth-child(3)").css({"color":"#616161"});
			       	$(".leaguemenu2 a:nth-child(4)").css({"color":"#616161"});
			       	$(".leaguemenu2 a:nth-child(5)").css({"color":"#616161"});
	         break;
	    case "PD":  $(".leaguemenu2 a:nth-child(1)").css({"color":"#616161"});
					$(".leaguemenu2 a:nth-child(2)").css({"font-weight":"bold","color":"#ffffff"});
			       	$(".leaguemenu2 a:nth-child(3)").css({"color":"#616161"});
			       	$(".leaguemenu2 a:nth-child(4)").css({"color":"#616161"});
			       	$(".leaguemenu2 a:nth-child(5)").css({"color":"#616161"});
 			break;
	    case "SA":  $(".leaguemenu2 a:nth-child(1)").css({"color":"#616161"});
					$(".leaguemenu2 a:nth-child(2)").css({"color":"#616161"});
			       	$(".leaguemenu2 a:nth-child(3)").css({"font-weight":"bold","color":"#ffffff"});
			       	$(".leaguemenu2 a:nth-child(4)").css({"color":"#616161"});
			       	$(".leaguemenu2 a:nth-child(5)").css({"color":"#616161"});
 			break;
	    case "BL1":  $(".leaguemenu2 a:nth-child(1)").css({"color":"#616161"});
					$(".leaguemenu2 a:nth-child(2)").css({"color":"#616161"});
			       	$(".leaguemenu2 a:nth-child(3)").css({"color":"#616161"});
			       	$(".leaguemenu2 a:nth-child(4)").css({"font-weight":"bold","color":"#ffffff"});
			       	$(".leaguemenu2 a:nth-child(5)").css({"color":"#616161"});
 			break;
	    case "CL": $(".leaguemenu2 a:nth-child(1)").css({"color":"#616161"});
					$(".leaguemenu2 a:nth-child(2)").css({"color":"#616161"});
			       	$(".leaguemenu2 a:nth-child(3)").css({"color":"#616161"});
			       	$(".leaguemenu2 a:nth-child(4)").css({"color":"#616161"});
			       	$(".leaguemenu2 a:nth-child(5)").css({"font-weight":"bold","color":"#ffffff"});
 			break;
		}
	}
	
	$(document).ready(function(){
		$(".news_h2").html(
				"<h1>"+dateString+"&nbsp;&nbsp;&nbsp;���� ����</h1>"	
		) 
		Season("PL",dateString2,dateString2);
		rank("2_PL");
	});
	function DoSearch()
	{
		if($(".searcher").val() == "")
		{
			alert("�˻�� �Է����ּ���.")
			return;
		}
		else
		{
			$("#top_search").submit();
		}
	}
	</script>
	<%@ include file="../include/header.jsp" %>
<%
ListDTO dto = new ListDTO();

ArrayList<PostVO> news  = dto.GetNewsList(6,1, "a", "r", "", "s_all");
ArrayList<PostVO> news2 = dto.GetNewsList(10,1, "a", "v", "", "s_all");
ArrayList<PostVO> main  = dto.GetNewsList(3,1, "a", "v", "", "s_all");
ArrayList<PostVO> video = dto.GetVideoList(4,1, "a", "a","r", "", "s_all");
ArrayList<PostVO> board = dto.GetBoardList(10,1, "a", "r", "", "s_all");
%>
	<!-- main ���� -->
		<div class="main">
			<div class="section">
				<input type="radio" name="slide" id="slide01" checked>
				<input type="radio" name="slide" id="slide02">
				<input	 type="radio" name="slide" id="slide03">
				<div class="slidewrap">
					<ul class="slidelist">
						<!-- �����̵� ���� -->
						<%
						for(PostVO vo : main)
						{
							String title1 = vo.getPost_title();
							String title2 = vo.getPost_title();
							if(title1.length() > 20)
							{
								title1  = title1.substring(0,14);
								title1 += "<br>";
								title2  = title2.substring(14);
								title1 += title2;
							}
							%>
							<li class="slideitem">
							<a href="/kick_off_view/jsp/news/news_view.jsp?no=<%= vo.getPost_no() %>">
								<div class="textbox">
									<h3><%= title1 %></h3>
								</div>
								<img src="../../file/<%= vo.getPost_oname() %>">
							</a>
						</li>
							<%
						}
						%>
						<!-- ��,�� �����̵� ��ư -->
						<div class="slide-control">
							<div>
								<label for="slide03" class="left"></label>
								<label for="slide02" class="right"></label>
							</div>
							<div>
								<label for="slide01" class="left"></label>
								<label for="slide03" class="right"></label>
							</div>
							<div>
								<label for="slide02" class="left"></label>
								<label for="slide01" class="right"></label>
							</div>
						</div>
					</ul>
					<!-- ����¡ -->
					<ul class="slide-pagelist">
						<li><label for="slide01"></label></li>
						<li><label for="slide02"></label></li>
						<li><label for="slide03"></label></li>
					</ul>
				</div>
			</div>
			<div class="index_frame">
				<div class="news_list">
					<div class="news_h1">
						<h1>����</h1>
					</div>
					<div class="news_detail">
						<a href="/kick_off_view/jsp/news/news.jsp">������+</a>
					</div>
					<table class="news_listtbl" >
					<%
					int index = 0;
					for(PostVO vo: news)
					{
						if(index%2==0)
						{
							%><tr><%
						}
						String title = vo.getPost_title();
						if(title.length() > 50)
						{
							title  = title.substring(0,50);
							title += "...";
						}
						%>
							<td>
								<table class="news_frame">
									<tr>
										<td rowspan="2">
											<a href="/kick_off_view/jsp/news/news_view.jsp?no=<%= vo.getPost_no() %>">
											<%
											if(vo.getPost_oname().equals("") || vo.getPost_oname() == null)
											{
												%>
												<img src="../../img/news2.jpg" class="thumbnail">
												<%
											}
											else
											{
												%>
												<img src="../../file/<%= vo.getPost_oname() %>" class="thumbnail">
												<%
											}
											%>
											</a>
										</td>
										<td><a href="/kick_off_view/jsp/news/news_view.jsp?no=<%= vo.getPost_no() %>"><%= title %></a></td>
									</tr>
								</table>
							</td>
						<%
						if(index%2==1)
						{
							%></tr><%
						}
						index++;
					}
					%>
					</table>
				</div>
					<div class="video_list">
						<div class="news_h1">
							<h1>����</h1>
						</div>
						<div class="news_detail">
							<a href="/kick_off_view/jsp/video/video.jsp">������+</a>
						</div>
						<table>
							<tr>
								<td class="video_box">
								<%
								for(PostVO vo : video)
								{
									String title = vo.getPost_title();
									if(title.length() > 17)
									{
										title  = title.substring(0,17);
										title += "...";
									}
									%>
									<div class="video_frame">
										<a href="/kick_off_view/jsp/video/video_view.jsp?no=<%= vo.getPost_no() %>">
											<%
											if(vo.getPost_video().equals("") || vo.getPost_video() == null)
											{
												%>
												<img src="img/news2.jpg" class="video_thumbnail">
												<%
											}
											else
											{
												%>
												<img src="https://img.youtube.com/vi/<%= vo.getPost_video() %>/maxresdefault.jpg" class="video_thumbnail">
												<%
											}
											%>
										</a><br>
										<a href="/kick_off_view/jsp/video/video_view.jsp" class="video_title"><%= title %></a><br>
										<span class="video_date"><%= vo.getPost_date() %></span>
									</div>
									<%
								}
								%>
								</td>
							</tr>
						</table>
					</div>
					<div class="board_center">
						<table class="bottom">
							<tr>
								<td>
									<div class="news_h1">
										<h1>���� �� ����</h1>
									</div>
									<div class="news_detail">
										<a href="/kick_off_view/jsp/news/news.jsp">������+</a>
									</div>
									<br><br><br>
									<table>
										<tr>
											<td  class="table_ul"> 
												<ul>
												<%
												for(PostVO vo : news2)
												{
													String title = vo.getPost_title();
													if(title.length() > 20)
													{
														title  = title.substring(0,20);
														title += "...";
													}
													%>
													<li><a href="/kick_off_view/jsp/news/news_view.jsp?no=<%= vo.getPost_no() %>"><%= title %></a></li>
													<%
												}
												%>
												</ul>
											</td>
										</tr>
									</table>
								</td>
								<td>
									<div class="news_h1">
										<h1>�Խ���</h1>
									</div>
									<div class="news_detail">
										<a href="/kick_off_view/jsp/board/board_list.jsp">������+</a>
									</div>
									<br><br><br>
									<table>
										<tr>
											<td  class="table_ul">
												<ul>
												<%
												for(PostVO vo : board)
												{
													String title = vo.getPost_title();
													if(title.length() > 20)
													{
														title  = title.substring(0,20);
														title += "...";
													}
													%>
													<li><a href="/kick_off_view/jsp/board/board_view.jsp?no=<%= vo.getPost_no() %>"><%= title %></a></li>
													<%
												}
												%>
												</ul>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
					<div class="board_center">
						<table class="bottom">
							<tr>
								<td id="VT">
									<div class="news_h1" >
										<h1>����</h1>
									</div>
									<div class="news_detail">
										<a href="/kick_off_view/jsp/rank/rank1.jsp">������+</a>
									</div>
									<br><br><br>
									<div class="leaguemenu">
										<a class="PLButton" onclick="rank('2_PL');">�����̾��</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a class="laButton" onclick="rank('3_PD');">�󸮰�</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a class="SAButton" onclick="rank('4_SA');">������ A</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a class="buButton" onclick="rank('5_BL1');">�е�������</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a class="UEFAButton" onclick="rank1();">è�Ǿ𽺸���</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
									<br>
									<div class="leaguedata">
									</div>
								</td>
								<td id="VT">
									<div class="news_h2">
									</div>
									<div class="news_detail">
										<a href="/kick_off_view/jsp/schedule/result_schedule.jsp">������+</a>
									</div>
									<br><br><br>
									<div class="leaguemenu2">
										<a class="PLButton" onclick="Season('PL',dateString2,dateString2);">�����̾��</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a class="laButton" onclick="Season('PD',dateString2,dateString2);">�󸮰�</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a class="SAButton" onclick="Season('SA',dateString2,dateString2);">������ A</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a class="buButton" onclick="Season('BL1',dateString2,dateString2);">�е�������</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a class="UEFAButton" onclick="Season('CL',dateString2,dateString2);">è�Ǿ𽺸���</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
									<br>
									<div class="chams">
									</div>
								</td>
							</tr>
						</table>
					</div>
			 </div>
		</div>
		<!-- main �� -->
<%@ include file="../include/footer.jsp" %>