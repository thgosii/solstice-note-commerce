package br.com.solstice.notecommerce.controller.strategy.impl.domain.stock;

import java.time.LocalDateTime;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.stock.StockUpdate;

public class ValidateStockUpdateSave implements IStrategy {

	@Override
	public String process(Entity entity) {
		StockUpdate stockUpdate = (StockUpdate) entity;
		StringBuilder sb = new StringBuilder();
		
		if (stockUpdate.getStock() == null || stockUpdate.getStock().getProduct() == null || stockUpdate.getStock().getProduct().getId() == null) {
			sb.append("É necessário especificar o produto o qual será dado alta/baixa no estoque\n");
		}
		if (stockUpdate.getQuantity() == null) {
			sb.append("É necessário especificar a quantidade de alta/baixa do estoque\n");
		} else if (stockUpdate.getQuantity() < 0) {
			sb.append("A quantidade do produto no estoque é inválida\n");
		}
		if (stockUpdate.getDate() == null) {
			sb.append("É necessário especificar a data e hora da alta/baixa no estoque");
		} else if (stockUpdate.getDate().isAfter(LocalDateTime.now())) {
			sb.append("Não é possível especificar uma data e hora de alta/baixa no estoque no futuro");
		}
		
		return sb.toString().trim().isEmpty() ? null : sb.toString().trim();
	}

}
