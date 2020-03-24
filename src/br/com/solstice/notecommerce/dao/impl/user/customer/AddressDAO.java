package br.com.solstice.notecommerce.dao.impl.user.customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.user.customer.Customer;
import br.com.solstice.notecommerce.domain.user.customer.address.Address;
import br.com.solstice.notecommerce.domain.user.customer.address.AddressType;

public class AddressDAO extends AbstractDAO {

	public AddressDAO() {
		super("adresses", "ads_id");
	}

	@Override
	public int save(DomainEntity entity, String operation) {
		openConnection();
		PreparedStatement pstm = null;

		Address address = (Address) entity;

		String sql = "INSERT INTO " + table + "(ads_cep, ads_public_place, ads_number, "
				+ "ads_complement, ads_neighbourhood, ads_city, ads_state, ads_type, "
				+ "ads_cus_id, ads_deleted) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			pstm = connection.prepareStatement(sql);

			pstm.setString(1, address.getCep());
			pstm.setString(2, address.getPublicPlace());
			pstm.setString(3, address.getNumber());
			pstm.setString(4, address.getComplement());
			pstm.setString(5, address.getNeighbourhood());
			pstm.setString(6, address.getCity());
			pstm.setString(7, address.getState());
			pstm.setString(8, address.getType().toString().toLowerCase());

			Customer customer = (Customer) new CustomerDAO().consult(address.getCustomer(), "consult").get(0);

			pstm.setLong(9, customer.getId());
			pstm.setBoolean(10, address.isDeleted());

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

		Address address = (Address) entity;

		String sql = "UPDATE " + table + " SET `ads_deleted`='1' WHERE `ads_id`=?";

		try {
			pstm = connection.prepareStatement(sql);

			pstm.setLong(1, address.getId());

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

		Address address = (Address) entity;

		String sql = "UPDATE " + table
				+ " SET ads_cep=?, ads_public_place=?, ads_number=?, ads_complement=?, ads_neighbourhood=?, ads_city=?, ads_state=?, ads_type=?, ads_deleted=? WHERE "
				+ idTable + "=?";

		try {
			pstm = connection.prepareStatement(sql);

			pstm.setString(1, address.getCep());
			pstm.setString(2, address.getPublicPlace());
			pstm.setString(3, address.getNumber());
			pstm.setString(4, address.getComplement());
			pstm.setString(5, address.getNeighbourhood());
			pstm.setString(6, address.getCity());
			pstm.setString(7, address.getState());
			pstm.setString(8, address.getType().toString().toLowerCase());
			pstm.setBoolean(9, address.isDeleted());
			pstm.setLong(10, address.getId());

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

		Address address = (Address) entity;

		String sql = "";

		if (operation.equals("consult")) {
			sql = "SELECT * from " + table
					+ " INNER JOIN customers ON adresses.ads_cus_id=customers.cus_id WHERE customers.cus_usr_id=? AND ads_deleted = false";
		} else if (operation.equals("prepareUpdate")) {
			sql = "SELECT * from " + table + " WHERE " + idTable + "=?";
		}

		List<DomainEntity> adresses = new ArrayList<DomainEntity>();

		try {
			pstm = connection.prepareStatement(sql);

			if (operation.equals("consult")) {
				pstm.setLong(1, address.getCustomer().getUser().getId());
			} else if (operation.equals("prepareUpdate")) {
				pstm.setLong(1, address.getId());
			}

			rs = pstm.executeQuery();

			while (rs.next()) {
				Address currentAddress = new Address();
				currentAddress.setId(rs.getLong(idTable));
				currentAddress.setCep(rs.getString("ads_cep"));
				currentAddress.setPublicPlace(rs.getString("ads_public_place"));
				currentAddress.setNumber(rs.getString("ads_number"));
				currentAddress.setComplement(rs.getString("ads_complement"));
				currentAddress.setNeighbourhood(rs.getString("ads_neighbourhood"));
				currentAddress.setCity(rs.getString("ads_city"));
				currentAddress.setState(rs.getString("ads_state"));

				if (rs.getString("ads_type").equals("shipping")) {
					currentAddress.setType(AddressType.SHIPPING);
				} else if (rs.getString("ads_type").equals("billing")) {
					currentAddress.setType(AddressType.BILLING);
				} else if (rs.getString("ads_type").equals("shipping_and_billing")) {
					currentAddress.setType(AddressType.SHIPPING_AND_BILLING);
				}

				Customer customer = new Customer();
				customer.setId(rs.getLong("ads_cus_id"));

				currentAddress.setCustomer(customer);

				currentAddress.setDeleted(rs.getBoolean("ads_deleted"));

				adresses.add(currentAddress);
			}

			return adresses;
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

		return adresses;
	}

}
