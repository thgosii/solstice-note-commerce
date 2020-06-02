package br.com.solstice.notecommerce.controller.strategy.impl.domain.stock;

import java.util.Arrays;
import java.util.List;

import br.com.solstice.notecommerce.controller.strategy.AbstractStrategy;
import br.com.solstice.notecommerce.dao.impl.domain.stock.StockDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.stock.Stock;
import br.com.solstice.notecommerce.entity.domain.stock.StockUpdate;

public class SetStockQuantity extends AbstractStrategy {
	
	public SetStockQuantity() {
		super(Arrays.asList(ValidateStockUpdateSave.class.getName(), ValidateStockUpdateStockExists.class.getName()));
	}

	public SetStockQuantity(List<String> requiredBussinessRules) {
		super(requiredBussinessRules);
	}

	@Override
	public String process(Entity entity) {
		StockUpdate stockUpdate = (StockUpdate) entity;
		StockDAO stockDAO = new StockDAO();
		
		Stock currentStock = (Stock) stockDAO.consult(stockUpdate.getStock(), "consult").get(0);
		System.out.println(stockUpdate);
		System.out.println(currentStock);
		stockUpdate.getStock().setQuantity(currentStock.getQuantity() + stockUpdate.getQuantity());
		
		// Updates stock with new quantity
		stockDAO.update(stockUpdate.getStock());
		
		return null;
	}

}
