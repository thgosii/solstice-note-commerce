package br.com.solstice.notecommerce.controller.strategy.impl.domain.sale;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;
import br.com.solstice.notecommerce.entity.domain.user.customer.credit_card.CreditCard;

public class ValidateSaleCreditCardData implements IStrategy {

	@Override
	public String process(Entity entity) {
		Sale sale = (Sale) entity;

		CreditCard creditCard = sale.getCreditCard();

		if (creditCard.getId() == null) {
			if (null == creditCard.getNumber() || creditCard.getNumber().trim().isEmpty()) {
				return "Preencha todos os campos obrigatórios do cartão de crédito";
			}
			if (null == creditCard.getSecurityCode() || creditCard.getSecurityCode().trim().isEmpty()) {
				return "Preencha todos os campos obrigatórios do cartão de crédito";
			}
			if (null == creditCard.getPrintedName() || creditCard.getPrintedName().trim().isEmpty()) {
				return "Preencha todos os campos obrigatórios do cartão de crédito";
			}
		}

		return null;
	}

}
