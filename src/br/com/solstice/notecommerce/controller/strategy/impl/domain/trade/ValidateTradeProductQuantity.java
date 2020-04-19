package br.com.solstice.notecommerce.controller.strategy.impl.domain.trade;

import java.util.Arrays;

import br.com.solstice.notecommerce.controller.strategy.AbstractStrategy;
import br.com.solstice.notecommerce.dao.impl.domain.trade.TradeDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleItem;
import br.com.solstice.notecommerce.entity.domain.trade.Trade;

public class ValidateTradeProductQuantity extends AbstractStrategy {
	
	public ValidateTradeProductQuantity() { 
		super(Arrays.asList(ValidateTradeSave.class.getName()));
	}
	
	public ValidateTradeProductQuantity(String... requiredBussinessRules) { 
		super(Arrays.asList(requiredBussinessRules));
	}

	@Override
	public String process(Entity entity) {
		Trade trade = (Trade) entity;
		
		if (trade.getProductQuantity() < 1) {
			return "É necessário pelo menos uma unidade do produto comprado para a troca";
		}
		
		TradeDAO tradeDAO = new TradeDAO();
		
		SaleItem saleItem = ((Trade) tradeDAO.consult(trade, "findSaleItem").get(0)).getSaleItem();
		
		if (saleItem.getQuantity() < trade.getProductQuantity()) {
			return "Não é possível trocar mais unidades do que as que foram compradas";
		}
		
		return null;
	}

}
