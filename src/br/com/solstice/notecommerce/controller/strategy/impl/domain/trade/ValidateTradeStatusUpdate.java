package br.com.solstice.notecommerce.controller.strategy.impl.domain.trade;

import java.util.Arrays;
import java.util.List;

import br.com.solstice.notecommerce.controller.strategy.AbstractStrategy;
import br.com.solstice.notecommerce.dao.impl.domain.trade.TradeDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.trade.Trade;
import br.com.solstice.notecommerce.entity.domain.trade.TradeStatus;

public class ValidateTradeStatusUpdate extends AbstractStrategy {
	
	public ValidateTradeStatusUpdate() { 
		super(Arrays.asList(ValidateTradeUpdate.class.getName(), ValidateTradeToUpdateExists.class.getName())); // Define default/always required-to-be-valid BRs here
	}
	
	public ValidateTradeStatusUpdate(String... requiredBussinessRules) { 
		super(Arrays.asList(requiredBussinessRules));
	}
	
	// Validate if trade action can be taken based on current trade status (example: authorizing already authorized trade, finishing already finished/not authorized, etc)
	// Processed only when updating! (trade is already saved and is at least AWAITING_AUTHORIZATION)
	@Override
	public String process(Entity entity) {
		Trade trade = (Trade) entity;
		TradeDAO tradeDAO = new TradeDAO();
		
		System.out.println("entity status: " + ((Trade) entity).getStatus());
		
		Trade previousTrade = (Trade) tradeDAO.consult(trade, "consult").get(0);
		System.out.println("previous trade status: " + previousTrade.getStatus());
		
		if (previousTrade.getStatus() == TradeStatus.PRODUCT_RECEIVED) {
			return "A troca já foi finalizada";
		} else if (previousTrade.getStatus() == TradeStatus.AWAITING_AUTHORIZATION) {
			((Trade) entity).setStatus(TradeStatus.AUTHORIZED);
		} else if (previousTrade.getStatus() == TradeStatus.AUTHORIZED) {
			((Trade) entity).setStatus(TradeStatus.PRODUCT_RECEIVED);
		}

		System.out.println("entity status after processing: " + ((Trade) entity).getStatus());
		
		return null;
	}

}
