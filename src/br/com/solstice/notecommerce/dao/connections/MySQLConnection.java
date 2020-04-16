package br.com.solstice.notecommerce.dao.connections;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class MySQLConnection {

	private static String driver;
	private static String url;
	private static String user;
	private static String password;

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		driver = "com.mysql.jdbc.Driver";
		url = "jdbc:mysql://localhost:3306/notecommerce_db?allowPublicKeyRetrieval=true&useSSL=false";
		user = "notecommerce_user";
		password = "notecommerce_password";

		Class.forName(driver);
		
		Connection connection = null;
		
		connection = DriverManager.getConnection(url, user, password);
		
		return connection;
	}

}