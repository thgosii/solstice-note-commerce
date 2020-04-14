package br.com.solstice.notecommerce.dao;

import java.sql.Connection;
import java.sql.SQLException;

import br.com.solstice.notecommerce.dao.connections.MySQLConnection;

public abstract class AbstractDAO implements IDAO {

	protected Connection connection;
	protected String table;
	protected String idTable;

	public AbstractDAO(String table, String idtable) {
		this.table = table;
		this.idTable = idtable;
	}

	protected void openConnection() {
		try {
			if (connection == null || connection.isClosed()) {
				connection = MySQLConnection.getConnection();
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
