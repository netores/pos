package PosVO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MakeConnection {

	private static MakeConnection mc;
	private static Connection conn = null;

	final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String URL = "jdbc:oracle:thin:@sharys.duckdns.org:1521:orcl";
	final String USER = "scott";
	final String PASSWORD = "tiger";


	public static MakeConnection getInstance() {
			mc = new MakeConnection();
		return mc;
	}

	public Connection getConnection() {
			try{
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			System.out.println("conn : " + conn);
			} catch (ClassNotFoundException e) {
				System.out.println("드라이버 로딩 실패");
			} catch (SQLException e) {
				System.out.println("db 연결실패 ");
				e.printStackTrace();
			}
		return conn;
	}
}
