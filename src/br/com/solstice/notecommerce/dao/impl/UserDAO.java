package br.com.solstice.notecommerce.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.user.User;
import br.com.solstice.notecommerce.domain.user.UserRole;

public class UserDAO extends AbstractDAO {

	public UserDAO() {
		super("users", "usr_id");
	}

	@Override
	public int save(DomainEntity entity, String operation) {
		openConnection();
		PreparedStatement pstm = null;

		User user = (User) entity;

		String sql = "INSERT INTO " + table + "(usr_email, usr_password, usr_role, usr_deleted) VALUES (?, ?, ?, ?)";

		try {
			pstm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			pstm.setString(1, user.getEmail());
			pstm.setString(2, user.getPassword());
			pstm.setString(3, user.getRole().toString().toLowerCase());
			pstm.setBoolean(4, user.isDeleted());

			pstm.execute();

			ResultSet rs = pstm.getGeneratedKeys();

			int idUser = 0;

			if (rs.next()) {
				idUser = rs.getInt(1);
			}

			return idUser;
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
		return 0;
	}

	@Override
	public void remove(DomainEntity entity, String operation) {

	}

	@Override
	public void update(DomainEntity entity, String operation) {

	}

	@Override
	public List<DomainEntity> consult(DomainEntity entity, String operation) {
		openConnection();

		PreparedStatement pstm = null;
		ResultSet rs = null;

		User user = (User) entity;

		String sql = "";
		if (operation.equals("login")) {
			sql = "SELECT * from " + table + " WHERE usr_email=? AND usr_password=?";
		} else if (operation.equals("findById")) {
			sql = "SELECT * from " + table + " WHERE usr_id=?";
		}

		List<DomainEntity> users = new ArrayList<DomainEntity>();

		try {
			pstm = connection.prepareStatement(sql);

			if (operation.equals("login")) {
				pstm.setString(1, user.getEmail());
				pstm.setString(2, user.getPassword());
			}  else if (operation.equals("findById")) {
				pstm.setLong(1, user.getId());
			}

			rs = pstm.executeQuery();

			while (rs.next()) {
				User currentUser = new User();
				currentUser.setId(rs.getLong(idTable));
				currentUser.setEmail(rs.getString("usr_email"));
				currentUser.setPassword(rs.getString("usr_password"));
				currentUser.setRole(rs.getString("usr_role").equals("client") ? UserRole.CLIENT : UserRole.ADMIN);
				currentUser.setDeleted(rs.getBoolean("usr_deleted"));

				users.add(currentUser);
			}

			return users;
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

		return users;
	}

}
