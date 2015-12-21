<%@page import="PosVO.CuNameVO"%>
<%@page import="PosDAO.PosDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="PosVO.WorkerListVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<style>
#getorout
{
display:block;
margin : 0 28px;
}
#contentgowork {
float:left;
border: 1px solid #ddd;
height: 100px;
padding: 30px;
width : 400px;
border-radius: 10px 10px 10px 10px;
}
#workerlist
{
float: left;
border: 1px solid #ddd;
height: 100px;
padding: 10px 20px;
width : 370px;
margin-left:28px;
border-radius: 10px 10px 10px 10px;
}
#num1{
width: 200px;
display:block;
margin:0 5px 0 0;
float: left;
}
.table,th,td{
text-align:center;
}
tr{
border-bottom: 1px solid #ddd;
}
#changeWorker{
width:750px;
padding-top:28px;
margin: 92px 0 0 28px;
}
#cw01{
border: 1px solid #ddd;
height: 130px;
padding: 10px;
width : 508px;
border-radius: 10px 10px 10px 10px;
float: left;
}
#cw02, #cw03{
width: 205px;
float: left;
font-align:center;

}
#confirm{
margin-top:28px;
width:73px;
height:73px;
float: left;
}
#changeWorker input[type='text'],#changeWorker select{
width:200px;
float: left;
}

#num2,#money{
	margin-top:5px;
}
span{
margin:0;
font-size:20px;
}
#inoutonhand{
	margin-top:165px;
	margin-left:28px;

float:none;
width:800px;
}
#inoutonhand input[type='text'],#inoutonhand select{
width:200px;
margin-right: 5px;
float:left;
}

#ioh1{
border: 1px solid #ddd;
height: 150px;
padding: 10px;
width : 508px;
border-radius: 10px 10px 10px 10px;
float: left;
font-size:20px;
}

</style>
<script type="text/javascript">
var ida;


$(document).ready(function() {
	$('.idlist').hide();
	$('#work').on('click',work);
	$('#notwork').on('click',notwork);
	//근무변경 시제확인
	$('#confirm').on('click',confirm);
	$('#outbtn').on('click',outbtn);
	$('#elsebtn').on('click',elsebtn);
	
	$("#num1").change(function() {
		var values = $("#num1").val();
		console.log(values);
		$(".idlist:eq(" + values + ")").each(function(i, v) {
			var me = $(this);
			var $insdata = $('#insdata');
			$insdata.find(':eq(0)').html(me.find(':eq(0)').html());
			$insdata.find(':eq(1)').html(me.find(':eq(1)').html());
			$insdata.find(':eq(2)').html(me.find(':eq(2)').html());
		});
	});

});


function outbtn()
{
	var out=$("#out").val();
	var id=$("#num3").val();
	var flag="outbtn";
	var params="id="+id+"&out="+out+"&flag="+flag;
	sendRequest('andSoOnOk.jsp',params,callback,"GET");
}

function elsebtn()
{
	var elsetxt=$("#elsetxt").val();
	var id=$("#num").val();
	var flag="elsebtn";
	var params="id="+id+"&elsetxt="+elsetxt+"&flag="+flag;
	sendRequest('andSoOnOk.jsp',params,callback,"GET");
}

function confirm()
{
	var nowwork = $('#nowworker').val()
	var onhand = $('#onhand').val();
	var money=$("#money").val();
	var ida=$("#num2").val();

	if(nowwork==ida){
		alert("변경하는 근무자와 현재 근무자가 같습니다.")
	}else{
	if(money==onhand){
		//근무자
		var params="ida="+ida+"&onhand="+onhand;
		console.log(ida);
		console.log(onhand);
		console.log(params);
		sendRequest('cuNameOk.jsp',params,callback,"GET");
		
		$("#num2").val("---");
		$("#money").val("");
		alert("근무변경완료");
	}else{
		alert("시제가 다릅니다.");
	}
	}

}



function work()
{
	<%--
	1)보낸다.
	2)다른창에서 일을 처리한다.
	--%> 
	
	var id=$("#num1 option:selected").html();

	var flag="work";

	var params="id="+id+"&flag="+flag;
	sendRequest('workChangeOk.jsp',params,callback,"GET");
  
}


function notwork()
{
	var id=$("#num1 option:selected").html();

	var flag="notwork";

	var params="id="+id+"&flag="+flag;
	sendRequest('workChangeOk.jsp',params,callback,"GET");
}

function callback()
{
	if(xhr.readyState==4)
	{
		if(xhr.status==200)
			{
			
			}
	}
	
}



</script>
</head>
<body>
<%

PosDAO dao=new PosDAO();
ArrayList<WorkerListVO> list=dao.workerSelectAll();

String id[]=new String[list.size()];
int i=-1;




%>


<div id="getorout">
<h1>출/퇴근 확인</h1>

<div id="contentgowork">

	<select name="work" id="num1" class="form-control input">
		<option value="---" >선택</option>
		<%
		int wsel=0;
		for(WorkerListVO vo:list)
		{
			
			%>
		<option value=<%=wsel %>><%=vo.getId() %></option>
		
		<%
		wsel++;
		}
		%>
		
	</select> 
	<input type="button" value="출근" id="work"   class="btn btn-default"/>
	<input type="button" value="퇴근" id="notwork" class="btn btn-default" />
</div>
<div id="workerlist">
<table class="table">
	<tr>
		<th>근무자명</th>
		<th>출근시간</th>
		<th>퇴근시간</th>
	</tr>
	<tr id="insdata">
		<td>-</td>
		<td>-</td>
		<td>-</td>
	</tr>
	<tr></tr>

<%for(WorkerListVO vo:list){
	vo.getId();
	
}
%>
</table>
</div>

</div>


<div id="changeWorker">
	<h1>	근무교대</h1>
	<div id="cw01">
	<% 
	String cuname="본점";
	int onhand;
	CuNameVO vo1=dao.getOnhand(cuname);
	onhand=vo1.getOnhand();
	String nowWorker = dao.nowWorker("본점");
	%>
	<div id="cw02">
		<span>근무자</span>
		<input type="text" name="" id="nowworker" value="<%=nowWorker %>"  class="form-control input" readOnly="readOnly"/>
		<select name="changework" id="num2" class="form-control input">
		<option value="---">변경근무자</option>
			<%for(WorkerListVO vo:list)
		{
			i++;
			%>
		<option id="<%=vo.getId() %>" value=<%=vo.getId() %>><%=vo.getId() %></option>
		
		<%
		}
		%>
		
	</select> 
	</div>
	
	
	
	<!-- 시제금액 -->

	
	<div id=cw03>
	<span>시제</span>
	<input type="text" name="" id="onhand" value=<%=onhand%> class="form-control input" readOnly="readOnly"/>
	<input type="text" name="" id="money"  class="form-control input"/>
	</div>
	<input type="button" id="confirm" value="확인" class="btn btn-default"/>
	</div>
	
</div>


<div id="inoutonhand">
	<h1> 시제 변경</h1>
	<div id='ioh1'>
	시제인출 금액
	<div>
	<input type="text" name="" id="out"  class="form-control input"/>
	<select name="ch" id="num3" class="form-control input">
		<option value="---">선택</option>
			<%for(WorkerListVO vo:list)
		{
			i++;
			%>
		<option value=<%=vo.getId() %>><%=vo.getId() %></option>
		
		<%
		}
		%>
	</select> 
	<input type="button" value="확인" id="outbtn" class="btn btn-default" />
	</div>
	기타 발생금액
	
<div><input type="text" name="" id="elsetxt"  class="form-control input"/>
	<select name="change" id="num" class="form-control input">
		<option value="---">선택</option>
			<%for(WorkerListVO vo:list)
		{
			i++;
			%>
		<option value=<%=vo.getId() %>><%=vo.getId() %></option>
		
		<%
		}
		%>
	</select> 
	<input type="button" value="확인" id="elsebtn" class="btn btn-default"/>
</div>
</div>



</div>
<div>
<table>
<%for(WorkerListVO vo:list){
	%><tr class="idlist"><td> <%=(vo.getId())%></td><td>
		<%=vo.getGetwork() %></td><td>
	<%=vo.getGetoutwork() %></td></tr><%
}
%>
</table>
</div>
</body>
</html>

