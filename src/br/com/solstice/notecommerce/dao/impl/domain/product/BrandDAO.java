package br.com.solstice.notecommerce.dao.impl.domain.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.product.brand.Brand;

public class BrandDAO extends AbstractDAO {

	public BrandDAO() {
		super();
	}

	public BrandDAO(Connection connection) {
		super(connection);
	}

	@Override
	public long save(Entity entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void remove(Entity entity) {
		// TODO Auto-generated method stub
	}

	@Override
	public void update(Entity entity) {
		// TODO Auto-generated method stub
	}

	@Override
	public List<Entity> consult(Entity entity, String operation) {
		openConnection();

		PreparedStatement pstm = null;
		ResultSet rs = null;

		Brand brand = (Brand) entity;

		String sql = "";

		if (operation.equals("consult")) {
			sql = "SELECT * from brands WHERE brd_deleted = false";
		} else if (operation.equals("findById")) {
			sql = "SELECT * from brands WHERE brd_id = ? AND brd_deleted = false";
		}
		List<Entity> brands = new ArrayList<Entity>();

		try {
			pstm = connection.prepareStatement(sql);

			if (operation.equals("findById")) {
				pstm.setLong(1, brand.getId());
			}

			System.out.println("  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString().substring(pstm.toString().indexOf(':') + 2));

			rs = pstm.executeQuery();

			while (rs.next()) {
				Brand currentBrand = new Brand();
				currentBrand.setId(rs.getLong("brd_id"));
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
			closeConnection();
		}

		return null;
	}

}
