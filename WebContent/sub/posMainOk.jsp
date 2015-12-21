<%@page import="PosVO.CuNameVO"%>
<%@page import="PosDAO.PosDAO"%>
<%@page import="PosVO.ReceiptVO"%>
<%@page import="PosVO.StorelistVO"%>
<%@page import="PosVO.TreadcodeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
 
//본점,바코드,상품명,가격
		//갯수,합계,근무자,구입연령,거래번호
//var params="cuname="+cuname+"&temp1="+temp1+"&pro1="+pro1+"&price1="+price1+
//"&num1="+num1+"&total="+total+"&work1="+work1+"&agesel="+agesel+"&sellnum1="+sellnum1;

	 String cuname=request.getParameter("cuname");
	
	 String temp1=request.getParameter("temp1"); 
	 
	 String pro1=request.getParameter("pro1"); 
	 String price1=request.getParameter("price1"); 
	 String num1=request.getParameter("num1"); 
	 String total=request.getParameter("total"); 

	 String work1=request.getParameter("work1"); 

	 String agesel=request.getParameter("agesel"); 
	 String sellnum1=request.getParameter("sellnum1"); 
	 System.out.println("1:"+sellnum1);
	 int sellnum2=Integer.parseInt(sellnum1);
	 System.out.println("2:"+sellnum2);
	 String dbsum1=request.getParameter("dbsum1"); 
	 System.out.println("dbsum"+dbsum1);
	 String listnum=request.getParameter("listnum"); 
	 System.out.println("listnum"+listnum);
	 int list=Integer.parseInt(listnum);
	 String onsum=request.getParameter("onsum"); 
	 int onsum1=Integer.parseInt(onsum);
	 
	 String[][] end=new String [list][5]; 
	 String[] temp2 = temp1.split(Character.toString(','));
	 String[] pro2 = pro1.split(Character.toString(','));
	 String[] price2 = price1.split(Character.toString(','));
	 String[] num2 = num1.split(Character.toString(','));
	 String[] dbsum2 = dbsum1.split(Character.toString(','));
	
	 
 	 	 for(int i=0; i<list; i++){
		 for(int j=0; j<5; j++){
	      if(j==0)
	      {
	    	  end[i][0]=temp2[i]; 
	    		
	      }else if(j==1)
	      {
	    	  end[i][1]=pro2[i];
	    		
	      }
	      else if(j==2)
	      {
	    	  end[i][2]=price2[i];
	      }
	      else if(j==3)
	      {
	    	  end[i][3]=num2[i];
	      }
	      else if(j==4)
	      {
	    	  end[i][4]=dbsum2[i];
	      }
			 
		 }
		 
		 
	 }  
	 
/*   for(int i=0; i<list; i++){
		 for(int j=0; j<5; j++){
			 System.out.println("배열출력:"+end[i][j]); 
		 }
	 } 
    */
	 
	  

		PosDAO dao=new PosDAO();
		TreadcodeVO vo=new TreadcodeVO();
		vo.setCuname(cuname);
		dao.insertSellNumber(vo);
		response.sendRedirect("posMain.jsp"); 
		
		//1 db계산(storelist)
		StorelistVO vo2=new StorelistVO();
		 for(int i=0; i<list; i++){
			 
				Long temp3= Long.parseLong(end[i][0]);
				int num3=Integer.parseInt(end[i][3]);
				int dbsum3=Integer.parseInt(end[i][4]);
				int result=dbsum3-num3;
				
	
				System.out.println("result:"+result);
				System.out.println("temp3:"+temp3);
				vo2.setStore((result));
				vo2.setBarcode(temp3);
				
				System.out.println(vo2);
				dao.storeModifyData(vo2); 
				 
			
		 } 
		//1
		
		 //1 영수증 집어넣기(receipt)
		ReceiptVO vo3=new ReceiptVO();
		
		 for(int i=0; i<list; i++){
		vo3.setBarcode2(Long.parseLong(end[i][0]));
		vo3.setProid(end[i][1]);
		vo3.setCost(Integer.parseInt(end[i][2]));
		vo3.setStore(Integer.parseInt(end[i][3]));
		vo3.setId(work1);
		vo3.setCust(agesel);
		vo3.setTotalcost((Integer.parseInt(end[i][2])*Integer.parseInt(end[i][3])));
		vo3.setSellnum(sellnum2);
		vo3.setCuname("본점");
		vo3.setPayment("현금");
		System.out.println("배열출력:"+vo3);
		dao.receiptAddData(vo3);
		 }  
		 //1
		 
		 //1 시제금 가지고 와서 시제금더하기
		 String cuname1="본점";
		 int onhand;
		 CuNameVO vo4=dao.getOnhand(cuname);
		 //시제금출력완료
		 onhand=vo4.getOnhand();
		 int onsumresult=onsum1+onhand;
		 
		 //1 시제금 업데이트
		 vo4.setId(work1);
		 vo4.setOnhand(onsumresult);
		 dao.CumodifyData(vo4);
		 
		 	
		
%>

