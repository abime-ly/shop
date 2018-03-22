package com.utils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionUtils {
	private static String url;
	private static String driver;
	private static String username;
	private static String password;
	
	static{
		Properties pro = new Properties();
		try {
			pro.load(ConnectionUtils.class.getClassLoader().getResourceAsStream("database.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(pro != null)
		{
			url = pro.getProperty("url");
			driver = pro.getProperty("driver");
			username = pro.getProperty("username");//username=root
			password = pro.getProperty("password");		
			try {
				//加载驱动
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	//获得连接
	public static Connection buildConnection() throws SQLException {
		return DriverManager.getConnection(url, username, password);
	}
	
	//关闭连接
	public static void closeConnection(Connection con) {
		try {
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) throws SQLException {
		System.out.println(new ConnectionUtils().buildConnection());

	}

}
