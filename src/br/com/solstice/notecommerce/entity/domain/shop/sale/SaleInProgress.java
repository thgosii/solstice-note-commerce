package br.com.solstice.notecommerce.entity.domain.shop.sale;

import java.util.List;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;
import br.com.solstice.notecommerce.entity.domain.user.customer.address.Address;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class SaleInProgress extends DomainEntity {

	private double balanceUsage;
	private double creditCardUsage;
	private Address address;
	private Customer customer;
	private List<SaleCreditCard> creditCards;
	private List<SaleItem> items;
	private double total;
	private boolean saveAddressForNext;
	private boolean saveCreditCardForNext;

	public void calculateTotal() {
		double total = 0.0;

		for (SaleItem item : items) {
			total += item.getSubTotal();
		}

		this.total = total;
	}
	
	public void calculateCreditCardUsage() {
		this.creditCardUsage = total - balanceUsage;
	}

}
