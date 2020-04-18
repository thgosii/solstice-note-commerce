package br.com.solstice.notecommerce.dao.impl.domain.trade;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.bcel.internal.generic.I2F;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.dao.impl.domain.product.BrandDAO;
import br.com.solstice.notecommerce.dao.impl.domain.product.ProductDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.product.Product;
import br.com.solstice.notecommerce.entity.domain.product.brand.Brand;
import br.com.solstice.notecommerce.entity.domain.product.file.ProductFile;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleItem;
import br.com.solstice.notecommerce.entity.domain.trade.Trade;
import br.com.solstice.notecommerce.entity.domain.trade.TradeStatus;

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

		String sql = "INSERT INTO " + table + " (`trd_request_date`, `trd_status`, `trd_sit_sal_id`, `trd_sit_prd_id`) VALUES (?, ?, ?, ?)";
		
		try {
			pstm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			pstm.setTimestamp(1, Timestamp.valueOf(LocalDateTime.now()));
			pstm.setString(2, trade.getStatus().name());
			pstm.setLong(3, trade.getSale().getId());
			pstm.setLong(4, trade.getSaleItem().getProduct().getId());

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
		// Called when admin calls next action (updates trade status)
		openConnection();
		PreparedStatement pstm = null;

		Trade trade = (Trade) entity;

		String sql = "UPDATE " + table + " SET `trd_status` = ? WHERE trd_id = ? AND trd_deleted = false";
		
		try {
			pstm = connection.prepareStatement(sql);
			
			pstm.setString(1, trade.getStatus().name());
			pstm.setLong(2, trade.getId());

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
		// Called by itself to get sales_products FKs (ids)
		openConnection();

		PreparedStatement pstm = null;
		ResultSet rs = null;

		Trade trade = (Trade) entity;

		String sql = "";

		if (operation.equals("consult")) {
			if (trade.getSale() != null && trade.getSale().getCustomer() != null && trade.getSale().getCustomer().getId() != null) {
				// User consult (user specific trades)
				sql = "SELECT trades.* FROM " + table + " JOIN sales ON trd_sal_id = sal_id WHERE sal_cus_id = ? " + (trade.getId() != null ? "AND trd_id = ?" : "") + "AND trd_deleted = false";
			} else {
				// Admin consult (all trades)
				sql = "SELECT trades.* FROM " + table + " JOIN sales ON trd_sal_id = sal_id WHERE " + (trade.getId() != null ? "trd_id = ? AND" : "") + "trd_deleted = false";
			}
		} else if (operation.equals("findSaleProduct")) {
			// Get stored quantity and subtotal of original Sale SaleItem to calculate balance return
			sql = "SELECT sit_quantity, sit_subtotal FROM " + table + " "
					+ "JOIN sales_products ON trd_sal_id = sit_sal_id AND trd_prd_id = sit_prd_id "
					+ "WHERE trd_sal_id = ? AND trd_prd_id = ? AND trd_deleted = false";
		} else if (operation.equals("findFromSaleAndProduct")) {
			sql = "SELECT * FROM " + table + " WHERE trd_sal_id = ? AND trd_prd_id = ? AND trd_deleted = false";
		}

		List<Entity> trades = new ArrayList<Entity>();

		try {
			pstm = connection.prepareStatement(sql);

			if (operation.equals("consult")) {
				if (trade.getSale() != null && trade.getSale().getCustomer() != null && trade.getSale().getCustomer().getId() != null) {
					pstm.setLong(1, trade.getSale().getCustomer().getId());
					if (trade.getId() != null) {
						pstm.setLong(2, trade.getId());
					}
				} else {
					if (trade.getId() != null) {
						pstm.setLong(1, trade.getId());
					}
				}
			} else if (operation.equals("findSaleItem") || operation.equals("findFromSaleAndProduct")) {
				pstm.setLong(1, trade.getSale().getId());
				pstm.setLong(2, trade.getSaleItem().getProduct().getId());
			}
			
			System.out.println(this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString());

			rs = pstm.executeQuery();
			
			ProductDAO productDAO = new ProductDAO(connection);

			while (rs.next()) {
				Trade currentTrade = new Trade();
				if (operation.equals("consult")) {
					currentTrade.setRequestDate(rs.getTimestamp("trd_request_date").toLocalDateTime());
					
					Sale sale = new Sale();
					sale.setId(rs.getLong("trd_sal_id"));
					currentTrade.setSale(sale);
					
					currentTrade.setStatus(TradeStatus.valueOf(rs.getString("trd_status")));
					
					Product product = new Product();
					product.setId(rs.getLong("trd_prd_id"));
					currentTrade.setSaleItem(new SaleItem((Product) productDAO.consult(product, "consult").get(0), rs.getInt("trd_quantity"), 0d));
					currentTrade.getSaleItem().setSubTotal(currentTrade.getSaleItem().getPricePerProduct());
					
				} else if (operation.equals("findSaleItem")) {
					currentTrade.setSaleItem(new SaleItem(null, rs.getInt("sit_quantity"), rs.getInt("sit_subtotal")));
					trades.add(currentTrade);
				} else if (operation.equals("findExistent")) {
				}
			}

			return trades;
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
