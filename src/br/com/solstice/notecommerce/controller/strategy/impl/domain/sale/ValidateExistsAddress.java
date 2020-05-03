package br.com.solstice.notecommerce.controller.strategy.impl.domain.sale;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.dao.impl.domain.user.customer.AddressDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;

public class ValidateExistsAddress implements IStrategy {

	@Override
	public String process(Entity entity) {
		Sale sale = (Sale) entity;

		if (sale.getAddress().getId() != null) {
			if (new AddressDAO().consult(sale.getAddress(), "consult").isEmpty()) {
				return "Endereço não encontrado";
			}
		}

		return null;
	}

}
