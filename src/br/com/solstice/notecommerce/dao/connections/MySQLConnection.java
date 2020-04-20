package br.com.solstice.notecommerce.dao.connections;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class MySQLConnection {

	private static final String DRIVER = "com.mysql.jdbc.Driver";
	
	private static final String DB_PROTOCOL = "jdbc:mysql";
	private static final String DB_ADDRESS = "localhost";
	private static final String DB_PORT = "3306";
	private static final String DB_PARAMS = "allowPublicKeyRetrieval=true&useSSL=false";

	private static final String DB_NAME = "notecommerce_db";
	private static final String DB_USER = "notecommerce_user";
	private static final String DB_PASSWORD = "noteCommerce_password1";

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName(DRIVER);
		
		return DriverManager.getConnection(getUrl(), DB_USER, DB_PASSWORD);
	}
	
	private static String getUrl() {
		return DB_PROTOCOL + "://" + DB_ADDRESS + ":" + DB_PORT + "/" + DB_NAME + (DB_PARAMS != null && !DB_PARAMS.isEmpty() ? "?" + DB_PARAMS : "");
	}

}