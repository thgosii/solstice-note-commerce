package br.com.solstice.notecommerce.dao.impl.domain.user.customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;
import br.com.solstice.notecommerce.entity.domain.user.customer.credit_card.CreditCard;

public class CreditCardDAO extends AbstractDAO {

	public CreditCardDAO() {
		super();
	}

	public CreditCardDAO(Connection connection) {
		super(connection);
	}

	@Override
	public long save(Entity entity) {
		openConnection();
		PreparedStatement pstm = null;

		CreditCard creditCard = (CreditCard) entity;

		String sql = "INSERT INTO credit_cards "
				+ "(crd_number, crd_printed_name, crd_security_code, crd_cus_id, crd_deleted) VALUES (?, ?, ?, ?, ?)";

		try {
			pstm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			pstm.setString(1, creditCard.getNumber());
			pstm.setString(2, creditCard.getPrintedName());
			pstm.setString(3, creditCard.getSecurityCode());
			
			Customer customer = (Customer) new CustomerDAO(connection).consult(creditCard.getCustomer(), "consult").get(0);
			creditCard.setCustomer(customer);
			
			pstm.setLong(4, creditCard.getCustomer().getId());
			
			pstm.setBoolean(5, creditCard.isDeleted());

			pstm.execute();
			
			ResultSet rs = pstm.getGeneratedKeys();

			long idCreditCard = 0;

			if (rs.next()) {
				idCreditCard = rs.getLong(1);
			}
			
			return idCreditCard;
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
		openConnection();
		PreparedStatement pstm = null;

		CreditCard creditCard = (CreditCard) entity;

		String sql = "UPDATE credit_cards SET `crd_deleted`='1' WHERE `crd_id`=?";

		try {
			pstm = connection.prepareStatement(sql);

			pstm.setLong(1, creditCard.getId());

			System.out.println("  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString().substring(pstm.toString().indexOf(':') + 2));

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
	public void update(Entity entity) {
		openConnection();

		PreparedStatement pstm = null;

		CreditCard creditCard = (CreditCard) entity;

		String sql = "";

		sql = "UPDATE credit_cards SET crd_number=?, crd_printed_name=?, crd_security_code=?, crd_deleted=? WHERE "
				+ "crd_id=?";

		try {
			pstm = connection.prepareStatement(sql);

			pstm.setString(1, creditCard.getNumber());
			pstm.setString(2, creditCard.getPrintedName());
			pstm.setString(3, creditCard.getSecurityCode());
			pstm.setBoolean(4, creditCard.isDeleted());
			pstm.setLong(5, creditCard.getId());

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

		CreditCard creditCard = (CreditCard) entity;

		String sql = "";

		if (operation.equals("prepareUpdate") || operation.equals("findById")) {
			sql = "SELECT * from credit_cards WHERE crd_id=?";
		} else if (operation.equals("consult")) {
			sql = "SELECT * from credit_cards"
					+ " INNER JOIN customers ON credit_cards.crd_cus_id=customers.cus_id WHERE customers.cus_usr_id=?";
		}

		List<Entity> creditCards = new ArrayList<Entity>();

		try {
			pstm = connection.prepareStatement(sql);

			if (operation.equals("prepareUpdate") || operation.equals("findById")) {
				pstm.setLong(1, creditCard.getId());
			} else if (operation.equals("consult")) {
				pstm.setLong(1, creditCard.getCustomer().getUser().getId());
			}
			
			rs = pstm.executeQuery();

			while (rs.next()) {
				CreditCard currentCreditCard = new CreditCard();
				currentCreditCard.setId(rs.getLong("crd_id"));
				currentCreditCard.setNumber(rs.getString("crd_number"));
				currentCreditCard.setSecurityCode(rs.getString("crd_security_code"));
				currentCreditCard.setPrintedName(rs.getString("crd_printed_name"));

				Customer customer = new Customer();
				customer.setId(rs.getLong("crd_cus_id"));
				
				customer = (Customer) new CustomerDAO().consult(customer, "findById").get(0);

				currentCreditCard.setCustomer(customer);

				currentCreditCard.setDeleted(rs.getBoolean("crd_deleted"));

				creditCards.add(currentCreditCard);
			}

			return creditCards;
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

		return creditCards;
	}

}
