package br.com.solstice.notecommerce.entity.domain.shop.sale;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.product.Product;
import br.com.solstice.notecommerce.entity.domain.shop.cart.CartItem;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SaleItem extends DomainEntity {

	private Sale sale;
	private Product product;
	private int quantity;
	private double subTotal;

	// Used by Trade Strategy to calculate balance return
	public Double getPricePerProduct() {
		if (quantity > 0 && subTotal > 0d) {
			return subTotal / (double) quantity;
		}
		return null;
	}

	public static SaleItem fromCartItem(CartItem item) {
		SaleItem saleItem = new SaleItem();

		saleItem.setProduct(item.getProduct());
		saleItem.setQuantity(item.getQuantity());
		saleItem.setSubTotal(item.getSubTotal());

		return saleItem;
	}

	@Override
	public String toString() {
		return "SaleItem [product=" + product + ", quantity=" + quantity + ", subTotal=" + subTotal + "]";
	}

}
