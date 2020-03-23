package br.com.solstice.notecommerce.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.user.customer.Customer;
import br.com.solstice.notecommerce.domain.user.customer.credit_card.CreditCard;

public class CreditCardDAO extends AbstractDAO {

	public CreditCardDAO() {
		super("credit_cards", "crd_id");
	}

	@Override
	public int save(DomainEntity entity, String operation) {
		openConnection();
		PreparedStatement pstm = null;

		CreditCard creditCard = (CreditCard) entity;

		String sql = "INSERT INTO " + table
				+ "(crd_number, crd_printed_name, crd_security_code, crd_cus_id, crd_deleted) VALUES (?, ?, ?, ?, ?)";

		try {
			pstm = connection.prepareStatement(sql);

			pstm.setString(1, creditCard.getNumber());
			pstm.setString(2, creditCard.getPrintedName());
			pstm.setString(3, creditCard.getSecurityCode());
			
			Customer customer = (Customer) new CustomerDAO().consult(creditCard.getCustomer(), "consult").get(0);
			creditCard.setCustomer(customer);
			
			pstm.setLong(4, creditCard.getCustomer().getId());
			
			pstm.setBoolean(5, creditCard.isDeleted());

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
		openConnection();
		PreparedStatement pstm = null;

		CreditCard creditCard = (CreditCard) entity;

		String sql = "UPDATE " + table + " SET `crd_deleted`='1' WHERE `crd_id`=?";

		try {
			pstm = connection.prepareStatement(sql);

			pstm.setLong(1, creditCard.getId());

			System.out.println("pstm: " + pstm.toString());

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
			if (connection != null) {
				try {
					System.out.println("Closing connection from " + this.getClass().getSimpleName());
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	@Override
	public void update(DomainEntity entity, String operation) {
		openConnection();

		PreparedStatement pstm = null;

		CreditCard creditCard = (CreditCard) entity;

		String sql = "";

		sql = "UPDATE " + table + " SET crd_number=?, crd_printed_name=?, crd_security_code=?, crd_deleted=? WHERE "
				+ idTable + "=?";

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
			if (connection != null) {
				try {
					System.out.println("Closing connection...");
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	@Override
	public List<DomainEntity> consult(DomainEntity entity, String operation) {
		openConnection();

		PreparedStatement pstm = null;
		ResultSet rs = null;

		CreditCard creditCard = (CreditCard) entity;

		String sql = "";

		if (operation.equals("prepareUpdate")) {
			sql = "SELECT * from " + table + " WHERE " + idTable + "=?";
		} else if (operation.equals("consult")) {
			sql = "SELECT * from " + table
					+ " INNER JOIN customers ON credit_cards.crd_cus_id=customers.cus_id WHERE customers.cus_usr_id=?";
		}

		List<DomainEntity> creditCards = new ArrayList<DomainEntity>();

		try {
			pstm = connection.prepareStatement(sql);

			if (operation.equals("prepareUpdate")) {
				pstm.setLong(1, creditCard.getId());
			} else if (operation.equals("consult")) {
				pstm.setLong(1, creditCard.getCustomer().getUser().getId());
			}
			
			rs = pstm.executeQuery();

			while (rs.next()) {
				CreditCard currentCreditCard = new CreditCard();
				currentCreditCard.setId(rs.getLong(idTable));
				currentCreditCard.setNumber(rs.getString("crd_number"));
				currentCreditCard.setSecurityCode(rs.getString("crd_security_code"));
				currentCreditCard.setPrintedName(rs.getString("crd_printed_name"));

				Customer customer = new Customer();
				customer.setId(rs.getLong("crd_cus_id"));

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
			if (connection != null) {
				try {
					System.out.println("Closing connection...");
					connection.close();
				} catch (SQLException e) {
				}
			}
		}

		return creditCards;
	}

}
