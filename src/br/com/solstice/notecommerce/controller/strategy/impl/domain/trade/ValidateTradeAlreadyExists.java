package br.com.solstice.notecommerce.controller.strategy.impl.domain.trade;

import java.util.Arrays;
import java.util.List;

import br.com.solstice.notecommerce.controller.strategy.AbstractStrategy;
import br.com.solstice.notecommerce.dao.impl.domain.trade.TradeDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.trade.Trade;

public class ValidateTradeAlreadyExists extends AbstractStrategy {
	
	public ValidateTradeAlreadyExists() { 
		super(Arrays.asList(ValidateTradeSave.class.getName()));
	}
	
	@Override
	public String process(Entity entity) {
		Trade trade = (Trade) entity;
		TradeDAO tradeDAO = new TradeDAO();
		
		List<Entity> listEntities = tradeDAO.consult(trade, "findFromSaleAndProduct");
		if (listEntities.size() != 0) {
			return "Esse produto já faz parte de uma venda";
		}
		
		return null;
	}

}
