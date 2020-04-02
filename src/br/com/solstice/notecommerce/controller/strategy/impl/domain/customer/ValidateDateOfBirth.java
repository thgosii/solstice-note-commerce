package br.com.solstice.notecommerce.controller.strategy.impl.domain.customer;

import java.time.LocalDate;
import java.time.LocalDateTime;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;

public class ValidateDateOfBirth implements IStrategy {

	@Override
	public String process(Entity entity) {
		Customer customer = (Customer) entity;

		LocalDateTime now = LocalDate.now().atStartOfDay();
		
		if (customer.getDateOfBirth() == null) {
			return "Data de nascimento inválida";
		}

		if (!customer.getDateOfBirth().atStartOfDay().isBefore(now)) {
			return "Data de nascimento inválida";
		}

		return null;
	}

}
