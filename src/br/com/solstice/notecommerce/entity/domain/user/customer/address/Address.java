package br.com.solstice.notecommerce.entity.domain.user.customer.address;

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

	@Override
	public String toString() {
		return "Address [cep=" + cep + ", publicPlace=" + publicPlace + ", number=" + number + ", complement="
				+ complement + ", neighbourhood=" + neighbourhood + ", city=" + city + ", state=" + state + ", type="
				+ type + "]";
	}

}
