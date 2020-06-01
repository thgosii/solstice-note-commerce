package br.com.solstice.notecommerce.controller.strategy.impl.domain.stock;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.stock.Stock;

public class ValidateStockSave implements IStrategy {

	@Override
	public String process(Entity entity) {
		Stock stock = (Stock) entity;
		return null;
	}

}
