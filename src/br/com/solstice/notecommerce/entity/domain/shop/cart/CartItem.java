package br.com.solstice.notecommerce.entity.domain.shop.cart;

import br.com.solstice.notecommerce.entity.domain.product.Product;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CartItem {

	private Product product;
	private int quantity;
	private double subTotal;

	public CartItem(Product product, int quantity) {
		this.product = product;
		this.quantity = quantity;
	}

}
