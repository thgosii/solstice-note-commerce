package br.com.solstice.notecommerce.entity.domain.shop.sale;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
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
@ToString(callSuper = true)
public class SaleItem extends DomainEntity {

	private Product product;
	private int quantity;
	private double subTotal;
	
	 // Used by Trade Strategy to calculate balance return
	public Double getPricePerProduct() {
		if (quantity > 0 && subTotal > 0d) {
			return subTotal / quantity;
		}
		return null;
	}

}
