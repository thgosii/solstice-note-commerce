package br.com.solstice.notecommerce.dao.impl.application.admin;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.application.admin.dashboard.BrandSale;
import br.com.solstice.notecommerce.entity.application.admin.dashboard.DashboardData;
import br.com.solstice.notecommerce.entity.application.admin.dashboard.ProductTableRow;
import br.com.solstice.notecommerce.entity.domain.product.Product;

public class DashboardDataDAO extends AbstractDAO {

	public DashboardDataDAO() {
		super();
	}

	public DashboardDataDAO(Connection connection) {
		super(connection);
	}

	@Override
	public long save(Entity entity) {
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
		
		DashboardData dd = (DashboardData) entity;
		
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		String sql = "";
		
		List<Entity> dashboardDataList = new ArrayList<Entity>();
		
		try {

			// brandSaleGraph
			sql = "SELECT brd_name brand, date(sal_date_time) date, sum(sap_quantity) amount " + 
					"FROM sales " + 
					"JOIN sales_products ON sal_id = sap_sal_id " + 
					"JOIN products ON sap_prd_id = prd_id " + 
					"JOIN brands ON prd_brd_id = brd_id " + 
					"WHERE sal_date_time >= ? AND sal_date_time < date_add(?, INTERVAL 1 DAY) " + 
					"GROUP BY date(sal_date_time), brd_name " +
					"ORDER BY date(sal_date_time)";
			pstm = connection.prepareStatement(sql);
			pstm.setDate(1, Date.valueOf(dd.getMinDate()));
			pstm.setDate(2, Date.valueOf(dd.getMaxDate()));
			System.out.println("  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString().substring(pstm.toString().indexOf(':') + 2));
			rs = pstm.executeQuery();
			
			Map<String, List<BrandSale>> brandSaleGraph = new HashMap<String, List<BrandSale>>();
			while (rs.next()) {
				String brandName = rs.getString("brand");
				if (!brandSaleGraph.containsKey(brandName)) {
					brandSaleGraph.put(brandName, new ArrayList<BrandSale>());
				}
				
				LocalDate date = LocalDate.parse(rs.getString("date"));
				Long amount = rs.getLong("amount");
				brandSaleGraph.get(brandName).add(new BrandSale(date, amount));
			}
			
			pstm.close();

			
			
			// regionSaleMap
			sql = "SELECT ads_state state, sum(sap_quantity) amount " + 
					"FROM sales " + 
					"JOIN sales_products ON sal_id = sap_sal_id " + 
					"JOIN adresses ON sal_ads_id = ads_id " + 
					"WHERE sal_date_time >= ? AND sal_date_time < date_add(?, INTERVAL 1 DAY) " + 
					"GROUP BY ads_state " + 
					"ORDER BY ads_state";
			pstm = connection.prepareStatement(sql);
			pstm.setDate(1, Date.valueOf(dd.getMinDate()));
			pstm.setDate(2, Date.valueOf(dd.getMaxDate()));
			System.out.println("  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString().substring(pstm.toString().indexOf(':') + 2));
			rs = pstm.executeQuery();
			
			Map<String, Long> regionSaleMap = new HashMap<String, Long>();
			while (rs.next()) {
				String stateInitials = rs.getString("state").toLowerCase();
				Long amount = rs.getLong("amount");
				regionSaleMap.put(stateInitials, amount);
			}
			
			pstm.close();

			
			
			// mostSoldProductsTable
			sql = "SELECT prd_id id, prd_title title, sum(sap_quantity) amount " + 
					"FROM sales " + 
					"JOIN sales_products ON sal_id = sap_sal_id " + 
					"JOIN products ON sap_prd_id = prd_id " + 
					"WHERE sal_date_time >= ? AND sal_date_time < date_add(?, INTERVAL 1 DAY) " + 
					"GROUP BY prd_title " + 
					"ORDER BY sum(sap_quantity) desc " + 
					"LIMIT 10";
			pstm = connection.prepareStatement(sql);
			pstm.setDate(1, Date.valueOf(dd.getMinDate()));
			pstm.setDate(2, Date.valueOf(dd.getMaxDate()));
			System.out.println("  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString().substring(pstm.toString().indexOf(':') + 2));
			rs = pstm.executeQuery();
			
		    List<ProductTableRow> mostSoldProductsTable = new ArrayList<ProductTableRow>();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getLong("id"));
				product.setTitle(rs.getString("title"));
				Long amount = rs.getLong("amount");
				
				mostSoldProductsTable.add(new ProductTableRow(amount, product));
			}
			
			pstm.close();

			
			
			// mostTradedProductsTable
			sql = "SELECT prd_id id, prd_title title, sum(trd_quantity) amount " + 
					"FROM trades " + 
					"JOIN products ON trd_prd_id = trd_id " + 
					"WHERE trd_request_date >= ? AND trd_request_date < date_add(?, INTERVAL 1 DAY) " + 
					"GROUP BY prd_title " + 
					"ORDER BY sum(trd_quantity) desc " + 
					"LIMIT 10";
			pstm = connection.prepareStatement(sql);
			pstm.setDate(1, Date.valueOf(dd.getMinDate()));
			pstm.setDate(2, Date.valueOf(dd.getMaxDate()));
			System.out.println("  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString().substring(pstm.toString().indexOf(':') + 2));
			rs = pstm.executeQuery();

		    List<ProductTableRow> mostTradedProductsTable = new ArrayList<ProductTableRow>();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getLong("id"));
				product.setTitle(rs.getString("title"));
				Long amount = rs.getLong("amount");
				
				mostTradedProductsTable.add(new ProductTableRow(amount, product));
			}
			
			pstm.close();
			
			
			
			
			// DashboardData
			dashboardDataList.add(new DashboardData(brandSaleGraph, regionSaleMap, mostSoldProductsTable, mostTradedProductsTable));
			return dashboardDataList;
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
