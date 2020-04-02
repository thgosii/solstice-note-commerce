package br.com.solstice.notecommerce.controller.strategy.impl.domain.product;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.product.Product;

public class ValidateProductUpdate implements IStrategy {

	@Override
	public String process(DomainEntity entity) {
		Product product = (Product) entity;
		StringBuilder sb = new StringBuilder();
		
		if (null == product.getTitle() || product.getTitle().trim().isEmpty()) {
			sb.append("title: O título é obrigatório\n");
		}
		if (-1d == product.getPrice()) {
			sb.append("price: O preço é obrigatório\n");
		}
		if (null == product.getProcessor() || product.getProcessor().trim().isEmpty()) {
			sb.append("processor: O processador é obrigatório\n");
		}
		if (null == product.getGraphicsCard() || product.getGraphicsCard().trim().isEmpty()) {
			sb.append("graphics_card: A placa de vídeo é obrigatória\n");
		}
		if (-1 == product.getRam()) {
			sb.append("ram: A quantidade de RAM é obrigatória\n");
		}
		if (null == product.getMonitor() || product.getMonitor().trim().isEmpty()) {
			sb.append("monitor: O tamanho do monitor é obrigatório\n");
		}
		if (null == product.getOs() || product.getOs().trim().isEmpty()) {
			sb.append("os: O sistema operacional é obrigatório\n");
		}
		
		return sb.toString();
	}

}
