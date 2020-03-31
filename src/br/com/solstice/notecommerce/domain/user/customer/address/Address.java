package br.com.solstice.notecommerce.domain.user.customer.address;

import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.user.customer.Customer;

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

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getPublicPlace() {
		return publicPlace;
	}

	public void setPublicPlace(String publicPlace) {
		this.publicPlace = publicPlace;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getComplement() {
		return complement;
	}

	public void setComplement(String complement) {
		this.complement = complement;
	}

	public String getNeighbourhood() {
		return neighbourhood;
	}

	public void setNeighbourhood(String neighbourhood) {
		this.neighbourhood = neighbourhood;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public AddressType getType() {
		return type;
	}

	public void setType(AddressType type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Address [cep=" + cep + ", publicPlace=" + publicPlace + ", number=" + number + ", complement="
				+ complement + ", neighbourhood=" + neighbourhood + ", city=" + city + ", state=" + state
				+ ", customer=" + customer + ", type=" + type + ", getId()=" + getId() + "]";
	}

}
