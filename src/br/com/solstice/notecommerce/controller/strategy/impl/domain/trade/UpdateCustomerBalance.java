package br.com.solstice.notecommerce.controller.strategy.impl.domain.trade;

import java.util.Arrays;

import br.com.solstice.notecommerce.controller.strategy.AbstractStrategy;
import br.com.solstice.notecommerce.dao.impl.domain.sale.SaleDAO;
import br.com.solstice.notecommerce.dao.impl.domain.trade.TradeDAO;
import br.com.solstice.notecommerce.dao.impl.domain.user.customer.CustomerDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleItem;
import br.com.solstice.notecommerce.entity.domain.trade.Trade;
import br.com.solstice.notecommerce.entity.domain.trade.TradeStatus;
import br.com.solstice.notecommerce.entity.domain.trade.TradeType;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;

public class UpdateCustomerBalance extends AbstractStrategy {

	public UpdateCustomerBalance() {
		super(Arrays.asList(SetTradeStatus.class.getName()));
	}

	@Override
	public String process(Entity entity) {
		// TODO Update customer balance if trade exists and is going to be finished
		Trade trade = (Trade) entity; // This should be the trade with modified status by ValidateTradeStatusUpdate 
		TradeDAO tradeDAO = new TradeDAO();
		
		
		if (trade.getType() == TradeType.EXCHANGE) {
			if (trade.getStatus() == TradeStatus.REPLACEMENT_ON_DELIVERY) { // Replacement product will be sent back
				// Get SaleItem to get product id to check stock
				Trade previousTrade = (Trade) tradeDAO.consult(trade, "consult").get(0);
				SaleItem saleItem = ((Trade) tradeDAO.consult(previousTrade, "findSaleItem")).getSaleItem();
				// TODO: Check stock to see if there is products to be delivered back
				
			}
		} else if (trade.getType() == TradeType.DEVOLUTION) {
			if (trade.getStatus() == TradeStatus.PRODUCT_RECEIVED) { // Devolution about to finish
				// Get SaleItem to get subtotal to update customer balance
				Trade previousTrade = (Trade) tradeDAO.consult(trade, "consult").get(0);
				SaleItem saleItem = ((Trade) tradeDAO.consult(previousTrade, "findSaleItem").get(0)).getSaleItem();
				
				// Find customer through trade sale id
				SaleDAO saleDAO = new SaleDAO();
				Sale sale = new Sale();
				sale.setId(previousTrade.getSale().getId());
				Customer customer = ((Sale) saleDAO.consult(sale, "findById").get(0)).getCustomer();
			
				// Update balance
				previousTrade.setSaleItem(saleItem);
				customer.setBalance(customer.getBalance() + previousTrade.getBalanceReturn());
				
				CustomerDAO customerDAO = new CustomerDAO();
				
				customerDAO.update(customer);
			}
		}
		
		return null;
	}

}
