package br.com.solstice.notecommerce.controller.strategy.impl.domain.trade;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.trade.Trade;

public class ValidateTradeUpdate implements IStrategy {

	@Override
	public String process(Entity entity) {
		Trade trade = (Trade) entity;
		
		if (trade.getId() == null) {
			return "Troca não especificada";
		}
		
		return null;
	}

}
