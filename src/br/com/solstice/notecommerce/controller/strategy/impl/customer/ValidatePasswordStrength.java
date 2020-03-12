package br.com.solstice.notecommerce.controller.strategy.impl.customer;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.user.customer.Customer;

public class ValidatePasswordStrength implements IStrategy {

	@Override
	public String process(DomainEntity entity) {
		String passwordRegex = "(?=^.{8,}$)((?=.*\\d)|(?=.*\\W+))(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$";
		Customer customer = (Customer) entity;

		String password = customer.getUser().getPassword();

		if (null == password || password.trim().isEmpty()) {
			return "A senha não está dentro dos requisitos";
		}

		if (!password.matches(passwordRegex)) {
			return "A senha não está dentro dos requisitos";
		}

		return null;
	}

}
