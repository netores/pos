package PosDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import PosVO.CuNameVO;
import PosVO.MakeConnection;
import PosVO.ReceiptVO;
import PosVO.StocklistVO;
import PosVO.StorelistVO;
import PosVO.TreadcodeVO;
import PosVO.WorkerListVO;
import PosVO.orderlistVO;

public class PosDAO {

	StringBuffer sb = new StringBuffer();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public PosDAO() {

	}

	// Storelist
	public ArrayList<StorelistVO> getAllData() {
		conn = MakeConnection.getInstance().getConnection();
		ArrayList<StorelistVO> list = new ArrayList<StorelistVO>();
		sb.setLength(0);
		sb.append("SELECT Barcode, proid, cost, store, cuname  FROM Storelist");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			System.out.println("rs : " + rs);
			while (rs.next()) {
				long barcode = rs.getLong("barcode");
				String proid = rs.getString("proid");
				int cost = rs.getInt("cost");
				int store = rs.getInt("store");
				String cuname = rs.getString("cuname");
				StorelistVO vo = new StorelistVO(barcode, proid, cost, store, cuname);

				System.out.println(vo);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close();

		}
		return list;
	}

	public ArrayList<StorelistVO> getAllDatas() {
		conn = MakeConnection.getInstance().getConnection();
		ArrayList<StorelistVO> list = new ArrayList<StorelistVO>();
		sb.setLength(0);
		sb.append("SELECT Barcode, proid, cost, store, orders , cuname  FROM Storelist");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			System.out.println("rs : " + rs);
			while (rs.next()) {
				long barcode = rs.getLong("barcode");
				String proid = rs.getString("proid");
				int cost = rs.getInt("cost");
				int store = rs.getInt("store");
				String cuname = rs.getString("cuname");
				int orders = rs.getInt("orders");
				StorelistVO vo = new StorelistVO(barcode, proid, cost, store, cuname, orders);

				System.out.println(vo);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close();

		}
		return list;
	}

	public StorelistVO getData(String proid) {
		conn = MakeConnection.getInstance().getConnection();
		StorelistVO vo = null;
		sb.setLength(0);
		sb.append("SELECT Barcode, proid, cost, store, cuname  FROM  Storelist ");
		sb.append("WHERE proid = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, proid);

			rs = pstmt.executeQuery();
			rs.next();
			long barcode = rs.getLong("barcode");
			proid = rs.getString("proid");
			int cost = rs.getInt("cost");
			int store = rs.getInt("store");
			String cuname = rs.getString("cuname");
			vo = new StorelistVO(barcode, proid, cost, store, cuname);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close();

		}
		return vo;
	}

	public void addData(StorelistVO vo) {
		conn = MakeConnection.getInstance().getConnection();
		sb.setLength(0);
		sb.append("INSERT INTO Storelist ");
		sb.append("VALUES (?, ?, ?, ?, ?, 0) ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setLong(1, vo.getBarcode());
			pstmt.setString(2, vo.getProid());
			pstmt.setInt(3, vo.getCost());
			pstmt.setInt(4, vo.getStore());
			pstmt.setString(5, vo.getCuname());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();

		}
	}
	
    public void storeModifyData(StorelistVO vo)
   {
          sb.setLength(0);
          sb.append("UPDATE storelist set store=? WHERE barcode=?");
         
          try {
      		conn = MakeConnection.getInstance().getConnection();
               pstmt= conn.prepareStatement(sb.toString());
               pstmt.setInt(1, vo.getStore());
               pstmt.setLong(2, vo.getBarcode());
              
               pstmt.executeUpdate();
     
              System. out.println( "변경완료" );
         
         } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
         }
   }

	public void storeOrderData(long barcode, int orders) {
		conn = MakeConnection.getInstance().getConnection();
		sb.setLength(0);
		sb.append("UPDATE Storelist ");
		sb.append("Set orders=?");
		sb.append(" Where barcode= ?");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, orders);
			pstmt.setLong(2, barcode);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();

		}
	}

	public void modifyData(StorelistVO vo) {
		conn = MakeConnection.getInstance().getConnection();
		sb.setLength(0);
		sb.append("UPDATE Storelist ");
		sb.append("Set proid =? , cost=? , store=?, cuname='본점' , orders=?");
		sb.append(" Where barcode= ?");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getProid());
			pstmt.setInt(2, vo.getCost());
			pstmt.setInt(3, vo.getStore());
			pstmt.setInt(4, vo.getOrders());
			pstmt.setLong(5, vo.getBarcode());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();

		}
	}

	public void dropData(Long barcode) {
		conn = MakeConnection.getInstance().getConnection();
		sb.setLength(0);
		sb.append("delete Storelist ");
		sb.append("Where barcode = ?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setLong(1, barcode);
			pstmt.executeUpdate();
		} catch (SQLException e) {
		} finally {
			this.close();

		}

	}

	// orderlist DAO
	public ArrayList<orderlistVO> ordergetAllData() {
		conn = MakeConnection.getInstance().getConnection();
		ArrayList<orderlistVO> list = new ArrayList<orderlistVO>();
		sb.setLength(0);
		sb.append("SELECT Barcode, proid, cost, ordercount, cuname, orderdate  FROM orderlist");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			System.out.println("rs : " + rs);
			while (rs.next()) {
				long barcode = rs.getLong("barcode");
				String proid = rs.getString("proid");
				int cost = rs.getInt("cost");
				int ordercount = rs.getInt("ordercount");
				String cuname = rs.getString("cuname");
				String orderdate = rs.getString("orderdate");
				orderlistVO vo = new orderlistVO(barcode, proid, cost, ordercount, cuname, orderdate);

				System.out.println(vo);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close();

		}
		return list;
	}

	public ArrayList<orderlistVO> sogetAllData() {
		conn = MakeConnection.getInstance().getConnection();
		ArrayList<orderlistVO> list = new ArrayList<orderlistVO>();
		sb.setLength(0);
		sb.append(
				"SELECT o.Barcode, o.proid, o.cost, o.ordercount, o.cuname, o.orderdate ,s.store  FROM orderlist o , storelist s where o.Barcode = s.Barcode");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			System.out.println("rs : " + rs);
			while (rs.next()) {
				long barcode = rs.getLong("Barcode");
				String proid = rs.getString("proid");
				int cost = rs.getInt("cost");
				int ordercount = rs.getInt("ordercount");
				String cuname = rs.getString("cuname");
				String orderdate = rs.getString("orderdate");
				int store = rs.getInt("store");
				orderlistVO vo = new orderlistVO(barcode, proid, cost, ordercount, cuname, orderdate, store);

				System.out.println(vo);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close();

		}
		return list;
	}

	public orderlistVO ordergetData(String proid) {			
		conn = MakeConnection.getInstance().getConnection();
		orderlistVO vo = null;
		sb.setLength(0);
		sb.append("SELECT Barcode, proid, cost, ordercount, cuname, orderdate  FROM  orderlist ");
		sb.append("WHERE proid = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, proid);

			rs = pstmt.executeQuery();
			rs.next();
			long barcode = rs.getLong("barcode");
			proid = rs.getString("proid");
			int cost = rs.getInt("cost");
			int ordercount = rs.getInt("ordercount");
			String cuname = rs.getString("cuname");
			String orderdate = rs.getString("orderdate");
			vo = new orderlistVO(barcode, proid, cost, ordercount, cuname, orderdate);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close();

		}
		return vo;
	}

	public void orderaddData(orderlistVO vo) {
		conn = MakeConnection.getInstance().getConnection();
		sb.setLength(0);
		sb.append("INSERT INTO orderlist ");
		sb.append("VALUES (?, ?, ?, ?, ?, sysdate) ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setLong(1, vo.getBarcode());
			pstmt.setString(2, vo.getProid());
			pstmt.setInt(3, vo.getCost());
			pstmt.setInt(4, vo.getordercount());
			pstmt.setString(5, vo.getCuname());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();

		}
	}

	public void ordermodifyData(orderlistVO vo) {
		conn = MakeConnection.getInstance().getConnection();
		sb.setLength(0);
		sb.append("UPDATE orderlist ");
		sb.append("Set proid =? , cost=? , ordercount=?, cuname=?,orderdate=sysdate ");
		sb.append(" Where barcode= ?");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getProid());
			pstmt.setInt(2, vo.getCost());
			pstmt.setInt(3, vo.getordercount());
			pstmt.setString(4, vo.getCuname());
			pstmt.setLong(5, vo.getBarcode());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();

		}
	}

	public void orderdropData(Long barcode) {
		conn = MakeConnection.getInstance().getConnection();
		sb.setLength(0);
		sb.append("delete orderlist ");
		sb.append("Where barcode = ?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setLong(1, barcode);
			pstmt.executeUpdate();
		} catch (SQLException e) {
		} finally {
			this.close();

		}

	}
	// Stocklist

	public ArrayList<StocklistVO> StockgetAllDatas() {
		conn = MakeConnection.getInstance().getConnection();
		ArrayList<StocklistVO> list = new ArrayList<StocklistVO>();
		sb.setLength(0);
		sb.append("SELECT barcode, proid, cost, store, id, cuname, indate from stocklist");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			System.out.println("rs : " + rs);
			while (rs.next()) {
				long barcode = rs.getLong("barcode");
				String proid = rs.getString("proid");
				int cost = rs.getInt("cost");
				int store = rs.getInt("store");
				String id = rs.getString("store");
				String cuname = rs.getString("cuname");
				String indate = rs.getString("indate");
				StocklistVO vo = new StocklistVO(barcode, proid, cost, store, id, cuname, indate);

				System.out.println(vo);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close();

		}
		return list;
	}

	// 근무자 얻어오기
	public String nowWorker(String cuname) {
		conn = MakeConnection.getInstance().getConnection();
		String id = null;
		sb.setLength(0);
		sb.append("SELECT id  FROM  cuname ");
		sb.append("WHERE cuname = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, cuname);

			rs = pstmt.executeQuery();
			rs.next();
			id = rs.getString("id");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close();

		}
		return id;
	}

	// stock
	public void StockaddData(StocklistVO vo) {
		conn = MakeConnection.getInstance().getConnection();
		sb.setLength(0);
		sb.append("INSERT INTO stocklist ");
		sb.append("VALUES (?, ?, ?, ?, ?, ? ,sysdate)");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setLong(1, vo.getBarcode());
			pstmt.setString(2, vo.getProid());
			pstmt.setInt(3, vo.getCost());
			pstmt.setInt(4, vo.getStore());
			pstmt.setString(5, vo.getId());
			pstmt.setString(6, vo.getCuname());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();
		}
	}
		//CuName
	   //본점에 있는 시제금가지고 오기
	 	public CuNameVO getOnhand(String cuname)
	 	{
	 		conn = MakeConnection.getInstance().getConnection();
	 		sb.setLength(0);
	 		sb.append("SELECT*FROM cuname ");
	 		sb.append("WHERE cuname=?" );
	 		CuNameVO vo=null;
	 		try {
	 			pstmt=conn.prepareStatement(sb.toString());
	 			
	 			pstmt.setString(1, cuname);
	 			
	 			rs=pstmt.executeQuery();
	 			rs.next();
	 			int onhand=rs.getInt("onhand");
	 			
	 			vo=new CuNameVO(cuname,onhand);
	 		} catch (SQLException e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 		}finally{
		    	  this.close();
		      }
	 		
	 		
	 		return vo;
	 	}
	 	
	 	
	 	
	 	 
	 	//근무자,시제금 받아서 db에저장
	 	public void CumodifyData(CuNameVO vo)
	     {
	 		conn = MakeConnection.getInstance().getConnection();
	            sb. setLength(0);
	            sb.append( "UPDATE cuname ");
	            sb.append( "set id=?, onhand=? ");
	            sb.append( "WHERE cuname='본점'");
	           
	            try {
	                 pstmt= conn.prepareStatement( sb.toString());
	                
	                 pstmt.setString(1, vo.getId());
	                 pstmt.setInt(2, vo.getOnhand());
	                 pstmt.executeUpdate();
	                
	                System. out.println( "변경완료" );
	           
	           } catch (SQLException e) {
	                 // TODO Auto-generated catch block
	                 e.printStackTrace();
	           }finally{
	  	    	  this.close();
	  	      }
	     }

	 	//Userid
	 	 public boolean userIDisExists(String id,String pw)
	 	{
	 	    conn = MakeConnection.getInstance().getConnection();
	 	    sb.setLength(0);
	 		sb.append("SELECT userid FROM Userid ");
	 		sb.append("WHERE userid=? and userpw=? ");
	 		
	 		boolean isOK=false;
	 		try {
	 			pstmt=conn.prepareStatement(sb.toString());
	 			//첫번째 물음표에 id값을 저장
	 			pstmt.setString(1, id);
	 			pstmt.setString(2, pw);
	 			rs=pstmt.executeQuery();
	 			//값이존재하면 TRUE
	 			isOK=rs.next();
	 		} catch (SQLException e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 		}finally{
	 	    	  this.close();
	 	      }
	 		return isOK;
	 	}
	 	//WorkerList
	 	public ArrayList workerSelectAll(){
			conn = MakeConnection.getInstance().getConnection();
		    ArrayList<WorkerListVO> list=new ArrayList<WorkerListVO>();
			
			sb.setLength(0);
			sb.append("SELECT id, userlevel,to_char(getwork,'MM/DD HH24:MI')getwork,to_char(getoutwork,'MM/DD HH24:MI')getoutwork,cuname FROM workerlist ");
			
			try {
				pstmt=conn.prepareStatement(sb.toString());
				rs=pstmt.executeQuery();
				while(rs.next()){
					
					String id=rs.getString("id");
					int userlevel=rs.getInt("userlevel");
					String getwork = rs.getString("getwork");
					String getoutwork = rs.getString("getoutwork");
					String cuname = rs.getString("cuname");
					
					//vo객체에서 값 할당하기
					WorkerListVO vo=new WorkerListVO(id,userlevel,getwork,getoutwork,cuname);
					list.add(vo);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
		    	  this.close();
		      }
			
			return list;
	   }
	   
	   public void workerInsertOne(WorkerListVO vo)
	   {
		   	conn = MakeConnection.getInstance().getConnection();
		    sb.setLength(0);
			sb.append("INSERT INTO workerlist ");
			sb.append("VALUES (?,?,null,null,?) ");
			
			try {
				pstmt=conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getId());
				pstmt.setInt(2, vo.getUserlevel());
				pstmt.setString(3, vo.getCuname());
				pstmt.executeUpdate();
				
				System.out.println("1삽입완료");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
		    	  this.close();
		      }
	   }
	   
	   public void updatetWork(WorkerListVO vo)
	   {
		   conn = MakeConnection.getInstance().getConnection();
		   sb.setLength(0);
			sb.append("UPDATE workerlist ");
			sb.append("SET getwork=sysdate ");
			sb.append("WHERE id=?");
			
			try {
				pstmt=conn.prepareStatement(sb.toString());
				
				pstmt.setString(1, vo.getId());
				
				
				
				pstmt.executeUpdate();
				System.out.println("출근시간완료");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
		    	  this.close();
		      }
	  }
	   
	   public void updatetoutWork(WorkerListVO vo)
	   {
		   conn = MakeConnection.getInstance().getConnection();
		   sb.setLength(0);
			sb.append("UPDATE workerlist ");
			sb.append("SET getoutwork=SYSDATE ");
			sb.append("WHERE id=?");
			
			try {
				pstmt=conn.prepareStatement(sb.toString());
				
				pstmt.setString(1, vo.getId());
				pstmt.executeUpdate();
				System.out.println("퇴근시간완료");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally{
		    	  this.close();
		      }
	  }
	   
	   
	   
	   
	  

	   
	   public void workerUpdateOne(WorkerListVO vo)
	   {
		   conn = MakeConnection.getInstance().getConnection();
		   sb.setLength(0);
			sb.append("UPDATE workerlist ");
			sb.append("SET id=?,userlevel=? ");
			sb.append("WHERE id=?");
			
			try {
				pstmt=conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getId());
				pstmt.setInt(2, vo.getUserlevel());
				pstmt.setString(3, vo.getId());
				
				
				
				pstmt.executeUpdate();
				System.out.println("수정완료");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally{
		    	  this.close();
		      }
	   }
	   
	   public void workerDeleteOne(String id){
		   conn = MakeConnection.getInstance().getConnection();
		   sb. setLength(0);
	       sb.append( "DELETE workerlist ");
	       sb.append( "WHERE id=?");
	      
	       try {
	            pstmt =
	            conn.prepareStatement( sb.toString());
	            pstmt.setString(1, id);
	            pstmt.executeUpdate();
	            
	            System. out.println( "삭제완료" );
	      } catch (SQLException e) {
	            e.printStackTrace();
	      }finally{
	    	  this.close();
	      }
	   }
	   
	   //id선택시 끌어오기 level끌어오기
		public WorkerListVO getLevel(String id)
		{
			conn = MakeConnection.getInstance().getConnection();
			sb.setLength(0);
			sb.append("SELECT*FROM workerlist ");
			sb.append("WHERE id=?" );
			WorkerListVO vo=null;
			try {
				pstmt=conn.prepareStatement(sb.toString());
				
				pstmt.setString(1, id);
				
				rs=pstmt.executeQuery();
				rs.next();
				int userlevel=rs.getInt("userlevel");
				
				vo=new WorkerListVO(id,userlevel);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
		    	  this.close();
		      }
			
			return vo;
		}
		
		// 판매리스트 및 매출 취소 관련
		
		public ArrayList<ReceiptVO> receiptgetAllDatas() {
			conn = MakeConnection.getInstance().getConnection();
			ArrayList<ReceiptVO> list = new ArrayList<ReceiptVO>();
			sb.setLength(0);
			sb.append("SELECT barcode2, proid, cost, store, id, cust,selltime,totalcost,sellnum,cuname,payment  FROM receipt order by sellnum desc");
			try {
				pstmt = conn.prepareStatement(sb.toString());
				rs = pstmt.executeQuery();
				System.out.println("rs : " + rs);
				while (rs.next()) {
					long barcode = rs.getLong("barcode2");
					String proid = rs.getString("proid");
					int cost = rs.getInt("cost");
					int store = rs.getInt("store");
					String id =rs.getString("id");
					String cust = rs.getString("cust");
					String selltime= rs.getString("selltime");
					int totalcost= rs.getInt("totalcost");
					int sellnum = rs.getInt("sellnum");
					String cuname = rs.getString("cuname");
					String payment =rs.getString("payment");
					ReceiptVO vo = new ReceiptVO(barcode, proid, cost, store, id, cust,selltime,totalcost,sellnum,cuname,payment);

					System.out.println(vo);
					list.add(vo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				this.close();

			}
			return list;
		}
		
		public ArrayList<ReceiptVO> receiptselAllDatass(int sellnum) {
			conn = MakeConnection.getInstance().getConnection();
			ArrayList<ReceiptVO> list = new ArrayList<ReceiptVO>();
			sb.setLength(0);
			sb.append("SELECT barcode2, proid, cost, store, id, cust,selltime,totalcost,sellnum,cuname,payment  FROM receipt ");
			sb.append("Where sellnum > ?");
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, sellnum);
				rs = pstmt.executeQuery();
				System.out.println("rs : " + rs);
				while (rs.next()) {
					long barcode = rs.getLong("barcode2");
					String proid = rs.getString("proid");
					int cost = rs.getInt("cost");
					int store = rs.getInt("store");
					String id =rs.getString("id");
					String cust = rs.getString("cust");
					String selltime= rs.getString("selltime");
					int totalcost= rs.getInt("totalcost");
					sellnum = rs.getInt("sellnum");
					String cuname = rs.getString("cuname");
					String payment =rs.getString("payment");

					ReceiptVO vo = new ReceiptVO(barcode, proid, cost, store, id, cust,selltime,totalcost,sellnum,cuname,payment);

					System.out.println(vo);
					list.add(vo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				this.close();

			}
			return list;
		}
		
		public void receiptAddData(ReceiptVO vo)
		   {
			   	conn = MakeConnection.getInstance().getConnection();
		          sb. setLength(0);
		          sb.append( "INSERT INTO receipt " );
		          //bno는 시퀀스로 삽입된다.
		          sb.append( "VALUES (?,?,?,?,?,?,sysdate,?,?,?,?) ");
		         
		   
		      	
		          try {
		               pstmt= conn.prepareStatement(sb.toString());
		              
		               pstmt.setLong(1, vo.getBarcode2());
		               pstmt.setString(2, vo.getProid());
		               pstmt.setInt(3, vo.getCost());
		               pstmt.setInt(4, vo.getStore());
		               pstmt.setString(5, vo.getId());
		               pstmt.setString(6, vo.getCust());
		               pstmt.setInt(7, vo.getTotalcost());
		               pstmt.setInt(8, vo.getSellnum());
		               pstmt.setString(9, vo.getCuname());
		               pstmt.setString(10, vo.getPayment());
		               
		             
		              
		               pstmt.executeUpdate();
		              
		              System. out.println( "추가완료" );
		              
		         
		         } catch (SQLException e) {
		               // TODO Auto-generated catch block
		               e.printStackTrace();
		         }
		   }
		
		
		public ArrayList<ReceiptVO> receiptOneDatas(int sellnum) {
			conn = MakeConnection.getInstance().getConnection();
			ArrayList<ReceiptVO> list = new ArrayList<ReceiptVO>();
			sb.setLength(0);
			sb.append("SELECT barcode2, proid, cost, store, id, cust,selltime,totalcost,sellnum,cuname  FROM receipt ");
			sb.append("Where sellnum = ?");
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, sellnum);
				rs = pstmt.executeQuery();
				System.out.println("rs : " + rs);
				while (rs.next()) {
					long barcode = rs.getLong("barcode2");
					String proid = rs.getString("proid");
					int cost = rs.getInt("cost");
					int store = rs.getInt("store");
					String id =rs.getString("id");
					String cust = rs.getString("cust");
					String selltime= rs.getString("selltime");
					int totalcost= rs.getInt("totalcost");
					sellnum = rs.getInt("sellnum");
					String cuname = rs.getString("cuname");
					String payment =rs.getString("payment");
					
					ReceiptVO vo = new ReceiptVO(barcode, proid, cost, store, id, cust,selltime,totalcost,sellnum,cuname,payment);

					System.out.println(vo);
					list.add(vo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				this.close();

			}
			return list;
		}
		
		public int receiptcostDatas(String date, String date2) {
			int cost=0;
			conn = MakeConnection.getInstance().getConnection();
			sb.setLength(0);
			sb.append("SELECT sum(totalcost) totalcost  FROM receipt ");
			sb.append("Where selltime between to_date(?,'RR-MM-DD') and TO_DATE(?,'RR-MM-DD')");
			try {
				pstmt = conn.prepareStatement(sb.toString());
				System.out.println(date+" "+date2);
				pstmt.setString(1, date);
				pstmt.setString(2, date2);
				rs = pstmt.executeQuery();
				System.out.println("rs : " + rs);
				while (rs.next()) {
					cost= rs.getInt("totalcost");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				this.close();

			}
			return cost;
		}
	 	 
		   public ArrayList sellnumselectALL(){
				
			   conn = MakeConnection.getInstance().getConnection();
			   ArrayList<TreadcodeVO> list=new ArrayList<TreadcodeVO>();
				
				
				
				
				sb.setLength(0);
				sb.append("SELECT * FROM treadcpde ");
				
				try {
					pstmt=conn.prepareStatement(sb.toString());
					rs=pstmt.executeQuery();
					while(rs.next()){
						
						
						int sellnum=rs.getInt("sellnum");
						String cuname=rs.getString("cuname");
						
						TreadcodeVO vo=new TreadcodeVO(sellnum,cuname);
						list.add(vo);
						
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally{
			    	  this.close();
			      }
				
				
				return list;
				
			}
		   
		   
		   //new거래 번호가지고 오기
		   	public TreadcodeVO getSellNumber(String cuname)
		  	{
		  		conn = MakeConnection.getInstance().getConnection();
		  		sb.setLength(0);
		  		sb.append("SELECT max(sellnum) sellnum FROM treadcode ");
		  		sb.append("WHERE cuname=?" );
		  		TreadcodeVO vo=null;
		  		try {
		  			pstmt=conn.prepareStatement(sb.toString());
		  			
		  			pstmt.setString(1, cuname);
		  			
		  			rs=pstmt.executeQuery();
		  			rs.next();
		  			int sellnum=rs.getInt("sellnum");
		  			
		  			vo=new TreadcodeVO(sellnum);
		  		} catch (SQLException e) {
		  			// TODO Auto-generated catch block
		  			e.printStackTrace();
		  		}finally{
		 	    	  this.close();
		 	      }
		  		
		  		
		  		return vo;
		  	}
		   	
			public void insertSellNumber(TreadcodeVO vo)
		  	{
		  		conn = MakeConnection.getInstance().getConnection();
		  		sb.setLength(0);
		  		System.out.println("insertSellNumber성공");
		  		sb.append("insert into treadcode values(TREADCODE_SELLNUM_SEQ.nextval,'본점') ");
		  		try {
		  			System.out.println("insertSellNumber성공1");
		  			pstmt=conn.prepareStatement(sb.toString());
		  			pstmt.executeUpdate();
		  			
		  		} catch (SQLException e) {
		  			// TODO Auto-generated catch block
		  			e.printStackTrace();
		  		}finally{
		 	    	  this.close();
		 	      }
		  	  		
		  	}
		
		
	// 공용
	public void close() {

		if (rs != null)
			try {
				rs.close();
			} catch (Exception e) {
			}
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (Exception e) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (Exception e) {
			}
	}
}
