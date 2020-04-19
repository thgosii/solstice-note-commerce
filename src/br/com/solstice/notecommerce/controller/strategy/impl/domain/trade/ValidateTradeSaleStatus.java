package br.com.solstice.notecommerce.controller.strategy.impl.domain.trade;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.trade.Trade;

public class ValidateTradeSaleStatus implements IStrategy {

	@Override
	public String process(Entity entity) {
		// TODO: Use SaleDAO to verify if Sale is delivered (status)
		Trade trade = (Trade) entity;
		return null;
	}

}
