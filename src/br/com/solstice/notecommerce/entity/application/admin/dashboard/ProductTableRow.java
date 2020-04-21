package br.com.solstice.notecommerce.entity.application.admin.dashboard;

import java.time.LocalDate;

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
public class ProductTableRow {
	
	private Long amount;
	private Product product;

}
