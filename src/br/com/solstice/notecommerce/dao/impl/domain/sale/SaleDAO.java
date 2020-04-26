package br.com.solstice.notecommerce.dao.impl.domain.sale;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.List;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;

public class SaleDAO extends AbstractDAO {

	public SaleDAO() {
		super("sales", "sal_id");
	}

	@Override
	public long save(Entity entity) {
		openConnection();
		PreparedStatement pstm = null;

		Sale sale = (Sale) entity;

		String sql = "INSERT INTO " + table
				+ "(sal_date_time, sal_balance_usage, sal_ads_id, sal_crd_id, sal_cus_id, sal_status, sal_identify_number) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try {
			pstm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			pstm.setTimestamp(1, Timestamp.valueOf(sale.getDateTime()));
			pstm.setDouble(2, sale.getBalanceUsage());
			pstm.setLong(3, sale.getAddress().getId());
			pstm.setLong(4, sale.getCreditCard().getId());
			pstm.setLong(5, sale.getCustomer().getId());
			pstm.setString(6, sale.getStatus().toString());
			pstm.setString(7, sale.getIdentifyNumber());

			System.out.println(
					"  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName()
							+ ": " + pstm.toString().substring(pstm.toString().indexOf(':') + 2));

			pstm.execute();

			ResultSet rs = pstm.getGeneratedKeys();

			long idSale = 0;

			if (rs.next()) {
				idSale = rs.getLong(1);
			}
			
			
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
		return null;
	}

}
