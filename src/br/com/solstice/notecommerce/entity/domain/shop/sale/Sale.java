package br.com.solstice.notecommerce.entity.domain.shop.sale;

import java.time.LocalDateTime;
import java.util.List;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;
import br.com.solstice.notecommerce.entity.domain.user.customer.address.Address;
import br.com.solstice.notecommerce.entity.domain.user.customer.credit_card.CreditCard;
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
public class Sale extends DomainEntity {

	private double balanceUsage;
	private CreditCard creditCard;
	private Address address;
	private Customer customer;
	private List<SaleItem> items;
	private LocalDateTime dateTime;
	private SaleStatus status;
	private String identifyNumber;

	public static String generateIdentifyNumber(Long userId) {
		String millis = String.valueOf(System.currentTimeMillis());
		String invertedMillis = "";

		for (int i = millis.length() - 1; i >= 0; i--) {
			invertedMillis += millis.charAt(i);
		}

		return userId + "" + invertedMillis;
	}

}
