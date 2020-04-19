package br.com.solstice.notecommerce.controller.strategy.impl.domain.trade;

import java.util.Arrays;

import br.com.solstice.notecommerce.controller.strategy.AbstractStrategy;
import br.com.solstice.notecommerce.dao.impl.domain.user.customer.CustomerDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.trade.Trade;
import br.com.solstice.notecommerce.entity.domain.trade.TradeStatus;

public class ValidateTradeUpdateCustomerBalance extends AbstractStrategy {

	public ValidateTradeUpdateCustomerBalance() {
		super(Arrays.asList(ValidateTradeStatusUpdate.class.getName()));
	}

	@Override
	public String process(Entity entity) {
		// TODO Update customer balance if trade exists and is going to be finished
		Trade trade = (Trade) entity; // This should be the trade with modified status by ValidateTradeStatusUpdate 
		
		if (trade.getStatus() == TradeStatus.PRODUCT_RECEIVED) { // If update will finish the trade
			// Update balance
			// TODO: Use CostumerDAO
		}
		
		return null;
	}

}
