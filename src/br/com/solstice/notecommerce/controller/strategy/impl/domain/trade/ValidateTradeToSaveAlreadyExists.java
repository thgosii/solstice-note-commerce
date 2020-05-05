package br.com.solstice.notecommerce.controller.strategy.impl.domain.trade;

import java.util.Arrays;
import java.util.List;

import com.sun.org.apache.bcel.internal.generic.I2F;

import br.com.solstice.notecommerce.controller.strategy.AbstractStrategy;
import br.com.solstice.notecommerce.dao.impl.domain.trade.TradeDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.trade.Trade;
import br.com.solstice.notecommerce.entity.domain.trade.TradeStatus;
import br.com.solstice.notecommerce.entity.domain.trade.TradeType;

public class ValidateTradeToSaveAlreadyExists extends AbstractStrategy {
	
	public ValidateTradeToSaveAlreadyExists() { 
		super(Arrays.asList(ValidateTradeSave.class.getName()));
	}
	
	public ValidateTradeToSaveAlreadyExists(String... requiredBussinessRules) { 
		super(Arrays.asList(requiredBussinessRules));
	}
	
	@Override
	public String process(Entity entity) {
		Trade trade = (Trade) entity;
		TradeType originalTradeType = trade.getType();
		System.out.println("\noriginal: " + originalTradeType);
		TradeDAO tradeDAO = new TradeDAO();
		
		// Find if there is any type of trade with this sale item already in progress
		
		trade.setType(TradeType.DEVOLUTION);
		System.out.println("type: " + ((Trade) entity).getType());
		List<Entity> listEntities = tradeDAO.consult(trade, "findFromSaleAndProduct");
		if (listEntities.size() != 0) {
			if (((Trade) listEntities.get(0)).getStatus() != TradeStatus.DENIED) {
				return "Esse produto já faz parte de uma devolução em andamento ou que já atualizou o seu saldo";
			}
		}
		
		trade.setType(TradeType.EXCHANGE);
		listEntities = tradeDAO.consult(trade, "findFromSaleAndProduct");
		if (listEntities.size() != 0) {
			if (((Trade) listEntities.get(0)).getStatus() != TradeStatus.DENIED && ((Trade) listEntities.get(0)).getStatus() != TradeStatus.REPLACEMENT_DELIVERED) {
				return "Esse produto já faz parte de uma troca em andamento";
			}
		}
		
		trade.setType(originalTradeType);
		System.out.println("after" + ((Trade) entity).getType());
		return null;
	}

}
