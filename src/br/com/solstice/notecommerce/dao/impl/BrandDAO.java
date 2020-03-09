package br.com.solstice.notecommerce.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.product.brand.Brand;
import br.com.solstice.notecommerce.domain.user.User;
import br.com.solstice.notecommerce.domain.user.customer.Customer;
import br.com.solstice.notecommerce.domain.user.customer.Gender;

public class BrandDAO extends AbstractDAO {

	public BrandDAO() {
		super("brands", "brd_id");
	}

	public BrandDAO(String table, String idtable) {
		super(table, idtable);
	}

	@Override
	public int save(DomainEntity entity, String operation) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void remove(DomainEntity entity, String operation) {
		// TODO Auto-generated method stub
	}

	@Override
	public void update(DomainEntity entity, String operation) {
		// TODO Auto-generated method stub
	}

	@Override
	public List<DomainEntity> consult(DomainEntity entity, String operation) {
		openConnection();

		PreparedStatement pstm = null;
		ResultSet rs = null;

		Brand brand = (Brand) entity;

		String sql = "";

		if (operation.equals("consult")) {
			sql = "SELECT * from " + table + " WHERE brd_deleted = false";
		} else if (operation.equals("findById")) {
			sql = "SELECT * from " + table + " WHERE " + idTable + " = ? AND brd_deleted = false";
		}
		List<DomainEntity> brands = new ArrayList<DomainEntity>();

		try {
			pstm = connection.prepareStatement(sql);

			if (operation.equals("consult")) {
			} else if (operation.equals("findById")) {
				pstm.setLong(1, brand.getId());
			}

			rs = pstm.executeQuery();

			while (rs.next()) {
				Brand currentBrand = new Brand();
				currentBrand.setId(rs.getLong(idTable));
				currentBrand.setName(rs.getString("brd_name"));

				brands.add(currentBrand);
			}

			return brands;
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
					System.out.println("Closing connection...");
					connection.close();
				} catch (SQLException e) {
				}
			}
		}

		return null;
	}

}
