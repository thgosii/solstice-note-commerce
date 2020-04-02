package br.com.solstice.notecommerce.entity.domain.user.customer.credit_card;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;

public class CreditCard extends DomainEntity {

	private String number;
	private String securityCode;
	private String printedName;
	private Customer customer;

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getSecurityCode() {
		return securityCode;
	}

	public void setSecurityCode(String securityCode) {
		this.securityCode = securityCode;
	}

	public String getPrintedName() {
		return printedName;
	}

	public void setPrintedName(String printedName) {
		this.printedName = printedName;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Override
	public String toString() {
		return "CreditCard [number=" + number + ", securityCode=" + securityCode + ", printedName=" + printedName
				+ ", customer=" + customer + ", getId()=" + getId() + "]";
	}

}
