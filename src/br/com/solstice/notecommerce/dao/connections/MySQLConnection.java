package br.com.solstice.notecommerce.dao.connections;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class MySQLConnection {

	private static String driver;
	private static String url;
	private static String user;
	private static String password;

	public static Connection getConecction() throws ClassNotFoundException, SQLException {
		driver = "com.mysql.jdbc.Driver";
		url = "jdbc:mysql://localhost:3306/notecommerce_db";
		user = "notecommerce_user";
		password = "notecommerce_password";

		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		Connection connection = null;
		
		try {
			connection = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("Connected!");
		return connection;
	}

}