package br.com.solstice.notecommerce.dao.impl.domain.sale;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.dao.impl.domain.user.customer.AddressDAO;
import br.com.solstice.notecommerce.dao.impl.domain.user.customer.CreditCardDAO;
import br.com.solstice.notecommerce.dao.impl.domain.user.customer.CustomerDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleItem;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleStatus;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;
import br.com.solstice.notecommerce.entity.domain.user.customer.address.Address;
import br.com.solstice.notecommerce.entity.domain.user.customer.credit_card.CreditCard;

public class SaleDAO extends AbstractDAO {

	public SaleDAO() {
		super("sales", "sal_id");
	}

	@Override
	public long save(Entity entity) {
		openConnection();
		PreparedStatement pstm = null;

		Sale sale = (Sale) entity;

		String sql = "INSERT INTO " + table
				+ "(sal_date_time, sal_balance_usage, sal_ads_id, sal_crd_id, sal_cus_id, sal_status, sal_identify_number) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try {
			pstm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			pstm.setTimestamp(1, Timestamp.valueOf(sale.getDateTime()));
			pstm.setDouble(2, sale.getBalanceUsage());
			pstm.setLong(3, sale.getAddress().getId());
			pstm.setLong(4, sale.getCreditCard().getId());
			pstm.setLong(5, sale.getCustomer().getId());
			pstm.setString(6, sale.getStatus().toString());
			pstm.setString(7, sale.getIdentifyNumber());

			System.out.println(
					"  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName()
							+ ": " + pstm.toString().substring(pstm.toString().indexOf(':') + 2));

			pstm.execute();

			ResultSet rs = pstm.getGeneratedKeys();

			long idSale = 0;

			if (rs.next()) {
				idSale = rs.getLong(1);
			}

			if (idSale != 0) {
				sale.setId(idSale);

				SaleItemDAO saleItemDAO = new SaleItemDAO("", "");

				for (SaleItem item : sale.getItems()) {
					item.setSale(sale);
					saleItemDAO.save(item);
				}
			}
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

		Sale sale = (Sale) entity;

		String sql = "";

		if (operation.equals("findByCustomer")) {
			sql = "SELECT * from sales WHERE sal_cus_id=?";
		}

		List<Entity> sales = new ArrayList<Entity>();

		try {
			pstm = connection.prepareStatement(sql);

			if (operation.equals("findByCustomer")) {
				pstm.setLong(1, sale.getCustomer().getId());
			}

			System.out.println(
					"  " + this.getClass().getSimpleName() + "#" + new Exception().getStackTrace()[0].getMethodName()
							+ ": " + pstm.toString().substring(pstm.toString().indexOf(':') + 2));

			rs = pstm.executeQuery();

			while (rs.next()) {
				Sale currentSale = new Sale();
				currentSale.setId(rs.getLong("sal_id"));
				currentSale.setStatus(SaleStatus.valueOf(rs.getString("sal_status")));
				currentSale.setBalanceUsage(rs.getDouble("sal_balance_usage"));
				currentSale.setDateTime(rs.getTimestamp("sal_date_time").toLocalDateTime());
				currentSale.setIdentifyNumber(rs.getString("sal_identify_number"));

				Customer customer = new Customer();
				customer.setId(rs.getLong("sal_cus_id"));
				customer = (Customer) new CustomerDAO().consult(customer, "findById");
				currentSale.setCustomer(customer);

				Address address = new Address();
				address.setId(rs.getLong("sal_ads_id"));
				address = (Address) new AddressDAO().consult(address, "findById");
				currentSale.setAddress(address);

				CreditCard creditCard = new CreditCard();
				creditCard.setId(rs.getLong("sal_crd_id"));
				creditCard = (CreditCard) new CreditCardDAO().consult(creditCard, "findById");
				currentSale.setCreditCard(creditCard);

				SaleItem saleItemAux = new SaleItem();
				saleItemAux.setSale(currentSale);

				List<SaleItem> saleItems = new SaleItemDAO("", "").consult(saleItemAux, "consult").stream()
						.map(saleItem -> (SaleItem) saleItem).collect(Collectors.toList());
				
				currentSale.setItems(saleItems);

				sales.add(currentSale);
			}

			return sales;
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

		return sales;
	}

}
