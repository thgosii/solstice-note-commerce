package br.com.solstice.notecommerce.dao.impl.domain.sale;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.dao.impl.domain.product.ProductDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.product.Product;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleItem;

public class SaleItemDAO extends AbstractDAO {

	public SaleItemDAO() {
		super();
	}

	public SaleItemDAO(Connection connection) {
		super(connection);
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
		openConnection();

		PreparedStatement pstm = null;
		ResultSet rs = null;

		SaleItem item = (SaleItem) entity;

		String sql = "";
		
		if (operation.equals("consult")) {
			sql = "SELECT * from sales_products WHERE sap_sal_id=?";
		}

		List<Entity> items = new ArrayList<Entity>();

		try {
			pstm = connection.prepareStatement(sql);

			if (operation.equals("consult")) {
				pstm.setLong(1, item.getSale().getId());
			} 
			
			System.out.println("  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString().substring(pstm.toString().indexOf(':') + 2));

			rs = pstm.executeQuery();

			while (rs.next()) {
				SaleItem saleItem = new SaleItem();
				saleItem.setQuantity(rs.getInt("sap_quantity"));
				saleItem.setSubTotal(rs.getDouble("sap_subtotal"));
				
				// set sale
				Sale sale = new Sale();
				sale.setId(rs.getLong("sap_sal_id"));
				saleItem.setSale(sale);
				
				// set product
				Product product = new Product();
				product.setId(rs.getLong("sap_prd_id"));
				product = (Product) new ProductDAO(connection).consult(product, "findById").get(0);
				saleItem.setProduct(product);
				
				items.add(saleItem);
			}

			return items;
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

		return items;
	}

}
