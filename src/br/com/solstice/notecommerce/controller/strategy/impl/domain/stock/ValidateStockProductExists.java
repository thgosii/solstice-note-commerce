package br.com.solstice.notecommerce.controller.strategy.impl.domain.stock;

import java.util.Arrays;
import java.util.List;

import br.com.solstice.notecommerce.controller.strategy.AbstractStrategy;
import br.com.solstice.notecommerce.dao.impl.domain.product.ProductDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.stock.Stock;

public class ValidateStockProductExists extends AbstractStrategy {

	public ValidateStockProductExists() {
		super(Arrays.asList(ValidateStockSave.class.getName()));
	}

	public ValidateStockProductExists(List<String> requiredBussinessRules) {
		super(requiredBussinessRules);
	}

	@Override
	public String process(Entity entity) {
		Stock stock = (Stock) entity;
		ProductDAO productDAO = new ProductDAO();
		
		if (productDAO.consult(stock, "consult").size() < 1) {
			return "O produto selecionado para o estoque é inválido";
		}
		
		return null;
	}

}
