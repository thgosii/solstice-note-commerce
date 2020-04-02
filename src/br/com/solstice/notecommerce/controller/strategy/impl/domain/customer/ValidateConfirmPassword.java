package br.com.solstice.notecommerce.controller.strategy.impl.domain.customer;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;

public class ValidateConfirmPassword implements IStrategy {

	@Override
	public String process(Entity entity) {
		Customer customer = (Customer) entity;

		if (null != customer.getUser().getPassword() && !customer.getUser().getPassword().trim().isEmpty()
				&& null != customer.getUser().getConfirmPassword() && !customer.getUser().getConfirmPassword().trim().isEmpty()) {
			if (!customer.getUser().getPassword().trim().equals(customer.getUser().getConfirmPassword().trim())) {
				return "As senhas não se coincidem";
			}
		}

		return null;
	}

}
