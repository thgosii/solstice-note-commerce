package br.com.solstice.notecommerce.dao.impl.domain.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.user.User;
import br.com.solstice.notecommerce.entity.domain.user.UserRole;

public class UserDAO extends AbstractDAO {
	
	private static final String PASSWORD_KEY = "The cake is a lie";

	public UserDAO() {
		super();
	}

	public UserDAO(Connection connection) {
		super(connection);
	}

	@Override
	public long save(Entity entity) {
		openConnection();
		PreparedStatement pstm = null;

		User user = (User) entity;

		String sql = "INSERT INTO users (usr_email, usr_password, usr_role, usr_deleted) VALUES (?, hex(aes_encrypt(?, ?)), ?, ?)";

		try {
			pstm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			pstm.setString(1, user.getEmail());
			pstm.setString(2, user.getPassword());
			pstm.setString(3, PASSWORD_KEY);
			pstm.setString(4, user.getRole().toString().toLowerCase());
			pstm.setBoolean(5, user.isDeleted());

			System.out.println("  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString().substring(pstm.toString().indexOf(':') + 2));

			pstm.execute();

			ResultSet rs = pstm.getGeneratedKeys();

			long idUser = 0;

			if (rs.next()) {
				idUser = rs.getLong(1);
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
			closeConnection();
		}
		return 0;
	}

	@Override
	public void remove(Entity entity) {

	}

	@Override
	public void update(Entity entity) {
		openConnection();

		PreparedStatement pstm = null;

		User user = (User) entity;

		String sql = "UPDATE users SET usr_password=hex(aes_encrypt(?, ?)) WHERE usr_id=?";

		try {
			pstm = connection.prepareStatement(sql);

			pstm.setString(1, user.getPassword());
			pstm.setString(2, PASSWORD_KEY);
			pstm.setLong(3, user.getId());

			System.out.println("  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString().substring(pstm.toString().indexOf(':') + 2));

			pstm.executeUpdate();
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

		User user = (User) entity;

		String sql = "";
		if (operation.equals("login")) {
			sql = "SELECT usr_id, usr_email, cast(aes_decrypt(unhex(usr_password), ?) as char) usr_password, usr_role, usr_deleted"
					+ " from users WHERE usr_email=? AND usr_password=hex(aes_encrypt(?, ?)) AND usr_deleted = false";
		} else if (operation.equals("findById")) {
			sql = "SELECT * from users WHERE usr_id=? AND usr_deleted = false";
		} else if (operation.equals("existsEmail")) {
			sql = "SELECT * from users WHERE usr_email=? AND usr_deleted = false";
		}

		List<Entity> users = new ArrayList<Entity>();

		try {
			pstm = connection.prepareStatement(sql);

			if (operation.equals("login")) {
				pstm.setString(1, PASSWORD_KEY);
				pstm.setString(2, user.getEmail());
				pstm.setString(3, user.getPassword());
				pstm.setString(4, PASSWORD_KEY);
			} else if (operation.equals("findById")) {
				pstm.setLong(1, user.getId());
			} else if (operation.equals("existsEmail")) {
				pstm.setString(1, user.getEmail());
			}

			System.out.println("  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString().substring(pstm.toString().indexOf(':') + 2));

			rs = pstm.executeQuery();

			while (rs.next()) {
				User currentUser = new User();
				currentUser.setId(rs.getLong("usr_id"));
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
			closeConnection();
		}

		return users;
	}

}
