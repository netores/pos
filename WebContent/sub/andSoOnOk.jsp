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
String flag=request.getParameter("flag");
String cuname="본점";
PosDAO dao1=new PosDAO();
CuNameVO vo1=dao1.getOnhand(cuname);
int outonhand=0;
int a=vo1.getOnhand();
PosDAO dao=new PosDAO();
CuNameVO vo=new CuNameVO();

if(flag.equals("outbtn"))
{



String id=request.getParameter("id");
String onhand=request.getParameter("out");
int b=Integer.parseInt(onhand);


outonhand=a+b;
vo.setId(id);
vo.setOnhand(outonhand);

dao.CumodifyData(vo);
}else if(flag.equals("elsebtn"))
{
	String id=request.getParameter("id");
	String elsetxt=request.getParameter("elsetxt");
	int b=Integer.parseInt(elsetxt);


	outonhand=a+b;
	vo.setId(id);
	vo.setOnhand(outonhand);

	dao.CumodifyData(vo);
}

%>

</body>
</html>