package br.com.solstice.notecommerce.entity.domain.stock;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.product.Product;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class Stock extends DomainEntity {
	
	private Product product;
	private Integer quantity;

	public Stock(Long id) {
		super(id);
	}

}
