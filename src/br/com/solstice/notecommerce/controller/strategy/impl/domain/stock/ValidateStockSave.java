package br.com.solstice.notecommerce.controller.strategy.impl.domain.stock;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.stock.Stock;

public class ValidateStockSave implements IStrategy {

	@Override
	public String process(Entity entity) {
		Stock stock = (Stock) entity;
		StringBuilder sb = new StringBuilder();
		
		if (stock.getProduct() == null || stock.getProduct().getId() == null) {
			sb.append("É necessário especificar o produto relacionado ao estoque\n");
		}
		if (stock.getQuantity() == null) {
			sb.append("É necessário especificar a quantidade do produto no estoque\n");
		} else if (stock.getQuantity() < 0) {
			sb.append("A quantidade do produto no estoque é inválida\n");
		}
		
		return sb.toString().trim().isEmpty() ? null : sb.toString().trim();
	}

}
