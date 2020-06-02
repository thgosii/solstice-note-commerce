package br.com.solstice.notecommerce.controller.strategy.impl.domain.stock;

import java.util.Arrays;
import java.util.List;

import br.com.solstice.notecommerce.controller.strategy.AbstractStrategy;
import br.com.solstice.notecommerce.dao.impl.domain.stock.StockDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.stock.StockUpdate;

public class ValidateStockUpdateStockExists extends AbstractStrategy {
	
	public ValidateStockUpdateStockExists() {
		super(Arrays.asList(ValidateStockUpdateSave.class.getName()));
	}

	public ValidateStockUpdateStockExists(List<String> requiredBussinessRules) {
		super(requiredBussinessRules);
	}

	@Override
	public String process(Entity entity) {
		StockUpdate stockUpdate = (StockUpdate) entity;
		StockDAO stockDAO = new StockDAO();
		
		if (stockDAO.consult(stockUpdate.getStock(), "consult").size() < 1) {
			return "O estoque a ser atualizado é inválido";
		}
		
		return null;
	}

}
