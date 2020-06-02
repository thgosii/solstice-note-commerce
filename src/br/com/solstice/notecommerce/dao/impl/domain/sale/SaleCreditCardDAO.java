package br.com.solstice.notecommerce.dao.impl.domain.sale;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.dao.impl.domain.user.customer.CreditCardDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleCreditCard;
import br.com.solstice.notecommerce.entity.domain.user.customer.credit_card.CreditCard;

public class SaleCreditCardDAO extends AbstractDAO {

	public SaleCreditCardDAO() {
		super();
	}

	public SaleCreditCardDAO(Connection connection) {
		super(connection);
	}

	@Override
	public long save(Entity entity) {
		openConnection();
		PreparedStatement pstm = null;

		SaleCreditCard saleCreditCard = (SaleCreditCard) entity;

		String sql = "INSERT INTO sales_credit_cards(scc_sal_id, scc_crd_id, scc_value) VALUES (?, ?, ?)";

		try {
			pstm = connection.prepareStatement(sql);

			pstm.setLong(1, saleCreditCard.getSale().getId());
			pstm.setLong(2, saleCreditCard.getCreditCard().getId());
			pstm.setDouble(3, saleCreditCard.getValue());

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

		SaleCreditCard saleCreditCard = (SaleCreditCard) entity;

		String sql = "";
		
		if (operation.equals("consult")) {
			sql = "SELECT * from sales_credit_cards WHERE scc_sal_id = ?";
		}

		List<Entity> saleCreditCards = new ArrayList<Entity>();

		try {
			pstm = connection.prepareStatement(sql);

			if (operation.equals("consult")) {
				pstm.setLong(1, saleCreditCard.getSale().getId());
			} 
			
			System.out.println("  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName() + ": " + pstm.toString().substring(pstm.toString().indexOf(':') + 2));

			rs = pstm.executeQuery();

			while (rs.next()) {
				SaleCreditCard currentSaleCreditCard = new SaleCreditCard();
				currentSaleCreditCard.setValue(rs.getDouble("scc_value"));
				
				// set sale
				Sale sale = new Sale();
				sale.setId(rs.getLong("scc_sal_id"));
				currentSaleCreditCard.setSale(sale);
				
				// set credit card
				CreditCard creditCard = new CreditCard();
				creditCard.setId(rs.getLong("scc_crd_id"));
				creditCard = (CreditCard) new CreditCardDAO(connection).consult(creditCard, "findById").get(0);
				currentSaleCreditCard.setCreditCard(creditCard);
				
				saleCreditCards.add(currentSaleCreditCard);
			}

			return saleCreditCards;
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

		return saleCreditCards;
	}

}
