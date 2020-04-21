package br.com.solstice.notecommerce.entity.application.admin.dashboard;

import br.com.solstice.notecommerce.entity.domain.product.Product;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MostTradedProduct {
	
	private Long amount;
	private Product product;

}
