package br.com.solstice.notecommerce.controller.strategy.impl.domain.trade;

import java.util.Arrays;

import br.com.solstice.notecommerce.controller.strategy.AbstractStrategy;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.trade.Trade;

public class ValidateTradeSaleStatus extends AbstractStrategy {
	
	public ValidateTradeSaleStatus() { 
		super(Arrays.asList(ValidateTradeSave.class.getName(), ValidateTradeToSaveAlreadyExists.class.getName()));
	}
	
	public ValidateTradeSaleStatus(String... requiredBussinessRules) { 
		super(Arrays.asList(requiredBussinessRules));
	}

	@Override
	public String process(Entity entity) {
		// TODO: Use SaleDAO to verify if Sale is delivered (status)
		Trade trade = (Trade) entity;
		
		
		return null;
	}

}
