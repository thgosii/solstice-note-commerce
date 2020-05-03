package br.com.solstice.notecommerce.controller.strategy.impl.domain.sale;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;
import br.com.solstice.notecommerce.entity.domain.user.customer.address.Address;

public class ValidateSaleAddressData implements IStrategy {

	@Override
	public String process(Entity entity) {
		Sale sale = (Sale) entity;

		Address address = sale.getAddress();

		if (address.getId() == null) {
			if (null == address.getCep() || address.getCep().trim().isEmpty()) {
				return "Preencha todos os campos obrigatórios do endereço";
			}
			if (null == address.getPublicPlace() || address.getPublicPlace().toString().trim().isEmpty()) {
				return "Preencha todos os campos obrigatórios do endereço";
			}
			if (null == address.getNumber() || address.getNumber().trim().isEmpty()) {
				return "Preencha todos os campos obrigatórios do endereço";
			}
			if (null == address.getNeighbourhood() || address.getNeighbourhood().trim().isEmpty()) {
				return "Preencha todos os campos obrigatórios do endereço";
			}
			if (null == address.getType() || address.getType().toString().isEmpty()) {
				return "Preencha todos os campos obrigatórios do endereço";
			}
			if (null == address.getCity() || address.getCity().trim().isEmpty()) {
				return "Preencha todos os campos obrigatórios do endereço";
			}
			if (null == address.getState() || address.getState().trim().isEmpty()) {
				return "Preencha todos os campos obrigatórios do endereço";
			}
		}

		return null;
	}

}
