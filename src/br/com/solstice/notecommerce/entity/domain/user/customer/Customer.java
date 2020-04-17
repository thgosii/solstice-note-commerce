package br.com.solstice.notecommerce.entity.domain.user.customer;

import java.time.LocalDate;
import java.util.List;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.user.User;
import br.com.solstice.notecommerce.entity.domain.user.customer.address.Address;
import br.com.solstice.notecommerce.entity.domain.user.customer.credit_card.CreditCard;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(callSuper = true)
public class Customer extends DomainEntity {

	private String name;
	private String cpf;
	private LocalDate dateOfBirth;
	private Gender gender;
	private List<Address> adresses;
	private List<CreditCard> creditCards;
	private String phone;
	private double balance;
	private User user;

	public String getDecoratedCpf() {
		String decoratedCpf = "";

		int count = 1;

		for (Character chr : cpf.toCharArray()) {
			decoratedCpf += chr;
			if (count % 3 == 0) {
				if (count == 9) {
					decoratedCpf += '-';
				} else {
					decoratedCpf += '.';
				}
			}
			count++;
		}

		return decoratedCpf;
	}

}
