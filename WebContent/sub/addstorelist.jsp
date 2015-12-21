<%@page import="PosVO.StorelistVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="PosDAO.PosDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    
<script src="../js/httpRequest.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#set').on('click', set);
		$('#modify').on('click', modify);
		$('#del').on('click', del);
	});

	function set() {
		var bar = $('[name="barcode"]').val();
		var pro = $('[name="proid"]').val();
		var cos = $('[name="cost"]').val();
		var sto = $('[name="stock"]').val();
		var cun = $('[name="cuname"]').val();
		var params = "barcode=" + bar + "&proid=" + pro + "&cost=" + cos
				+ "&stock=" + sto + "&cuname=" + cun + "&flag=add&orderd=0";
		sendRequest('server.jsp', params, callback, "GET");
	}
	
	function modify() {
		var bar = $('[name="barcode"]').val();
		var pro = $('[name="proid"]').val();
		var cos = $('[name="cost"]').val();
		var sto = $('[name="stock"]').val();
		var cun = $('[name="cuname"]').val();
		var params = "barcode=" + bar + "&proid=" + pro + "&cost=" + cos
				+ "&stock=" + sto + "&cuname=" + cun + "&flag=modify&orderd=0";
		sendRequest('server.jsp', params, callback, "GET");
	}
	
	function del() {
		var bar = $('[name="barcode"]').val();
		var pro = $('[name="proid"]').val();
		var cos = $('[name="cost"]').val();
		var sto = $('[name="stock"]').val();
		var cun = $('[name="cuname"]').val();
		var params = "barcode=" + bar + "&proid=" + pro + "&cost=" + cos
				+ "&stock=" + sto + "&cuname=" + cun + "&flag=del&orderd=0";
		sendRequest('server.jsp', params, callback, "GET");
	}
	function callback() {
		console.log("callbackst 함수 실행됨");
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				$("#field").html("");
				$("#out").load("#out");
			}
		}	
	}
</script>
<style>
div {
	display: block;
}

#container{
width:860px;
}
#field, #out{
margin :28px;
}
.btn{
width:150px;
margin-left:40px;
}
#set{
margin-left:140px;

}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="container">
	<div id="field">
	<h1>상품 관리</h1>
		<table class="table table-hover">
				<tr>
				<th>바코드</th>
				<th>상품명</th>
				<th>가격</th>
				<th>수량</th>
				<th>업체</th>
			</tr>
			<tr>
			 <td><input type="text" name="barcode" value=""  class="form-control input-sm"/> 
			 </td><td><input	type="text" name="proid" value="" class="form-control input-sm"> 
			</td><td><input type="text" name="cost" value="" class="form-control input-sm"> 
			</td><td><input type="text" name="stock" value="0" class="form-control input-sm"> 
			</td><td> <input type="text" name="cuname" value="본점" class="form-control input-sm">
			 </td>
			 </tr>
			 </table>
			<input type="button" value="등록" id="set" class="btn btn-default"> 
			<input type="button" value="수정" id="modify" class="btn btn-default"> 
			<input type="button" value="삭제" id="del" class="btn btn-default">
	</div>
	<div id="out">

		<table class="table table-hover" >
			<tr class="selecter">
				<th>바코드</th>
				<th>상품명</th>
				<th>가격</th>
				<th>수량</th>
				<th>업체</th>
			</tr>
			<%
				PosDAO dao = new PosDAO();
				ArrayList<StorelistVO> list = dao.getAllData();
				for (StorelistVO vo : list) {
			%>
			<tr class="selecter">
				<td><%=vo.getBarcode()%></td>
				<td><%=vo.getProid()%></td>
				<td><%=vo.getCost()%></td>
				<td><%=vo.getStore()%></td>
				<td><%=vo.getCuname()%></td>
			</tr>
			<%
				}
			%>

		</table>
	</div>
</div>
</body>
</html>
<script>
	var _barcord = $('[name="barcode"]');
	var _proid = $('[name="proid"]');
	var _cost = $('[name="cost"]');
	var _stock = $('[name="stock"]');
	var _cuname = $('[name="cuname"]');

	$('.selecter:not(:eq(0))').each(function(i, v) {
		var me = $(this);
		me.click(function(e) {
			if (e.target.cellIndex < 6) {
				_barcord.val(me.find(':eq(0)').html());
				_proid.val(me.find(':eq(1)').html());
				_cost.val(me.find(':eq(2)').html());
				_stock.val(me.find(':eq(3)').html());
				_cuname.val(me.find(':eq(4)').html());
			}
		});
	});
</script>
