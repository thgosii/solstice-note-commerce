package br.com.solstice.notecommerce.controller.strategy.impl.customer;

import java.time.LocalDate;
import java.time.LocalDateTime;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.user.customer.Customer;

public class ValidateDateOfBirth implements IStrategy {

	@Override
	public String process(DomainEntity entity) {
		Customer customer = (Customer) entity;
		
		LocalDateTime now = LocalDate.now().atStartOfDay();

		if (!customer.getDateOfBirth().atStartOfDay().isBefore(now)) {
			return "Data de nascimento inválida";
		}
		
		return null;
	}

}
