package br.com.solstice.notecommerce.controller.strategy.impl.product;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.product.Product;

public class ValidateStorage implements IStrategy {

	@Override
	public String process(DomainEntity entity) {
		double hd = ((Product) entity).getHd();
		double ssd = ((Product) entity).getSsd();
		StringBuilder sb = new StringBuilder();
		
		if (hd == -1 && ssd == -1) {
			sb.append("hd: É necessário possuir pelo menos HD ou SSD\n");
		} else {
			if (hd < 0 || hd > 5000) {
				sb.append("hd-capacity: Quantidade inválida\n");
			}
			if (ssd < 0 || ssd > 5000) {
				sb.append("ssd-capacity: Quantidade inválida\n");
			}
		}
			
		return sb.toString();
	}

}
