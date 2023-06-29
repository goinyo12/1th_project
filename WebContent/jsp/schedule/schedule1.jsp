<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>����</title>
		<link href="../hfcss/header.css" rel="stylesheet" type="text/css">
		<link href="../hfcss/footer.css" rel="stylesheet" type="text/css">
		<link href="css/schedule.css" rel="stylesheet" type="text/css">
		<script src="../../js/jquery-3.6.3.js"></script>
	</head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<%
	String mcate = request.getParameter("mcate");
	%>
	<script>
	var prevMode = "";
	function SCseason(obj,mode)	//�������� ��ȸ 
	{
		if(mode == "")
		{
			mode = prevMode;	
		}
		prevMode = mode;
		
		// API�ּҿ� ��ū�� �ִ� schedule_CL.jsp�� ȣ����
		let date_url = "schedule_"+mode+".jsp";
		
		// ���� ��� ���ð��� ������
		if( $(obj).val() != "" )
		{
			// ȣ�� �ּҿ� �Ķ��Ÿ�� �߰���
			date_url += "?month=" + $(obj).val();
		}
			switch(mode) {
			 case "PLSC":  $(".leaguemenu a:nth-child(1)").css({"font-weight":"bold","color":"#ffffff"});
						 $(".leaguemenu a:nth-child(2)").css({"color":"#616161"});
				       	 $(".leaguemenu a:nth-child(3)").css({"color":"#616161"});
				       	 $(".leaguemenu a:nth-child(4)").css({"color":"#616161"});
				       	 $(".leaguemenu a:nth-child(5)").css({"color":"#616161"});
				       	 $(".leaguename").html("<span>�����̾��</span>");
					break;
	   	    case "PDSC":   $(".leaguemenu a:nth-child(1)").css({"color":"#616161"});
	   					 $(".leaguemenu a:nth-child(2)").css({"font-weight":"bold","color":"#ffffff"});
	   			       	 $(".leaguemenu a:nth-child(3)").css({"color":"#616161"});
	   			       	 $(".leaguemenu a:nth-child(4)").css({"color":"#616161"});
	   			       	 $(".leaguemenu a:nth-child(5)").css({"color":"#616161"});
	   			      	 $(".leaguename").html("<span>�󸮰�</span>");
	    			break;
	   	    case "SASC":   $(".leaguemenu a:nth-child(1)").css({"color":"#616161"});
	   					 $(".leaguemenu a:nth-child(2)").css({"color":"#616161"});
	   			       	 $(".leaguemenu a:nth-child(3)").css({"font-weight":"bold","color":"#ffffff"});
	   			       	 $(".leaguemenu a:nth-child(4)").css({"color":"#616161"});
	   			       	 $(".leaguemenu a:nth-child(5)").css({"color":"#616161"});
	   			      	 $(".leaguename").html("<span>������ A</span>");
	    			break;
	   	    case "BL1SC":  $(".leaguemenu a:nth-child(1)").css({"color":"#616161"});
	   					 $(".leaguemenu a:nth-child(2)").css({"color":"#616161"});
	   			         $(".leaguemenu a:nth-child(3)").css({"color":"#616161"});
	   			         $(".leaguemenu a:nth-child(4)").css({"font-weight":"bold","color":"#ffffff"});
	   			         $(".leaguemenu a:nth-child(5)").css({"color":"#616161"});
	   			      	 $(".leaguename").html("<span>�е�������</span>");
	    			break;
	   	    case "CLSC":   $(".leaguemenu a:nth-child(1)").css({"color":"#616161"});
	   					 $(".leaguemenu a:nth-child(2)").css({"color":"#616161"});
	   			       	 $(".leaguemenu a:nth-child(3)").css({"color":"#616161"});
	   			       	 $(".leaguemenu a:nth-child(4)").css({"color":"#616161"});
	   			       	 $(".leaguemenu a:nth-child(5)").css({"font-weight":"bold","color":"#ffffff"});
	   			      	 $(".leaguename").html("<span>è�Ǿ𽺸���</span>");
	    			break;
	   		}
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
					
					if(value.homeTeam.tla == null) { console.log("find null"); continue; };
					
					strHTML += "<tr><td class='date'id='date'>"+value.utcDate.replaceAll("-",".").substr(5,5)+"</td>"
					strHTML += "<td id='date'>"+value.utcDate.replaceAll("-",".").substr(11,5)+"</td>"
					strHTML += "<td class='home'>"+value.homeTeam.tla+"&nbsp;&nbsp;"
					strHTML += "<img src="+value.homeTeam.crest+"></td>"
					strHTML += "<td class='middle'>"+((value.score.fullTime.home == null) ? "" : value.score.fullTime.home) +"&nbsp;"+((value.score.fullTime.home == null) ? "vs" : ":")+"&nbsp;"+((value.score.fullTime.away == null) ? "" : value.score.fullTime.away )+"</td>"
					strHTML += "<td class='away'><img src="+value.awayTeam.crest+">"
					strHTML += "&nbsp;&nbsp;"+value.awayTeam.tla+"</td></tr>"
					
				}
				const html_for_null = "<tr><td colspan='100'>������ �����ϴ�</td></tr>";
				
				$(".leaguedata").html("<table class='leaguetable' border='1'>"
						+"<tr>"
						+"<th>��¥</th>"
						+"<th>�ð�</th>"
						+"<th colspan='3'>���</th>"
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
		
	}
	
	 //���۽� ����
	$(document).ready(function(){
			SCseason(this,'<%=mcate%>');
	}); 
	
	//�˻�
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
	//null ��ġȯ
	function isEmpty(value){
	    if(value == null || value.length === 0) {
	           return "";
	     } else{
	            return value;
	     }
	}
	</script>
<%@ include file="../include/header.jsp" %>
<!-- main ���� -->
		<div class="main">
		<div class="schedule_frame">
			<div class="leaguemenu">
				<a class="PLButton" onclick="SCseason(this,'PLSC')">�����̾��</a>&nbsp;|&nbsp;
				<a class="laButton" onclick="SCseason(this,'PDSC')">�󸮰�</a>&nbsp;|&nbsp;
				<a class="SAButton" onclick="SCseason(this,'SASC')">������ A</a>&nbsp;|&nbsp;
				<a class="buButton" onclick="SCseason(this,'BL1SC')">�е�������</a>&nbsp;|&nbsp;
				<a class="UEFAButton" onclick="SCseason(this,'CLSC')">è�Ǿ𽺸���</a>
			</div>
			<hr>
			<div class="selectFrame">
				 <b>2022-23����</b><br>
					<select name="selectBox" id="selectBox" onchange="SCseason(this,'');">
						<option value="none">===</option>
						<option value="2023-06">23-6</option>
						<option value="2023-05">23-5</option>
						<option value="2023-04">23-4</option>
						<option value="2023-03">23-3</option>
						<option value="2023-02">23-2</option>
						<option value="2023-01">23-1</option>
						<option value="2022-12">22-12</option>
						<option value="2022-11">22-11</option>
						<option value="2022-10">22-10</option>
						<option value="2022-09">22-9</option>
						<option value="2022-08">22-8</option>
						<option value="2022-07">22-7</option>
						<option value="2022-06">22-6</option>
					</select>
				<b>��</b>
			</div>
			<div class="leaguename">
			</div>
			<div class="leaguedata">
			</div>
		</div>
		</div>
	<!-- main �� -->
<%@ include file="../include/footer.jsp" %>