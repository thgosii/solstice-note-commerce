package br.com.solstice.notecommerce.controller.strategy.impl.domain.sale;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.dao.impl.domain.user.customer.CreditCardDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;

public class ValidateExistsCreditCard implements IStrategy {

	@Override
	public String process(Entity entity) {
		Sale sale = (Sale) entity;

		if (new CreditCardDAO().consult(sale.getCreditCard(), "consult").isEmpty()) {
			return "Cartão de crédito não encontrado";
		}

		return null;
	}

}
