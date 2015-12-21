<%@page import="PosDAO.PosDAO"%>
<%@page import="PosVO.WorkerListVO"%>
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
String id=request.getParameter("id");
String flag=request.getParameter("flag");
PosDAO dao=new PosDAO();
WorkerListVO vo=new WorkerListVO();
if(flag.equals("work"))
{
vo.setId(id);
dao.updatetWork(vo);

}else if(flag.equals("notwork"))
{
	vo.setId(id);
	dao.updatetoutWork(vo);
}else
{
	out.println("실패");
}


%>