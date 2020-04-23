package br.com.solstice.notecommerce.entity.application.admin.dashboard;

import br.com.solstice.notecommerce.entity.domain.product.Product;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class ProductTableRow {
	
	private Long amount;
	private Product product;

}
