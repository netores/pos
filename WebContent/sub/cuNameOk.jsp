<%@page import="PosVO.CuNameVO"%>
<%@page import="PosDAO.PosDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

String ida=request.getParameter("ida");
String test=request.getParameter("onhand");
int onhand=Integer.parseInt(test);
PosDAO dao=new PosDAO();
CuNameVO vo=new CuNameVO();


vo.setId(ida);
vo.setOnhand(onhand);

dao.CumodifyData(vo);

%>

</body>
</html>