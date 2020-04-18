package br.com.solstice.notecommerce.controller.strategy.impl.domain.product;

import java.util.Arrays;
import java.util.List;

import br.com.solstice.notecommerce.controller.strategy.AbstractStrategy;
import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.controller.strategy.impl.domain.trade.ValidateTradeUpdate;
import br.com.solstice.notecommerce.dao.impl.domain.product.BrandDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.product.Product;
import br.com.solstice.notecommerce.entity.domain.product.brand.Brand;

public class ValidateBrand extends AbstractStrategy {
	
	public ValidateBrand(String requiredBussinessRule) { 
		super(Arrays.asList(requiredBussinessRule));
	}
	
	public ValidateBrand(List<String> requiredBussinessRules) { 
		super(requiredBussinessRules);
	}

	@Override
	public String process(Entity entity) {
		Brand brand = ((Product) entity).getBrand();
		BrandDAO brandDAO = new BrandDAO();

		if (0 == brandDAO.consult(brand, "findById").size())  {
			return "brand: A marca é inválida\n";
		}
		
		return null;
	}

}
