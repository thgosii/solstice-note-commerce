package br.com.solstice.notecommerce.controller.strategy.impl.domain.sale;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;

public class ValidateBalance implements IStrategy {

	@Override
	public String process(Entity entity) {
		Sale sale = (Sale) entity;
		
		if (sale.getBalanceUsage() > sale.getCustomer().getBalance()) {
			return "Você não possui saldo digital suficiente";
		}
		
		return null;
	}

}
