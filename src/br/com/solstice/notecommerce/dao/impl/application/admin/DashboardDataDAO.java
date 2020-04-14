package br.com.solstice.notecommerce.dao.impl.application.admin;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.entity.Entity;

public class DashboardDataDAO extends AbstractDAO {

	public DashboardDataDAO() {
		super(null, null);
	}

	@Override
	public int save(Entity entity) {
		return 0;
	}

	@Override
	public void remove(Entity entity) {
	}

	@Override
	public void update(Entity entity) {
	}

	@Override
	public List<Entity> consult(Entity entity, String operation) {
		
		openConnection();
		
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {

			pstm = connection.prepareStatement(sql);
			
			// TODO
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstm != null) {
				try {
					pstm.close();
				} catch (SQLException e) {
				}
			}
			if (connection != null) {
				try {
					System.out.println("Closing connection from " + this.getClass().getSimpleName());
					connection.close();
				} catch (SQLException e) {
				}
			}
		}

		
		
		
		return null;
	}

}