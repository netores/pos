<%@page import="PosVO.CuNameVO"%>
<%@page import="PosDAO.PosDAO"%>
<%@page import="PosVO.TreadcodeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="PosVO.StorelistVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#contain1 {
	width: 458px;
	height: 330px;
	position: absolute;
	top: 28px;
	left: 28px;
}

#contain2 {
	width: 350px;
	height: 320px;
	position: absolute;
	top: 436px;
	left: 28px;
}
#contain2 h3{
margin-top:8px;
margin-bottum:0px;
}
#div h3{
margin-top:8px;
margin-bottum:0px;
}


#ageselect {
	width: 350px;
	height: 650px;
	position: absolute;
	top: 0px;
	left: 0px;
	background-color: #eeeeee;
	z-index: -100;
}

#getmoney {
	width: 350px;
	height: 650px;
	position: absolute;
	top: 0px;
	left: 0px;
	background-color: #eeeeee;
	z-index: -100;
}

#contain3 {
	width: 352px;
	height: 650px;
	position: absolute;
	top: 28px;
	left: 508px;
	padding: 28px;
	background-color: #eeeeee;
	border: 1px solid #cccccc;
	
}


#money, #card {
	width: 145px;
	height: 100px;
}

#reset {
	width: 294px;
	height: 50px;
}

body input[type="button"], [name=work] {
	margin-bottom: 5px;
}

#num1 {
	width: 236px;
}

#barin {
	width: 193px;
	display: block;
	margin: 0;
	float: left;
	margin-right: 5px;
}

.btns {
	padding: 20px 30px;
}

#barcodediv {
	margin-top: 160px;
	padding: 0px;
}

#calc_b {
	width: 224px;
	float: left;
	display: block;
}

#calc_c {
	width: 50px;
	float: left;
	display: block;
}

#btns15 {
	width: 70px;
	height: 129px;
}

.table td {
	min-width: 0px;
	width: 0px;
}

.z{
width:145px;

height : 50px;
}
#ageselect{
padding:28px;
}
#getmoney{
padding:28px;
}

#getmoney input[type='button']{
width: 70px;
height: 60px;
}
#getin_b{
width:223px;
float: left;
}
#getin_c{
width:10px;
height: 100px;
float: left;

}
#getmoney input[value='전체취소']{
width:293px;
height: 100px;
float: left;
}
#getmoney input[value='결정']{
height:190px;
}
#barcodeout{
font-family: "Bar-code 39";
font-size: 40px;
}
.modal-body .table{
margin:0;
}
.modal-dialog{
width:400px;
}

</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="../js/httpRequest.js"></script>
<script type="text/javascript">
	
<%PosDAO dao=new PosDAO();
ArrayList<StorelistVO> list=dao.getAllDatas();
TreadcodeVO vo1=dao.getSellNumber("본점");
CuNameVO vo2=dao.getOnhand("본점");%>
	//구입연령
	var agesel;
	var d;
	var a = "";

	$(document).ready(function() {

		$("#dbinfo").hide();
		$("#work3").hide();

		$('#pid').on('click', pid);

		$('#money').on('click', money);
		var x = 0;
		$('#mtotal').on('click',mtotal);
	
		$(".btns").each(function(i, v) {
			var me = $(this);
			me.click(function(e) {
				a += me.val();
				$("#barin").val(a);
			});
		});

		$(".btnc").each(function(i, v) {
			var me = $(this);
			me.click(function(e) {
				a += me.val();
				$("#txt").val(a);
			});
		});
		
		$(".z").each(function(i, v) {
			var me = $(this);
			me.click(function(e) {
				agesel = me.val();
				a = "";
				$('#getmoney').css("z-index", 150);
			});
		});
		
		$("[value='전체취소']").on('click',function(){
			var r = confirm("전체 취소하겠습니까?");
			if(r==true){
			$("#container").html("");
			//container부터 다시그리라.
			$("#container").load("#container");
				
			}
		});
	});

	
	function mtotal() {
		
		var r= false;
		var getmo=$("#txt").val();
		$("#to1").html($("#txt").val());
		var getmo3=parseInt(getmo)-parseInt($(".sum").html());
		$("#to2").html(getmo3);
		if(getmo3<0){
			alert("받은 금액이 총계보다 작습니다.");
		}else{
			r = confirm("거래 완료 하시겠습니까?");
			if(r=true){
		
		
		
		var cuname = "본점";
		var $trum = $(".trnum").length - 1
		//바코드
		var temp1 = "";
		for (var i = 0; i < $trum; i++) {
			var temp = parseInt($(".trnum:eq(" + i + ")").find(':eq(1)').val());
			temp1 += temp + ",";

		}
		//상품명
		var pro1 = "";
		for (var i = 0; i < $trum; i++) {
			var pro = $(".trnum:eq(" + i + ")").find(':eq(2)').html();

			pro1 += pro + ",";

		}
		//가격
		var price1 = "";
		for (var i = 0; i < $trum; i++) {
			var price = parseInt($(".trnum:eq(" + i + ")").find(':eq(3)')
					.html());

			price1 += price + ",";

		}
		//갯수
		var num1 = "";
		for (var i = 0; i < $trum; i++) {
			var num = parseInt($(".trnum:eq(" + i + ")").find(':eq(5)').html());

			num1 += num + ",";

		}
		//db에있는 재고 갯수
		var dbsum1 = "";
		for (var i = 0; i < $trum; i++) {
			var dbsum = parseInt($(".trnum:eq(" + i + ")").find(':eq(8) input')
					.val());

			dbsum1 += dbsum + ",";
		}

		//합
		var total = 0;
		for (var i = 0; i < $trum; i++) {
			var sum = parseInt($(".trnum:eq(" + i + ")").find(':eq(6)').html());
			total += parseInt(sum);
		}

		//연령

		//근무자.
		var work1 = $("#work3").html();

		var sellnum1 = $("#sellnum").html();

		var listnum = $(".trnum").length - 1;

		var onsum=$(".sum").html();
					
		//본점,바코드,상품명,가격
		//갯수,합계,근무자,구입연령,거래번호,수
		var params="cuname="+cuname+"&temp1="+temp1+"&pro1="+pro1+"&price1="+price1+
		"&num1="+num1+"&total="+total+"&work1="+work1+
		"&agesel="+agesel+"&sellnum1="+sellnum1+"&listnum="
		+listnum+"&dbsum1="+dbsum1+"&onsum="+onsum;
		sendRequest('posMainOk.jsp',params,callback,"GET");
	}}
	}

	function callback() {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
			setTimeout(close, 10000);
			}
		}
	}

	function close(){
		$("#container").html("");
	    $("#container").load("#container");
	}
	
	function inp1() {
		var al = a.length;
		al--;
		a = a.substring(0, al);
		$("#txt").val(a);
	}

	function inp2() {
		a = ""
		$("#txt").val(a);
	}

	function money() {
		$('#ageselect').css("z-index", 100);
	}

	function pid() {

		//db테이블에서 tr의 $('#num1').val()순서 찾아라
		$(".selecter:eq(" + $('#num1').val() + ")")
				.each(
						function(i, v) {

							var me = $(this);
							//바코드변수
							var selecter = me.find(':eq(0)').html();
							var target = 0;
							if ($(".trnum").length == 0) {
								$("#a").append("<tr class='trnum'><td><input type=hidden></td><td></td><td></td><td></td></tr>");
								$("#b").append("<tr class='trnumb'><td></td><td></td><td></td><td></td></tr>");
							}
							//효율성을위한 변수(마지막에 붙이겠다)
							var $trnum = $(".trnum").last();
							var $trnumb = $(".trnumb").last();
							var flags = 0;
							//tr갯수만큼 계산하는 for문
							for (var i = 0; i < $(".trnum").length; i++) {
								//기존tr중 바코드가 일치하는것이 있는지 확인
								if ($(".trnum:eq(" + i + ")").find(':eq(1)').val() == selecter) {
									flags = -999;
									target = i;
								} else {
									flags++;
								}
							}
							//일치하는것이없이 없으면 실행.
							if (flags > 0) {
								$trnum.find(':eq(1)').val(	me.find(':eq(0)').html());
								$trnum.find(':eq(2)').html(me.find(':eq(1)').html());
								$trnum.find(':eq(3)').html(me.find(':eq(2)').html());
								$trnum.append("<td>1</td>");
								//eq5
								$trnumb.find(':eq(0)').html(me.find(':eq(1)').html());
								$trnumb.find(':eq(1)').html("1");
								$trnumb.find(':eq(2)').html(me.find(':eq(2)').html());

								$trnum.append("<td>"+ $trnum.find(':eq(3)').html()* $trnum.find(':eq(5)').html()+ "</td>");
								$trnumb.find(':eq(3)').html($trnum.find(':eq(6)').html());
								$trnum.append("<td>취소</td>");
								$trnum.append("<td><input type=hidden class=st></td>");
								$trnum.find(':eq(8) input').val(
										me.find(':eq(3)').html());
								var stored = parseInt($trnum.find(
										':eq(8) input').val());
								$("#a").append("<tr class='trnum'><td><input type=hidden></td><td></td><td></td><td></td></tr>");
								$("#b").append("<tr class='trnumb'><td></td><td></td><td></td><td></td></tr>");
								//일치하는것이 있으면 실행
							} else {
								//$temptrnumaddr 일치하는 tr행
								$temptrnumaddr = $(".trnum:eq(" + target + ")");
								$temptrnumaddrb = $(".trnumb:eq(" + target + ")");
								//?eq(4)->eq3아닌가??
								var temp = $(".trnum:eq(" + target + ")").find(
										':eq(5)').html();
								temp++;
								$temptrnumaddr.find(':eq(5)').html(temp);
								$temptrnumaddrb.find(':eq(1)').html(temp);
								var temp2 = $temptrnumaddr.find(':eq(3)')
										.html()
										* $temptrnumaddr.find(':eq(5)').html();
								$temptrnumaddr.find(':eq(6)').html(temp2);
								$temptrnumaddrb.find(':eq(3)').html(temp2);

							}
							var total = 0;
							//length-1??
							for (var i = 0; i < $(".trnum").length - 1; i++) {
								var temp = parseInt($(".trnum:eq(" + i + ")")
										.find(':eq(6)').html());

								total += parseInt(temp);

							}

							$trnum.find(':eq(8) input').val()
							$('.sum').html(total);
							flags = 0;

							//d+=me.find(':eq(1)').html();

							//tr을 누르면 삭제한다
							$('.trnum').each(function(i, v) {
									var me = $(this);
									me.click(function(e) {
										//인덱스 5번째때. 삭제하기 누르면 삭제됨.
									total = 0;
									if (e.target.cellIndex == 6) {
										for (var i = 0; i < $(".trnum").length - 1; i++) {
										var temp = parseInt($(".trnum:eq("+ i+ ")").find(':eq(6)').html());
										total += parseInt(temp);
										}
									$('.sum').html(total);
									me.remove();
									}

								});
							});

						});

	}
</script>
</head>
<body>



	<div id="container">

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">영수증</h4>
      </div>
      <div class="modal-body">
      	CU HBI 본점 
      	서울특별시 종로구 돈의동 170번지 하늘빌딩 3층.4층.5층
        <table id=b class="table table-hover">
        <tr>
        <th>상품명</th>
        <th>수량</th>
        <th>단가</th>
        <th>합계</th>
        </tr>
        </table>
        
        <table class="table table-hover">     
        <tr>
        	<td>
        	<h3>총계:<label class="sum"> </label></h3>
        	</td>
        </tr>
        <tr>
        <td>
        <span id=barcodeout><center>00000<%=vo1.getSellnum()%></center></span>
        </td>
        </tr>
        <tr>
        <td>
        <span><center>00000<%=vo1.getSellnum()%></center></span>
        </td>
        </tr>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" id="close" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

		<div id="contain1">
			<table id="a" class="table table-hover">
				<tr>
				<td colspan=8>
					상품명결제리스트
					<label>거래번호:</label>
					<label id="sellnum"><%=vo1.getSellnum()%></label>
				</td>
				</tr>
				<tr>
					<td></td>
					<td>상품명</td>
					<td>가격</td>			
					<td colspan=2 ><center>수</td>
					<td>합계</td>
					<td>취소</td>
					<td></td>
				</tr>
			</table>

		</div>


		<!-- ---------------------------------------------- -->

		<div id="contain2">
			<div>
				<h3>합계:<label class="sum"> </label></h3>
			</div>
			<div><h3>할인:</h3></div>
			<div>
				<h3>총계:<label class="sum"> </h3></label>
			</div>
			
		<div><h3>받은금액:<label id="to1"> </label></h3></div>
		<div><h3>거스름돈:<label id="to2"> </label></h3></div>
	
	

		</div>

		<div id="contain3">
			<div id="manybtn">
				<input type="button" value="현금" id="money" class="btn btn-default" />
				<input type="button" value="카드" id="card" class="btn btn-default" /></br>
				<input type="button" value="전체취소" id="reset" class="btn btn-default" /></br>
				<select name="work" id="num1" class="btn btn-default">
					<option value="---">선택</option>
					<%
						int i = 1;
						for (StorelistVO vo : list) {
					%>
					<option value='<%=i%>'><%=vo.getProid()%></option>

					<%
						i++;
						}
					%>
				</select> <input type="button" value="입력" id="pid" class="btn btn-default" />
				<div id=barcodediv>
					<input type="text" name="" id="barin" class="form-control" /> <input
						type="button" value="바코드입력" class="btn btn-default" />


					<div id=calc_a>
						<div id=calc_b>
							<input type="button" value="7" class="btns btn btn-default" /> <input
								type="button" value="8" class="btns btn btn-default" /> <input
								type="button" value="9" class="btns btn btn-default" /> <input
								type="button" value="4" class="btns btn btn-default" /> <input
								type="button" value="5" class="btns btn btn-default" /> <input
								type="button" value="6" class="btns btn btn-default" /> <input
								type="button" value="1" class="btns btn btn-default" /> <input
								type="button" value="2" class="btns btn btn-default" /> <input
								type="button" value="3" class="btns btn btn-default" />
						</div>
						<div id=calc_c>
							<input type="button" value="0" id="btns14"
								class="btns btn btn-default" /> <input type="button" value="C"
								id="btns15" class="btn btn-default" />
							<div id=calc_c></div>
						</div>
					</div>
				</div>
				</div>

				<div id="dbinfo">

					<table class="table table-hover">
						<tr class="selecter">
							<th>바코드</th>
							<th>상품명</th>
							<th>가격</th>
							<th>수량</th>
							<th>업체</th>
						</tr>
						<%
							ArrayList<StorelistVO> list1 = dao.getAllDatas();
							for (StorelistVO vo : list1) {
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
				<!-- -------------------------------------------------- -->
				<div id="ageselect">


					<input type="button" value="10:남" class="btn btn-default z" /> <input
						type="button" value="10:여" class="btn btn-default z" /></br> <input
						type="button" value="20:남" class="btn btn-default z" /> <input
						type="button" value="20:여" class="btn btn-default z" /></br> <input
						type="button" value="30:남" class="btn btn-default z" /> <input
						type="button" value="30:여" class="btn btn-default z" /></br> <input
						type="button" value="40:남" class="btn btn-default z" /> <input
						type="button" value="40:여" class="btn btn-default z" /></br> <input
						type="button" value="50:남" class="btn btn-default z" /> <input
						type="button" value="50:여" class="btn btn-default z" />



				</div>

				<div id="getmoney">
					<input type="button" value="전체취소" class="btn btn-default" /><br>
						<h3>받은금액</h3>
						
					

					<input type="text" name="" val="" id="txt" class="form-control" /><br>

				<div id=getin_a>
						<div id=getin_b>
					<input type="button" value="7" class="btn btn-default btnc" /> <input
						type="button" value="8" class="btn btn-default btnc" /> <input
						type="button" value="9" class="btn btn-default btnc" />  <input
						type="button" value="4" class="btn btn-default btnc" /> <input
						type="button" value="5" class="btn btn-default btnc" /> <input
						type="button" value="6" class="btn btn-default btnc" /><input
						type="button" value="1" class="btn btn-default btnc" /> <input
						type="button" value="2" class="btn btn-default btnc" /> <input
						type="button" value="3" class="btn btn-default btnc" /> <input
						type="button" value="00" class="btn btn-default  btnc" /> <input
						type="button" value="0" class="btn btn-default  btnc" /> <input
						type="button" value="C" class="btn btn-default" onclick="inp2()" />
						</div>
					<div id=getin_c>
					<input type="button" value="◀" class="btn btn-default"  onclick="inp1()" />
					<input type="button" value="결정" id="mtotal" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"/>
					</div>
				</div>
				</div>
				<div value="<%=vo2.getId()%>" id="work3"><%=vo2.getId()%></div>	
		</div>
	</div>


</body>
</html>