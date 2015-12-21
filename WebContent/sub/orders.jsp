<%@page import="PosVO.orderlistVO"%>
<%@page import="PosVO.StorelistVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="PosDAO.PosDAO"%>
<%
	PosDAO dao = new PosDAO();
	ArrayList<StorelistVO> list = dao.getAllDatas();
	ArrayList<orderlistVO> olist = dao.sogetAllData();
	String nowWorker = dao.nowWorker("본점");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style>
html,body{

}
#container {
	width: 790px;
	margin-left : 28px;
}

div {
	display: block;
	float:left;
}

#header {
}

#nav {
	margin-left:5px;
}
#nav table{
	padding-top:10px;
}

.dbtable {
	margin: 0 auto;
}

#tabs {
	overflow: hidden;
	width: 100%;
	margin: 0;
	padding: 0;
	list-style: none;
}

#tabs li {
	float: left;
	margin: 0 .5em 0 0;
}

#tabs a {
	position: relative;
	background: #ddd;
	background-image: linear-gradient(to bottom, #fff, #ddd);
	padding: .7em 3.5em;
	float: left;
	text-decoration: none;
	color: #444;
	text-shadow: 0 1px 0 rgba(255, 255, 255, .8);
	border-radius: 5px 0 0 0;
	box-shadow: 0 2px 2px rgba(0, 0, 0, .4);
}

#tabs a:hover, #tabs a:hover::after, #tabs a:focus, #tabs a:focus::after
	{
	background: #fff;
}

#tabs a:focus {
	outline: 0;
}

#tabs a::after {
	content: '';
	position: absolute;
	z-index: 1;
	top: 0;
	right: -.5em;
	bottom: 0;
	width: 1em;
	background: #ddd;
	background-image: linear-gradient(to bottom, #fff, #ddd);
	box-shadow: 2px 2px 2px rgba(0, 0, 0, .4);
	transform: skew(10deg);
	border-radius: 0 5px 0 0;
}

#tabs #current a, #tabs #current a::after {
	background: #ddd;
	z-index: 3;
}

#content {
	background: #fff;
	padding: 2em;
	position: relative;
	z-index: 2;
	border-radius: 5px 5px 5px 5px;
	box-shadow: 0 -2px 3px -2px rgba(0, 0, 0, .5);
	width:790px;
	heigth:auto;
	border-left:1px solid #ddd;
	border-right:1px solid #ddd;
	border-bottom:1px solid #ddd;
}

.form-control {
	diplay: block;
	float: left;
	width: 150px;
	padding: 0px;
	margin: 0px 5px 0px 0px;
}

#change {
	width: 190px;
}
#addstockinput
{
	width:100px;
}
#nav{
width:740px;

float: none;
}
.table,tr{
width:790px;
}
#content{

}
#tab1,#tab2{
width:740px;
}
.intab{
width:730px;
}
</style>
<script src="../js/httpRequest.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var _barcord = $('#datain:eq(0)').find('td:eq(0)');
		var _proid = $('[name="proid"]');
		var _cost = $('#datain:eq(0)').find('td:eq(1)')
		var _stock = $('#datain:eq(0)').find('td:eq(2)')
		var _cuname = $('#datain:eq(0)').find('td:eq(3)')
		var _ordered = $('#datain:eq(0)').find('td:eq(4)')
		var _addstock = $('[name="addstock"]');
		
		function resetTabs(){
		    $("#content div").hide(); 
		    $("#tabs a").attr("id","1","id","2"); 
		}

		var myUrl = window.location.href; 
		var myUrlTab = myUrl.substring(myUrl.indexOf("#")); // For mywebsite.com/tabs.html#tab2, myUrlTab = #tab2
		var myUrlTabName = myUrlTab.substring(0,4); // For the above example, myUrlTabName = #tab
		
	    $("#content div").hide(); // Initially hide all content
	    $("#tabs li:first a").attr("id","current"); // Activate first tab
	    $("#content div:first").fadeIn(); // Show first tab content

	    $("#tabs a").on("click",function(e) {
	        e.preventDefault();
	        if ($(this).attr("id") == "current"){ //detection for current tab
	         return
	        }
	        else{
	        resetTabs();
	        $(this).attr("tab1","current"); // Activate this
	        $($(this).attr('name')).fadeIn(); // Show content for current tab
	        }
	    });

	    for (i = 1; i <= $("#tabs li").length; i++) {
	      if (myUrlTab == myUrlTabName + i) {
	          resetTabs();
	          $("a[name='"+myUrlTab+"']").attr("id","current"); // Activate url tab
	          $(myUrlTab).fadeIn(); // Show url tab content
	      }
	    }
		
		
		$('.store:not(:eq(0))').each(function(i, v) {
			var me = $(this);
			me.click(function(e) {
					_barcord.html(""+me.find(':eq(1)').html());
					_proid.val(me.find(':eq(0)').html());
					_cost.html(me.find(':eq(3)').html());
					_stock.html(me.find(':eq(4)').html());
					_ordered.html(me.find(':eq(5)').html());
					_cuname.html(me.find(':eq(6)').html());
					
			});
		});
		$('.order:not(:eq(0))').each(function(i, v) {
			var me = $(this);
			me.click(function(e) {
					_barcord.html(me.find(':eq(0)').html());
					_proid.val(me.find(':eq(1)').html());
					_cost.html(me.find(':eq(2)').html());
					_stock.html(me.find(':eq(3)').html());
					_ordered.html(me.find(':eq(4)').html());
					_cuname.html(me.find(':eq(5)').html());
				
			});
		});

		$("#change").change(function() {
			var values = $("#change").val();
			$(".store:eq(" + values + ")").each(function(i, v) {
				var me = $(this);
				_barcord.html(me.find(':eq(1)').html());
				_cost.html(me.find(':eq(3)').html());
				_stock.html(me.find(':eq(4)').html());
				_ordered.html(me.find(':eq(5)').html());
				_cuname.html(me.find(':eq(6)').html());
			});
		});

		$('#search').on('click', function() {
			var bar = $('[name="sbarcode"]').val();
			console.log("서치시작 바코드 :" +bar);
			var store = $(".store").find(':eq(0)').last().html();
			console.log("마지막 번호 :"+store);
			for (var i =1; i <=store; i++ ){
				var table = $(".store:eq(" + i + ")");
				var set = table.find(':eq(1)').html();
				console.log(set);
					if(bar==set){
						
						_barcord.html(table.find(':eq(1)').html());
						_proid.val(table.find(':eq(0)').html());
						_cost.html(table.find(':eq(3)').html());
						_stock.html(table.find(':eq(4)').html());
						_ordered.html(table.find(':eq(5)').html());
						_cuname.html(table.find(':eq(6)').html());
					}
				}
		});
		

		$('#order').on('click', function() {
			var bar = $('#datain:eq(0)').find('td:eq(0)').html();
			console.log(bar);
			if (bar == null || bar == "") {
				alert("선택 된 값이 없습니다.");
			} else {
				var pro =$('[name="proid"] option:selected').text();
				var cos = _cost.html();
				var sto = _addstock.val();
				var cun = _cuname.html();
				var ord = _ordered.html();
				var params = "barcode=" + bar + "&proid=" + pro + "&cost=" + cos
						+ "&stock=" + sto + "&cuname=" + cun + "&flag=order&orderd=0";

				if (sto != 0) {
					if (ord == 0) {
						sendRequest('server.jsp', params, callback, "GET");
					} else {
						var r = confirm("기존에 발주중입니다. 이전 수치에 더하시겠습니까?");
						if (r == true) {
							sto = parseInt(sto) + parseInt(ord);
							params = "barcode=" + bar + "&proid=" + pro + "&cost="
									+ cos + "&stock=" + sto + "&cuname=" + cun
									+ "&flag=ordermodify&orderd=0";
							sendRequest('server.jsp', params, callback, "GET");
						} else if (r == false) {
							var s = confirm("기존 값을 지우고 등록하시겠습니까?");
							if(s==true){
							params = "barcode=" + bar + "&proid=" + pro + "&cost="
									+ cos + "&stock=" + sto + "&cuname=" + cun
									+ "&flag=order&orderd=0";
							sendRequest('server.jsp', params, callback, "GET");
							}else{
								alert("발주가 취소 되었습니다.");
							}
						}
					}
				} else {
					alert("값이 0입니다.");
				}
			}
		});
		
		$('#instore').on('click', function() {
			var bar = $('#datain:eq(0)').find('td:eq(0)').html();
			console.log(bar);
			console.log(_proid);
			
			if (bar == null || bar == "") {
				alert("선택 된 값이 없습니다.");
			} else {
				var pro = $('[name="proid"] option:selected').text();
				var cos = _cost.html();
				var sto = _stock.html();
				var cun = _cuname.html();
				var work =$('#datain:eq(0)').find('td:eq(5)').html();
				var ord = _ordered.html();
				if (ord == 0) {
					alert("값이 0입니다. 또는 발주중이 아닙니다.");
				}else {
				if (_addstock.val()==_ordered.html()){
					ord = _ordered.html();
					sto = parseInt(sto) + parseInt(ord);
					ord = 0;
				} else if(parseInt(_ordered.html())>parseInt(_addstock.val())){
					ord = parseInt(_ordered.html())-(parseInt(_ordered.html())-parseInt(_addstock.val()));
					sto = parseInt(sto) + parseInt(ord);
					ord =parseInt(_ordered.html())-parseInt(_addstock.val());
				}
				var params = "barcode=" + bar + "&proid=" + pro + "&cost="
				+ cos + "&stock=" + sto + "&cuname=" + cun
				+ "&flag=inorder&id="+ work+"&orderd="+ ord +"&stockval="+_addstock.val();
				sendRequest('server.jsp', params, callback, "GET");
				} 
			   
				

				
			} 
		});

	});

	function callback() {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				alert("작업이 완료되었습니다.");
				$("#container").html("");
				$("#container").load("#container");
			}
		}
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<h1>상품 발주 신청</h1>
		<div id="header">
		<div>			
			<table class='table'>
			<tr>
			<th>상품명</td>
			<th>수량</td>
		
			<th>바코드검색</td>
			</tr>
			<tr><td>
			<select name="proid" id="change" class="form-control">
							<option value="0"></option>
							<%
								int i = 1;
								for (StorelistVO vo : list) {
							%>
							<option value="<%=i%>"><%=vo.getProid()%></option>
							<%
								i++;
								}
							%>
							<option value="--">-------발주중-------</option>

							<%
								for (orderlistVO vo : olist) {
							%>
							<option value="<%=vo.getProid()%>"><%=vo.getProid()%></option>
							<%
								}
							%>
					</select>
					</td><td>
					<input type="text" name="addstock" value="0"
						id=addstockinput class="form-control" />
					<input type="button" value="발주신청" id="order"
						class="btn btn-default" /> <input type="button" id="instore"
						value="입고 확인" class="btn btn-default" />
						</td><td>
						 <input type="text" name="sbarcode" id=""
				class="form-control" /> <input type="button" id="search" value="검색"
				class="btn btn-default" />
				</td>
				</tr>
						</table>
					
				</div>
						</div>
		<div id="nav">
			<table class="table table-hover">
				<tr>
				<th>바코드</th>
				<th>가격</th>
				<th>수량</th>
				<th>CU명</th>
				<th>발주중</th>
				<th>근무자</th>	
				</tr>
				<tr id="datain">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><%=nowWorker%></td>
				</tr>
			</table>
		</div>

		<ul id="tabs">
			<li><a href="#" name="#tab1">발주중</a></li>
			<li><a href="#" name="#tab2">상품리스트</a></li>

		</ul>

		<div id="content">
			<div id="tab1">
				발주중
				<table class="intab table table-hover">
					<tr class="order">
						<th>바코드</th>
						<th>상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>발주중</th>
						<th>업체</th>
						<th>발주날짜</th>
					</tr>

					<%
						int orderedcount = 1;
						for (orderlistVO vo : olist) {
					%>
					<tr class="order">
						<td><%=vo.getBarcode()%></td>
						<td><%=vo.getProid()%></td>
						<td><%=vo.getCost()%></td>
						<td><%=vo.getStore()%></td>
						<td><%=vo.getordercount()%></td>
						<td><%=vo.getCuname()%></td>
						<td><%=vo.getOrderdate()%></td>
						<td><input type="hidden" name="" value="<%=orderedcount%>" />
						</td>
					</tr>
					<%
						orderedcount++;
						}
					%>
				</table>
			</div>
			<div id="tab2">
				재고 리스트
				<table  class="intab table table-hover">
					<tr class="store">
						<th>순번</th>
						<th>바코드</th>
						<th>상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>발주중</th>
						<th>업체</th>
					</tr>
					<%
						int listcount = 1;
						for (StorelistVO vo : list) {
					%>
					<tr class="store">
						<td><%=listcount%></td>
						<td><%=vo.getBarcode()%></td>
						<td><%=vo.getProid()%></td>
						<td><%=vo.getCost()%></td>
						<td><%=vo.getStore()%></td>
						<td><%=vo.getOrders()%></td>
						<td><%=vo.getCuname()%></td>
					</tr>
					<%
						listcount++;
						}
					%>
				</table>
			</div>
		</div>
	</div>
</body>
</html>