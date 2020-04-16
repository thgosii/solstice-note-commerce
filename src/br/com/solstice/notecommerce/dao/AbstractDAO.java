package br.com.solstice.notecommerce.dao;

import java.sql.Connection;
import java.sql.SQLException;

import br.com.solstice.notecommerce.dao.connections.MySQLConnection;

public abstract class AbstractDAO implements IDAO {

	protected Connection connection;
	protected String table;
	protected String idTable;
	private final boolean shouldManageConnection;

	public AbstractDAO(String table, String idtable) {
		this.table = table;
		this.idTable = idtable;
		this.shouldManageConnection = true;
	}

	public AbstractDAO(String table, String idtable, Connection connection) {
		this.table = table;
		this.idTable = idtable;
		this.connection = connection;
		this.shouldManageConnection = false;
	}

	protected void openConnection() {
		try {
			if (shouldManageConnection && (connection == null || connection.isClosed())) {
				connection = MySQLConnection.getConnection();
				System.out.println("Connected to " + connection.getCatalog() + " from " + this.getClass().getSimpleName());
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	protected void closeConnection() {
		try {
			if (shouldManageConnection && connection != null && !connection.isClosed()) {
				System.out.println("Closing connection to " + connection.getCatalog() + " from " + this.getClass().getSimpleName());
				connection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
