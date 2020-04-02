package br.com.solstice.notecommerce.controller.strategy.impl.domain.customer;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;

public class ValidateCustomerDataUpdate implements IStrategy {

	@Override
	public String process(Entity entity) {
		Customer customer = (Customer) entity;

		if (null == customer.getName() || customer.getName().trim().isEmpty()) {
			return "Preencha todos os campos obrigatórios";
		}
		if (null == customer.getDateOfBirth() || customer.getDateOfBirth().toString().trim().isEmpty()) {
			return "Preencha todos os campos obrigatórios";
		}
		if (null == customer.getPhone() || customer.getPhone().trim().isEmpty()) {
			return "Preencha todos os campos obrigatórios";
		}
		if (null == customer.getUser().getPassword() || customer.getUser().getPassword().trim().isEmpty()) {
			return "Preencha todos os campos obrigatórios";
		}
		if (null == customer.getUser().getConfirmPassword() || customer.getUser().getConfirmPassword().trim().isEmpty()) {
			return "Preencha todos os campos obrigatórios";
		}
		if (null == customer.getGender() || customer.getGender().toString().trim().isEmpty()) {
			return "Preencha todos os campos obrigatórios";
		}

		return null;
	}

}