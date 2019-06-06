package com.funketlist.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyOracle {

	public static Connection getConnection() {
		String driver="oracle.jdbc.driver.OracleDriver";		
		String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user="hr";
		String password="hr";
		Connection conn=null;
		
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url,user,password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
}