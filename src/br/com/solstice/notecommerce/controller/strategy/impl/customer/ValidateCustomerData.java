package br.com.solstice.notecommerce.controller.strategy.impl.customer;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.customer.Customer;

public class ValidateCustomerData implements IStrategy {

	@Override
	public String process(DomainEntity entity) {
		Customer client = (Customer) entity;
		
		if (client.getName().trim().isEmpty() || client.getName() == null) {
			return "Preencha os campos obrigatórios";
		}
		
		return null;
	}

}
