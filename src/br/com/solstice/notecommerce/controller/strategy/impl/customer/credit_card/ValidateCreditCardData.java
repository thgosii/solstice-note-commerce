package br.com.solstice.notecommerce.controller.strategy.impl.customer.credit_card;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.user.customer.credit_card.CreditCard;

public class ValidateCreditCardData implements IStrategy {

	@Override
	public String process(DomainEntity entity) {
		CreditCard creditCard = (CreditCard) entity;

		if (null == creditCard.getNumber() || creditCard.getNumber().trim().isEmpty()) {
			return "Preencha todos os campos obrigatórios";
		}
		if (null == creditCard.getSecurityCode() || creditCard.getSecurityCode().trim().isEmpty()) {
			return "Preencha todos os campos obrigatórios";
		}
		if (null == creditCard.getPrintedName() || creditCard.getPrintedName().trim().isEmpty()) {
			return "Preencha todos os campos obrigatórios";
		}

		return null;
	}

}
