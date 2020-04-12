package br.com.solstice.notecommerce.entity.domain.trade;

import java.time.LocalDateTime;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.product.Product;

public class Trade extends DomainEntity {
	
	private LocalDateTime requestDate;
	private TradeStatus status;
	private Product product; // or SaleItem
	//private Sale sale;
	
	
	public LocalDateTime getRequestDate() {
		return requestDate;
	}
	
	public void setRequestDate(LocalDateTime requestDate) {
		this.requestDate = requestDate;
	}
	
	public TradeStatus getStatus() {
		return status;
	}
	
	public void setStatus(TradeStatus status) {
		this.status = status;
	}
	
	public Product getProduct() {
		return product;
	}
	
	public void setProduct(Product product) {
		this.product = product;
	}
	
	

}
