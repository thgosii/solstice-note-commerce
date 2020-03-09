package br.com.solstice.notecommerce.controller.strategy.impl.product;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.product.Product;
import br.com.solstice.notecommerce.domain.product.brand.Brand;

public class ValidateBrand implements IStrategy {

	@Override
	public String process(DomainEntity entity) {
		Brand brand = ((Product) entity).getBrand();

		if (null == brand) {
			return "brand: A marca é obrigatória";
		} else if (/*dao*/)  {
			return "brand: A marca é inválida\n";
		}
	}

}
