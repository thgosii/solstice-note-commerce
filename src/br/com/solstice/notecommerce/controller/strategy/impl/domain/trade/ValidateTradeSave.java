package br.com.solstice.notecommerce.controller.strategy.impl.domain.trade;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.trade.Trade;

public class ValidateTradeSave implements IStrategy {

	@Override
	public String process(Entity entity) {
		Trade trade = (Trade) entity;
		StringBuilder sb = new StringBuilder();
		
		if (trade.getSale().getId() != null) {
			sb.append("É necessário especificar a compra relacionada a sua troca\n");
		}
		if (trade.getSaleItem().getQuantity() == -1) {
			sb.append("É necessário especificar a quantidade do produto comprado a ser trocado\n");
		}
		if (trade.getSaleItem().getProduct().getId() == null) {
			sb.append("É necessario especificar o produto a ser trocado\n");
		}
		if (trade.getType() == null) {
			sb.append("Tipo de troca não especificado\n");
		}
		
		return sb.toString().trim().isEmpty() ? null : sb.toString().trim();
	}

}
