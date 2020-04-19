package br.com.solstice.notecommerce.controller.strategy.impl.domain.trade;

import java.util.Arrays;
import java.util.List;

import br.com.solstice.notecommerce.controller.strategy.AbstractStrategy;
import br.com.solstice.notecommerce.dao.impl.domain.trade.TradeDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.trade.Trade;

public class ValidateTradeToUpdateExists extends AbstractStrategy {
	
	public ValidateTradeToUpdateExists() { 
		super(Arrays.asList(ValidateTradeUpdate.class.getName()));
	}
	
	public ValidateTradeToUpdateExists(String... requiredBussinessRules) { 
		super(Arrays.asList(requiredBussinessRules));
	}
	
	@Override
	public String process(Entity entity) {
		Trade trade = (Trade) entity;
		TradeDAO tradeDAO = new TradeDAO();
		
		List<Entity> listEntities = tradeDAO.consult(trade, "consult");
		if (listEntities.size() == 0) {
			return "Troca inválida";
		}
		
		return null;
	}

}
