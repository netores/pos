<%@page import="PosDAO.PosDAO"%>
<%@page import="PosVO.ReceiptVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/httpRequest.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#se{
padding : 0 28px 0 28px;
position: fixed;
width :780px;
background-color:white;
height:77px;
}
#tables {
padding : 77px 28px 0 28px;
width :780px;
}
table tr td{
min-width:30px;
}
</style>
<script type="text/javascript">
Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;
         
    return f.replace(/(yyyy|yy|MM|dd|add|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "add": return (d.getDate()-7).zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
            
        }
    });
};
 
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};

$(function(){
	var y2=new Date().format("yyyy-MM-dd");
	var y1=new Date().format("yyyy-MM-add");
$('#year2').val(y2);	
$('#year1').val(y1);	


$size = $('.sizeset');
$resize = $('#resize');
for(var i=0;i<6;i++){
$temp=$size.find(":eq("+i+")").width();
$resize.find(":eq("+i+")").width($temp);
}
});	
</script>
</head>
<body>
<div id=se>
<input type="date" name=""  value="2015-09-01"  id="year1" />
<input type="date" name=""  value="2015-09-30"  id="year2" />
<input type="button" id="ser" value="검색" >
<table class="table table-condensed">
<tr id=resize>
<td>판매시간</td>
<td>제품명</td>
<td>가격</td>
<td>갯수</td>
<td>합계</td>
<td>결제</td>
</tr>
</table>
</div>
<div id=tables>
<table class="table table-condensed">
<%
PosDAO dao = new PosDAO();
ArrayList <ReceiptVO> alllist = dao.receiptgetAllDatas();
 for (ReceiptVO vo : alllist) {
    %><tr class="sizeset">
    <td><%=vo.getSelltime() %>
      </td><td><%=vo.getProid() %>
      </td><td><%=vo.getCost() %>
     </td><td id="rotoRl"><%=vo.getStore() %>
     </td><td> <%=vo.getTotalcost() %>
      </td><td><%=vo.getPayment() %>
    </td></tr>
<%
}
%>
</div>
</table>
</body>
</html>