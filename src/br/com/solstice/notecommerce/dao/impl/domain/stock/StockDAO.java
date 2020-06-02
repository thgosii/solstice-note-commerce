package br.com.solstice.notecommerce.dao.impl.domain.stock;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.dao.impl.domain.product.ProductDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.product.Product;
import br.com.solstice.notecommerce.entity.domain.stock.Stock;

public class StockDAO extends AbstractDAO {
	
	public StockDAO() {}

	public StockDAO(Connection connection) {
		super(connection);
	}

	// Called automatically on product save
	@Override
	public long save(Entity entity) {
		openConnection();
		PreparedStatement pstm = null;

		Stock stock = (Stock) entity;

		String sql = "INSERT INTO `notecommerce_db`.`stock` (`stk_prd_id`, `stk_quantity`) VALUES (?, ?)";
		
		try {
			pstm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			pstm.setLong(1, stock.getProduct().getId());
			pstm.setInt(2, stock.getQuantity());

			System.out.println("  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString());

			pstm.execute();

			ResultSet rs = pstm.getGeneratedKeys();

			long idStock = 0;

			if (rs.next()) {
				idStock = rs.getLong(1);
			}

			return idStock;
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
	
	// Called by sale/trade strategies and stock up form
	@Override
	public void update(Entity entity) {
		openConnection();
		PreparedStatement pstm = null;

		Stock stock = (Stock) entity;

		String sql = "UPDATE `notecommerce_db`.`stock` SET `stk_quantity` = ?' WHERE (`stk_prd_id` = ?)";
		
		try {
			pstm = connection.prepareStatement(sql);
			
			pstm.setInt(1, stock.getQuantity());
			pstm.setLong(2, stock.getProduct().getId());

			System.out.println("  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString());

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
		openConnection();

		PreparedStatement pstm = null;
		ResultSet rs = null;

		Stock stock = (Stock) entity;

		String sql = "";

		if (operation.equals("consult")) { // Gets trade table data
			if (stock.getProduct() != null && stock.getProduct().getId() != null) { // find by product id
				// Stock of a single product
				sql = "SELECT * FROM notecommerce_db.stock WHERE stk_prd_id = ?";
			} else {
				// All products stock
				sql = "SELECT * FROM notecommerce_db.stock";
			}
		}
		
		List<Entity> stocks = new ArrayList<Entity>();

		try {
			pstm = connection.prepareStatement(sql);

			if (operation.equals("consult") && stock.getProduct() != null && stock.getProduct().getId() != null) {
				pstm.setLong(1, stock.getProduct().getId());
			}
			
			System.out.println("  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString().substring(pstm.toString().indexOf(':') + 2));

			rs = pstm.executeQuery();
			
			ProductDAO productDAO = new ProductDAO(connection);

			while (rs.next()) {
				Stock currentStock = new Stock();
				
				if (operation.equals("consult")) {
					stock.setId(rs.getLong("stk_id"));
					stock.setQuantity(rs.getInt("stk_quantity"));
					
					Product product = new Product();
					product.setId(rs.getLong("stk_prd_id"));
					
					// Checks for deleted product
					List<Entity> listStock = productDAO.consult(product, "consult");
					if (listStock.size() == 0) {
						continue; // Do not add to list
					}
					
					stock.setProduct((Product) listStock.get(0));
				}
				
				stocks.add(currentStock);
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
