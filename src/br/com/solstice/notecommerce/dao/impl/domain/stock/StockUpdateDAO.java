package br.com.solstice.notecommerce.dao.impl.domain.stock;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.stock.Stock;
import br.com.solstice.notecommerce.entity.domain.stock.StockUpdate;

public class StockUpdateDAO extends AbstractDAO {
	
	public StockUpdateDAO() {}

	public StockUpdateDAO(Connection connection) {
		super(connection);
	}

	@Override
	public long save(Entity entity) {
		openConnection();
		PreparedStatement pstm = null;

		StockUpdate stockUpdate = (StockUpdate) entity;

		String sql = "INSERT INTO `notecommerce_db`.`stock_history` (`sth_stk_id`, `sth_quantity`, `sth_date`) VALUES (?, ?, ?)";
		
		try {
			pstm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			pstm.setLong(1, stockUpdate.getStock().getId());
			pstm.setInt(2, stockUpdate.getQuantity());
			pstm.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));

			System.out.println("  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString());

			pstm.execute();

			ResultSet rs = pstm.getGeneratedKeys();

			long idStockUpdate = 0;

			if (rs.next()) {
				idStockUpdate = rs.getLong(1);
			}

			return idStockUpdate;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstm != null) {
				try {
					pstm.close();
				} catch (SQLException e) {
				}
			}
			closeConnection();
		}

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
		
		// not needed since stock history consult will always be the same query which doesn't need parameters
		//StockUpdate stockUpdate = (StockUpdate) entity;

		String sql = "";

		if (operation.equals("consult")) {
			sql = "SELECT * FROM notecommerce_db.stock_history";
		}
		
		List<Entity> stocks = new ArrayList<Entity>();

		try {
			pstm = connection.prepareStatement(sql);

			if (operation.equals("consult")) {
			}
			
			System.out.println("  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString().substring(pstm.toString().indexOf(':') + 2));

			rs = pstm.executeQuery();
			
			StockDAO stockDAO = new StockDAO(connection);

			while (rs.next()) {
				StockUpdate currentStockUpdate = new StockUpdate();
				
				if (operation.equals("consult")) {
					currentStockUpdate.setId(rs.getLong("sth_id"));
					
					// Checks for stock not in list (because of deleted product)
					List<Entity> listStock = stockDAO.consult(new Stock(rs.getLong("sth_stk_id")), "consult");
					if (listStock.size() == 0) {
						continue; // Do not add to list
					}
					
					currentStockUpdate.setStock((Stock) listStock.get(0));
					currentStockUpdate.setQuantity(rs.getInt("sth_quantity"));
					currentStockUpdate.setDate(rs.getTimestamp("sth_date").toLocalDateTime());
				}
				
				stocks.add(currentStockUpdate);
			}

			return stocks;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstm != null) {
				try {
					pstm.close();
				} catch (SQLException e) {
				}
			}
			closeConnection();
		}

		return null;
	}

}
