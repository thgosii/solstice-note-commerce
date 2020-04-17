package br.com.solstice.notecommerce.entity.domain.user.customer.address;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;
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
public class Address extends DomainEntity {

	private String cep;
	private String publicPlace;
	private String number;
	private String complement;
	private String neighbourhood;
	private String city;
	private String state;
	private Customer customer;
	private AddressType type;

}
