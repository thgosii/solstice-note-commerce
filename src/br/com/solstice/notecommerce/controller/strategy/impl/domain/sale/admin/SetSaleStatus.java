package br.com.solstice.notecommerce.controller.strategy.impl.domain.sale.admin;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.dao.impl.domain.sale.SaleDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleStatus;

public class SetSaleStatus implements IStrategy {

	@Override
	public String process(Entity entity) {
		Sale sale = (Sale) entity;

		sale = (Sale) new SaleDAO().consult(sale, "findById").get(0);

		SaleStatus previousStatus = sale.getStatus();

		switch (previousStatus) {
			case PAYMENT_APPROVED:
				((Sale) entity).setStatus(SaleStatus.ON_DELIVERY);
				return null;
			case ON_DELIVERY:
				((Sale) entity).setStatus(SaleStatus.DELIVERED);
				return null;
			default:
				((Sale) entity).setStatus(previousStatus);
				return null;
		}
	}

}
