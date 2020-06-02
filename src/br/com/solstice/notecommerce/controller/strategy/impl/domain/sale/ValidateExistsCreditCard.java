package br.com.solstice.notecommerce.controller.strategy.impl.domain.sale;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.dao.impl.domain.user.customer.CreditCardDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleCreditCard;

public class ValidateExistsCreditCard implements IStrategy {

	@Override
	public String process(Entity entity) {
		Sale sale = (Sale) entity;

		if (sale.getCreditCards().get(0).getCreditCard().getId() != null) {
			for (SaleCreditCard saleCreditCard : sale.getCreditCards()) {
				if (saleCreditCard.getCreditCard().getId() != null) {
					if (new CreditCardDAO().consult(saleCreditCard.getCreditCard(), "findById").isEmpty()) {
						return "Erro ao encontrar um dos cartões de crédito";
					}
				}
			}
		}

		return null;
	}

}
