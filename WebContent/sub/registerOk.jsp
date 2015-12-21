
<%@page import="PosVO.WorkerListVO"%>
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
PosDAO dao=new PosDAO();
if(flag.equals("register"))
{
String id=request.getParameter("idfield");
String level=request.getParameter("level");
int userlevel=Integer.parseInt(level);
String cuname="본점";

WorkerListVO vo1=new WorkerListVO();

vo1.setId(id);
vo1.setUserlevel(userlevel);
vo1.setCuname(cuname);
dao.workerInsertOne(vo1);

System.out.println("하나삽입완료");
}
else if(flag.equals("modify"))
{
	String id=request.getParameter("idfield");
	String level=request.getParameter("level");
	int userlevel=Integer.parseInt(level);


	WorkerListVO vo1=new WorkerListVO();

	vo1.setId(id);
	vo1.setUserlevel(userlevel);
	
	dao.workerUpdateOne(vo1);

	System.out.println("수정완료");
}else if(flag.equals("delect"))
{
	String id=request.getParameter("idfield");
	

	
	dao.workerDeleteOne(id);

	System.out.println("삭제완료");
}

%>