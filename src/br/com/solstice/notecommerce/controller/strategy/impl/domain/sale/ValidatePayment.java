package br.com.solstice.notecommerce.controller.strategy.impl.domain.sale;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleCreditCard;

public class ValidatePayment implements IStrategy {

	@Override
	public String process(Entity entity) {
		Sale sale = (Sale) entity;

		double creditCardUsage = 0;
		
		for (SaleCreditCard saleCreditCard : sale.getCreditCards()) {
			creditCardUsage += saleCreditCard.getValue();
		}
		
		if (sale.getCreditCards().get(0).getCreditCard().getId() != null) {
			for (SaleCreditCard saleCreditCard : sale.getCreditCards()) {
				if (saleCreditCard.getValue() < 10.0 && sale.getBalanceUsage() < 0.02) {
					return "Todos os cartões devem possuir pelo menos 10 reais";
				}
			}
		} else if (sale.getBalanceUsage() < 0.0) {
			return "Selecione um meio de pagamento válido";
		} else if (sale.getBalanceUsage() >= sale.getTotal()) {
			return "O valor em saldo digital deve ser menor que o total";
		} else if (sale.getTotal() - creditCardUsage + sale.getBalanceUsage() > 0.01) {
			System.out.println("OKASOPDAKSPDKPSADASPO " + (sale.getTotal() - creditCardUsage + sale.getBalanceUsage()));
			return "Valores de pagamento menores que o total da compra";
		}

		return null;
	}

}
