package br.com.solstice.notecommerce.entity.domain.trade;

import java.time.LocalDateTime;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.product.Product;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleItem;

public class Trade extends DomainEntity {
	
	private String trackingNumber;
	private LocalDateTime requestDate;
	private TradeStatus status;
	private SaleItem saleItem;
	private Sale sale;

	public String getTrackingNumber() {
		return trackingNumber;
	}

	public void setTrackingNumber(String trackingNumber) {
		this.trackingNumber = trackingNumber;
	}
	
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

	public SaleItem getSaleItem() {
		return saleItem;
	}

	public void setSaleItem(SaleItem saleItem) {
		this.saleItem = saleItem;
	}

	public Sale getSale() {
		return sale;
	}

	public void setSale(Sale sale) {
		this.sale = sale;
	}
	
	

}
