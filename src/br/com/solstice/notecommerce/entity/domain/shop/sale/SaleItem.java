package br.com.solstice.notecommerce.entity.domain.shop.sale;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.product.Product;

public class SaleItem extends DomainEntity {

	private Product product;
	private int quantity;
	private double subTotal;

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(double subTotal) {
		this.subTotal = subTotal;
	}

	@Override
	public String toString() {
		return "SaleItem [quantity=" + quantity + ", subTotal=" + subTotal + ", product=" + product + "]";
	}

}
