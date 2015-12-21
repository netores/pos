<%@page import="java.util.ArrayList"%>
<%@page import="PosVO.ReceiptVO"%>
<%@page import="PosDAO.PosDAO"%>
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
<style type="text/css">
iframe{
	width:836px;
	height:400px;
}
#container {
	padding : 28px 28px 0px 28px;
}
table .table tr{
border-bottom: 1px solid #dddddd;
}
</style>
</head>
<body>
<div id=container>
<%
PosDAO dao = new PosDAO();
%>
<%
int count[] = new int[5];
int countm[] = new int[12];
countm[0] = dao.receiptcostDatas("15-01-01","15-01-31");
countm[1] = dao.receiptcostDatas("15-02-01","15-02-28");
countm[2]= dao.receiptcostDatas("15-03-01","15-03-31");
countm[3] = dao.receiptcostDatas("15-04-01","15-04-30");
countm[4] = dao.receiptcostDatas("15-05-01","15-05-31");
countm[5] = dao.receiptcostDatas("15-06-01","15-06-30");
countm[6] = dao.receiptcostDatas("15-07-01","15-07-31");
countm[7] = dao.receiptcostDatas("15-08-01","15-08-31");
countm[8] = dao.receiptcostDatas("15-09-01","15-09-30");
countm[9] = dao.receiptcostDatas("15-10-01","15-10-31");
countm[10] = dao.receiptcostDatas("15-11-01","15-11-30");
countm[11] = dao.receiptcostDatas("15-12-01","15-12-31");
%>
<h1>년 매출</h1>
<table class="table table-condensed">
<%
for (int i=1;i<6;i++){%> 
<td>201<%=i %>년</td>
<%} %>
<tr></tr><tr>
<%
int a = 1;
for (int i=0;i<5;i++){
count[i] = dao.receiptcostDatas("1"+a+"-01-01","1"+a+"-12-31");%> 
<td><%=count[i] %></td>
<%
a++;
} %>
</tr>
</table>
<h1>월 매출</h1>
<table class="table table-condensed">
<tr>
<%
for (int i=1;i<13;i++){ 
%>
<td><%=i%>월</td>
<%
}%>
</tr><tr>
<% 
for (int i=0;i<12;i++){ %>
<td><%=countm[i] %></td>
<%} %>
</table>
</div>
<iframe src="receiptlists.jsp" frameborder="0"></iframe>

</body>
</html>