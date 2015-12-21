<%@page import="PosVO.StocklistVO"%>
<%@page import="PosVO.orderlistVO"%>
<%@page import="PosVO.StorelistVO"%>
<%@page import="PosDAO.PosDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		
		
		long barcode = Long.parseLong(request.getParameter("barcode"));
		String proid = request.getParameter("proid");
		int cost = Integer.parseInt(request.getParameter("cost"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		int orderd = Integer.parseInt(request.getParameter("orderd"));
		String cuname = request.getParameter("cuname");
		String flag = request.getParameter("flag");
		String id = request.getParameter("id");
		System.out.println(flag);

		PosDAO dao = new PosDAO();
		
		if (flag.equals("add")) {
			dao.addData(new StorelistVO(barcode, proid, cost, stock, cuname, 0));
			out.print("입력완료");
			//dao.close();
		} else if (flag.equals("modify")) {
			dao.modifyData(new StorelistVO(barcode, proid, cost, stock ,cuname));
			out.print("수정완료");
			//dao.close();
		} else if (flag.equals("del")) {
			dao.dropData(barcode);
			out.print("삭제완료");
			//dao.close();
		}
		if(flag.equals("order")){
			dao.orderaddData(new orderlistVO(barcode, proid, cost, stock, cuname));
			dao.storeOrderData(barcode,stock);
			out.print("입력완료");	
			//dao.close();
		}
		if(flag.equals("ordermodify")){
			dao.ordermodifyData(new orderlistVO(barcode, proid, cost, stock, cuname));
			dao.storeOrderData(barcode,stock);
			out.print("발주변경완료");	
			//dao.close();
		}
		if(flag.equals("inorder")){
			System.out.println("입고동작");
			int stockvalue =  Integer.parseInt(request.getParameter("stockval"));
			if (orderd==0){
			dao.orderdropData(barcode);
			}else{
				dao.ordermodifyData(new orderlistVO(barcode, proid, cost, orderd, cuname));
			}
			dao.modifyData(new StorelistVO(barcode, proid, cost, stock, cuname, orderd));
			dao.StockaddData(new StocklistVO(barcode, proid, cost, stockvalue , id, cuname));
		}
		
	%>