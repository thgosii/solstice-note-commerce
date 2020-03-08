package br.com.solstice.notecommerce.controller.strategy.impl.client;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.client.Client;

public class ValidateClientData implements IStrategy {

	@Override
	public String process(DomainEntity entity) {
		Client client = (Client) entity;
		
		if (client.getName().trim().isEmpty() || client.getName() == null) {
			return "Preencha os campos obrigatórios";
		}
		
		return null;
	}

}
