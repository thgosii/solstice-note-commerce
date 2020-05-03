package br.com.solstice.notecommerce.entity.domain.user.customer.credit_card;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CreditCard extends DomainEntity {

	private String number;
	private String securityCode;
	private String printedName;
	private Customer customer;

	@Override
	public String toString() {
		return "CreditCard [number=" + number + ", securityCode=" + securityCode + ", printedName=" + printedName + "]";
	}

}
