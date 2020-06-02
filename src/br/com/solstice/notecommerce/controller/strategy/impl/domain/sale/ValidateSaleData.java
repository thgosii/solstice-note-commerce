package br.com.solstice.notecommerce.controller.strategy.impl.domain.sale;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;

public class ValidateSaleData implements IStrategy {

	@Override
	public String process(Entity entity) {
		Sale sale = (Sale) entity;

		if (sale.getAddress() == null) {
			return "Preencha os dados da venda corretamente";
		} else if (sale.getItems() == null) {
			return "Preencha os dados da venda corretamente";
		} else if (sale.getCreditCards() == null ) {
			return "Preencha os dados da venda corretamente";
		}

		return null;
	}

}
