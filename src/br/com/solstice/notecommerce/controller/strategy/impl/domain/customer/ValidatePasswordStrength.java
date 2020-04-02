package br.com.solstice.notecommerce.controller.strategy.impl.domain.customer;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;

public class ValidatePasswordStrength implements IStrategy {

	@Override
	public String process(Entity entity) {
		String passwordRegex = "(?=^.{8,}$)((?=.*\\d)|(?=.*\\W+))(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$";
		Customer customer = (Customer) entity;

		String password = customer.getUser().getPassword();

		if (null != password && !password.trim().isEmpty()) {
			if (!password.matches(passwordRegex)) {
				return "A senha não está dentro dos requisitos";
			}
		}

		return null;
	}

}
