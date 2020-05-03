package br.com.solstice.notecommerce.controller.strategy.impl.domain.trade;

import java.util.Arrays;
import java.util.List;

import br.com.solstice.notecommerce.controller.strategy.AbstractStrategy;
import br.com.solstice.notecommerce.dao.impl.domain.sale.SaleDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleStatus;
import br.com.solstice.notecommerce.entity.domain.trade.Trade;

public class SetSaleStatus extends AbstractStrategy {
	
	public SetSaleStatus() { 
		super(Arrays.asList(ValidateTradeSave.class.getName(), ValidateTradeToSaveAlreadyExists.class.getName()));
	}
	
	public SetSaleStatus(String... requiredBussinessRules) { 
		super(Arrays.asList(requiredBussinessRules));
	}

	@Override
	public String process(Entity entity) {
		// TODO: Use SaleDAO to verify if Sale is delivered (status)
		Trade trade = (Trade) entity;
		
//		CustomerDAO customerDAO = new CustomerDAO();
//		Customer customer = (Customer) customerDAO.consult(((Trade) entity).getSale().getCustomer(), "consult").get(0); 
		
		SaleDAO saleDAO = new SaleDAO();
		List<Entity> entityList = saleDAO.consult(((Trade) entity).getSale(), "findById");
		if (entityList.size() == 0) {
			return "A compra relacionada a esse produto é inválida";
		}
		
		SaleStatus saleStatus = ((Sale) entityList.get(0)).getStatus();
		if (saleStatus != SaleStatus.DELIVERED) {
			return "Você não pode iniciar uma troca ou devolução de um produto que ainda não chegou";
		}
		
		return null;
	}

}
