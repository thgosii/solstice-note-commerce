package br.com.solstice.notecommerce.entity.domain.user.customer;

import java.time.LocalDate;
import java.util.List;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.user.User;
import br.com.solstice.notecommerce.entity.domain.user.customer.address.Address;
import br.com.solstice.notecommerce.entity.domain.user.customer.credit_card.CreditCard;

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public LocalDate getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(LocalDate dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public List<Address> getAdresses() {
		return adresses;
	}

	public void setAdresses(List<Address> adresses) {
		this.adresses = adresses;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public List<CreditCard> getCreditCards() {
		return creditCards;
	}

	public void setCreditCards(List<CreditCard> creditCards) {
		this.creditCards = creditCards;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

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

	@Override
	public String toString() {
		return "Customer [name=" + name + ", cpf=" + cpf + ", dateOfBirth=" + dateOfBirth + ", gender=" + gender
				+ ", adresses=" + adresses + ", creditCards=" + creditCards + ", phone=" + phone + ", user=" + user
				+ ", getId()=" + getId() + "]";
	}

}
