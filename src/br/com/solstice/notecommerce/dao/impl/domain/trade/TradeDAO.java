package br.com.solstice.notecommerce.dao.impl.domain.trade;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.trade.Trade;

public class TradeDAO extends AbstractDAO {
	
	public TradeDAO() {
		super("trades", "trd_id");
	}

	public TradeDAO(Connection connection) {
		super("trades", "trd_id", connection);
	}

	@Override
	public int save(Entity entity) {
		openConnection();
		PreparedStatement pstm = null;

		Trade trade = (Trade) entity;

		String sql = "INSERT INTO `notecommerce_db`.`trades` (`trd_request_date`, `trd_status`, `trd_sit_id`) VALUES (?, ?, ?)";
		
		try {
			pstm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			pstm.setTimestamp(1, Timestamp.valueOf(LocalDateTime.now()));
			pstm.setString(2, trade.getStatus().name());
			//pstm.setInt(3, trd_sit_id); // TODO

			System.out.println(this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString());

			pstm.execute();

			ResultSet rs = pstm.getGeneratedKeys();

			int idProduct = 0;

			if (rs.next()) {
				idProduct = rs.getInt(1);
			}

			return idProduct;
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
		// Called when admin chooses next action
		openConnection();
		PreparedStatement pstm = null;

		Trade trade = (Trade) entity;

		String sql = "UPDATE `notecommerce_db`.`trades` SET `trd_status` = ? WHERE (`trd_id` = ?)";
		
		try {
			pstm = connection.prepareStatement(sql);
			
			pstm.setString(1, trade.getStatus().name());
			//pstm.setInt(2, trd_sit_id); // TODO

			System.out.println(this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString());

			pstm.execute();
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
	}

	@Override
	public List<Entity> consult(Entity entity, String operation) {
		// Called in /admin and /customer to list trades in table
		// May need an application entity for customer to see status of trade with sale details (modal)
		return null;
	}

}
