package br.com.solstice.notecommerce.controller.strategy.impl.domain.sale;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;

public class ValidatePayment implements IStrategy {

	@Override
	public String process(Entity entity) {
		Sale sale = (Sale) entity;
		
		if (sale.getCreditCard() == null || sale.getBalanceUsage() < 0.0) {
			return "Selecione um meio de pagamento válido";
		} else if (sale.getBalanceUsage() >= sale.getTotal()) {
			return "O valor em saldo digital deve ser menor que o total";
		}
		
		return null;
	}

}
