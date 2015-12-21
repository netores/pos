<%@page import="java.util.ArrayList"%>
<%@page import="PosVO.WorkerListVO"%>
<%@page import="PosDAO.PosDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자등록/해제</title>

<style type="text/css">
input[type='text']{
width:200px;
float: left;
margin-right:5px;
}
#num{
width:85px;
float: left;
margin-right:5px;
}
#db{
padding-left:28px;
margin-top:114px;
width:684px;
}
#db_1{
border: 1px solid #ddd;
padding: 28px 28px 0 28px;];
border-radius: 10px 10px 10px 10px;
height:100%;

}

#db table{
width: 600px;
}

#select{
padding-left:28px;
}
#sel_1{
border: 1px solid #ddd;
padding: 28px 28px 28px 28px;];
border-radius: 10px 10px 10px 10px;
float: left;
width : 525px;
height:100%;

}

</style>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript">
	
	var flag;
	
	$(document).ready(function() {
		var _id = $("#a");
		var _num = $('#num');

		/*
		'tr:not(:eq(0))'->첫번째 tr은 무시하겠다.
		each:알아서 찾아준다. 
		i:반복횟수
		 v=tr
		 this=v
		 me.click(function(e)=알아서 찻겠다.
		me.find(':eq(0)').html():첫번째 td->id
		*/
		
		
		$('tr:not(:eq(0))').each(function(i, v) {
			var me = $(this);
			me.click(function(e) {
				_id.val(me.find(':eq(0)').html());
				_num.val(me.find(':eq(1)').html());
			});
		});
		
	$('#register').on('click',register);
	$('#modify').on('click',modify);
	$('#delect').on('click',delect);
	
	
	
	});
		
		function register()
		{
			<%--
			1)id와 레벨을 값을 받는다.
			2)보낸다.
			3)다른창에서 일을 처리한다.
			--%> 
			var idfield=$("#a").val();
			var level=$("#num").val();
			var flag="register";
			var params="idfield="+idfield+"&level="+level+"&flag="+flag;
			
			sendRequest('registerOk.jsp',params,callback,"GET");
		}
		
		
		function modify()
		{
			var idfield=$("#a").val();
			var level=$("#num").val();
			var flag="modify";
			var params="idfield="+idfield+"&level="+level+"&flag="+flag;
			
			sendRequest('registerOk.jsp',params,callback,"GET");
			
		}
		function delect()
		{
			var idfield=$("#a").val();
		
			var flag="delect";
			var params="idfield="+idfield+"&flag="+flag;
			
			sendRequest('registerOk.jsp',params,callback,"GET");
		}
		
		function callback()
		{
			if(xhr.readyState==4)
			{
				if(xhr.status==200)
					{
					//db를 지워라.
					$("#db").html("");
					$("#select").html("");
					//select부터 다시그리라.
					$("#select").load("#select");
					}
			}
			
		}

	
</script>



</head>
<body>

	<div>
		<!-- ----------------------------------- -->
			<div id="select" >
			<h1>근무자 등록 및 변경</h1>
			<div id="sel_1">
				<input type="text" name="idfield" id="a"   class="form-control"/> 
				<select name="level" id="num"  class="form-control">
					<option value="---">선택</option>
					<option value="1">1</option>
					<option value="2">2</option>
				</select> 
				<input type="button" value="추가" id="register"  class="btn btn-default"/>
				<input type="button" value="수정" id="modify" class="btn btn-default"/> 
				<input type="button" value="삭제" id="delect" class="btn btn-default"/>
			</div>
			</div>
		
		<!-- ----------------------------------- -->
		

		
		

		
		<!-- 테이블 -->
		

	
			<div id="db" >
			<h1>근무자 목록</h1>
			<div id="db_1">
				<table class="table table-hover">
					<tr>
						<th>이름</th>
						<th>등급</th>
						<th>출근시간</th>
						<th>퇴근시간</th>
					</tr>
					<%
					PosDAO dao = new PosDAO();
					ArrayList<WorkerListVO> list = dao.workerSelectAll();
						for (WorkerListVO vo : list) {
					%><tr>
						<td><%=vo.getId()%></td>
						<td><%=vo.getUserlevel()%></td>
						<td><%=vo.getGetwork() %>
						<td><%=vo.getGetoutwork() %>
					</tr>
					<%
						}
					%>
				</table>
				</div>
			</div>
			

</div>

</body>
</html>
