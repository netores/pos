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
<%-- 	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		PosDAO dao = new UseridDAO();
		boolean ok = dao.isExists(id, pw);
		if (ok) {
			Cookie idc = new Cookie("id", id);
			System.out.println("로그인성공");
			idc.setMaxAge(60 * 60);
			response.addCookie(idc);
		} else {
			System.out.println("로그인 실패");
		}
		response.sendRedirect("login.jsp");
	%>
 --%>
</body>
</html>