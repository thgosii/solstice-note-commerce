package br.com.solstice.notecommerce.entity.domain.shop.sale;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.user.customer.credit_card.CreditCard;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SaleCreditCard extends DomainEntity {

	private Sale sale;
	private CreditCard creditCard;
	private double value;

	@Override
	public String toString() {
		return "SaleCreditCard [creditCard=" + creditCard + ", value=" + value + "]";
	}

}
