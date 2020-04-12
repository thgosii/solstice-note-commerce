package br.com.solstice.notecommerce.entity.domain.shop.sale;

import java.time.LocalDateTime;
import java.util.List;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;

public class Sale extends DomainEntity {

	private double total;
	private Customer customer;
	private List<SaleItem> items;
	private LocalDateTime dateTime;

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public List<SaleItem> getItems() {
		return items;
	}

	public void setItems(List<SaleItem> items) {
		this.items = items;
	}

	public LocalDateTime getDateTime() {
		return dateTime;
	}

	public void setDateTime(LocalDateTime dateTime) {
		this.dateTime = dateTime;
	}

}
