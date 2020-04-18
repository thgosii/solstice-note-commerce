package br.com.solstice.notecommerce.controller.strategy.impl.domain.trade;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.trade.Trade;

public class ValidateTradeSaleStatusUpdate implements IStrategy {

	// TODO Validate if sale is delivered
	@Override
	public String process(Entity entity) {
		Trade trade = (Trade) entity;
		return null;
	}

}
