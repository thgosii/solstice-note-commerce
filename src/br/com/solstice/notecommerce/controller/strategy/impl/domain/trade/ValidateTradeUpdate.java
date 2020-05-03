package br.com.solstice.notecommerce.controller.strategy.impl.domain.trade;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.trade.Trade;

public class ValidateTradeUpdate implements IStrategy {

	@Override
	public String process(Entity entity) {
		Trade trade = (Trade) entity;
		StringBuilder sb = new StringBuilder();
		
		if (trade.getId() == null) {
			sb.append("Troca não especificada\n");
		}
		if (trade.getType() == null) {
			sb.append("Tipo de troca não especificado\n");
		}

		return sb.toString().trim().isEmpty() ? null : sb.toString().trim();
	}

}
