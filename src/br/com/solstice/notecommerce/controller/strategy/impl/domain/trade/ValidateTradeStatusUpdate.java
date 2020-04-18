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
		super(Arrays.asList(ValidateTradeUpdate.class.getName())); // Define default/always required-to-be-valid BRs here
	}
	
	public ValidateTradeStatusUpdate(String requiredBussinessRule) { 
		super(Arrays.asList(requiredBussinessRule));
	}
	
	public ValidateTradeStatusUpdate(List<String> requiredBussinessRules) { 
		super(requiredBussinessRules);
	}

	// Validate if trade action can be taken based on current trade status (example: authorizing already authorized trade, finishing already finished/not authorized, etc)
	// Processed only when updating! (trade is already saved and is at least AWAITING_AUTHORIZATION)
	@Override
	public String process(Entity entity) {
		Trade trade = (Trade) entity;
		TradeDAO tradeDAO = new TradeDAO();
		
		if (trade.getStatus() == TradeStatus.AWAITING_AUTHORIZATION) {
			return "Não é possível desautorizar trocas";
		}
		
		Trade previousTrade = null;
		
		List<Entity> listEntities = tradeDAO.consult(trade, "consult"); // trade must have id set
		if (listEntities.size() == 0) {
			return "A troca não existe";
		}
		
		previousTrade = (Trade) listEntities.get(0);
		
		if (previousTrade.getStatus() == TradeStatus.PRODUCT_RECEIVED) {
			return "A troca já foi finalizada";
		} else if (previousTrade.getStatus() == TradeStatus.AWAITING_AUTHORIZATION && trade.getStatus() != TradeStatus.AUTHORIZED) {
			return "Só é possível autorizar trocas que estão aguardando autorização";
		}
		
		return null;
	}

}
