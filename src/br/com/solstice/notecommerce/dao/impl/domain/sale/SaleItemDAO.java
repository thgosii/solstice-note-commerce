package br.com.solstice.notecommerce.dao.impl.domain.sale;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleItem;

public class SaleItemDAO extends AbstractDAO {

	public SaleItemDAO(String table, String idtable) {
		super("", "");
	}

	@Override
	public long save(Entity entity) {
		openConnection();
		PreparedStatement pstm = null;

		SaleItem item = (SaleItem) entity;

		String sql = "INSERT INTO sales_products(sap_sal_id, sap_prd_id, sap_quantity, sap_subtotal) VALUES (?, ?, ?, ?)";

		try {
			pstm = connection.prepareStatement(sql);

			pstm.setLong(1, item.getSale().getId());
			pstm.setDouble(2, item.getProduct().getId());
			pstm.setInt(3, item.getQuantity());
			pstm.setDouble(4, item.getSubTotal());

			System.out.println(
					"  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName()
							+ ": " + pstm.toString().substring(pstm.toString().indexOf(':') + 2));

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
