package br.com.solstice.notecommerce.controller.strategy.impl.domain.trade;

import java.util.Arrays;

import br.com.solstice.notecommerce.controller.strategy.AbstractStrategy;
import br.com.solstice.notecommerce.dao.impl.domain.trade.TradeDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.trade.Trade;
import br.com.solstice.notecommerce.entity.domain.trade.TradeStatus;
import br.com.solstice.notecommerce.entity.domain.trade.TradeType;

public class SetTradeStatus extends AbstractStrategy {
	
	public SetTradeStatus() { 
		super(Arrays.asList(ValidateTradeUpdate.class.getName(), ValidateTradeToUpdateExists.class.getName())); // Define default/always required-to-be-valid BRs here
	}
	
	public SetTradeStatus(String... requiredBussinessRules) { 
		super(Arrays.asList(requiredBussinessRules));
	}
	
	// Validate if trade action can be taken based on current trade status (example: authorizing already authorized trade, finishing already finished/not authorized, etc)
	// Processed only when updating! (trade is already saved and is at least AWAITING_AUTHORIZATION)
	@Override
	public String process(Entity entity) {
		Trade trade = (Trade) entity;
		TradeDAO tradeDAO = new TradeDAO();
		
		Trade previousTrade = (Trade) tradeDAO.consult(trade, "consult").get(0);
		
		System.out.println("trade status: " + ((Trade) entity).getStatus() + " previousTrade status: " + previousTrade.getStatus());
		
		if (previousTrade.getType() == TradeType.EXCHANGE) {
			switch (previousTrade.getStatus()) {
			case AWAITING_AUTHORIZATION:
				if (trade.getStatus() == null || 
					(trade.getStatus() != TradeStatus.AUTHORIZED && trade.getStatus() != TradeStatus.DENIED)) {
					return "É necessário autorizar ou recusar o pedido de troca";
				} // else -> status AUTHORIZED ou DENIED já em entity
				break;
			case DENIED:
			case REPLACEMENT_DELIVERED:
				return "A troca não possui mais ações";
			case AUTHORIZED:
				((Trade) entity).setStatus(TradeStatus.PRODUCT_RECEIVED);
				break;
			case PRODUCT_RECEIVED:
				((Trade) entity).setStatus(TradeStatus.REPLACEMENT_ON_DELIVERY);
				break;
			case REPLACEMENT_ON_DELIVERY:
				((Trade) entity).setStatus(TradeStatus.REPLACEMENT_DELIVERED);
			}
		} else if (previousTrade.getType() == TradeType.DEVOLUTION) {
			switch (previousTrade.getStatus()) {
			case AWAITING_AUTHORIZATION:
				if (trade.getStatus() == null || 
					(trade.getStatus() != TradeStatus.AUTHORIZED && trade.getStatus() != TradeStatus.DENIED)) {
					return "É necessário autorizar ou recusar o pedido de devolução";
				} // else -> status AUTHORIZED ou DENIED já em entity
				break;
			case DENIED:
			case PRODUCT_RECEIVED:
				return "A devolução não possui mais ações";
			case AUTHORIZED:
				((Trade) entity).setStatus(TradeStatus.PRODUCT_RECEIVED);
			}
		}
		
		System.out.println("new trade status: " + ((Trade) entity).getStatus());
		
		return null;
	}

}
