package br.com.solstice.notecommerce.controller.strategy.impl.product;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.dao.impl.product.BrandDAO;
import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.product.Product;
import br.com.solstice.notecommerce.entity.domain.product.brand.Brand;

public class ValidateBrand implements IStrategy {

	@Override
	public String process(DomainEntity entity) {
		Brand brand = ((Product) entity).getBrand();
		BrandDAO brandDAO = new BrandDAO();

		if (null == brand) {
			return "brand: A marca é obrigatória";
		} else if (0 == brandDAO.consult(brand, "findById").size())  {
			return "brand: A marca é inválida\n";
		}
		
		return null;
	}

}
