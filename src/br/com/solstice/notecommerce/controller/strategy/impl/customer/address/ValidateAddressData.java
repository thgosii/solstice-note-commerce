package br.com.solstice.notecommerce.controller.strategy.impl.customer.address;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.user.customer.address.Address;

public class ValidateAddressData implements IStrategy {

	@Override
	public String process(DomainEntity entity) {
		Address address = (Address) entity;

		if (null == address.getCep() || address.getCep().trim().isEmpty()) {
			return "Preencha todos os campos obrigatórios";
		}
		if (null == address.getPublicPlace() || address.getPublicPlace().toString().trim().isEmpty()) {
			return "Preencha todos os campos obrigatórios";
		}
		if (null == address.getNumber() || address.getNumber().trim().isEmpty()) {
			return "Preencha todos os campos obrigatórios";
		}
		if (null == address.getNeighbourhood() || address.getNeighbourhood().trim().isEmpty()) {
			return "Preencha todos os campos obrigatórios";
		}
		if (null == address.getType() || address.getType().toString().isEmpty()) {
			return "Preencha todos os campos obrigatórios";
		}
		if (null == address.getCity() || address.getCity().trim().isEmpty()) {
			return "Preencha todos os campos obrigatórios";
		}
		if (null == address.getState() || address.getState().trim().isEmpty()) {
			return "Preencha todos os campos obrigatórios";
		}

		return null;
	}

}
