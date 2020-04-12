package br.com.solstice.notecommerce.controller.strategy.impl.domain.trade;

import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.entity.Entity;

public class ValidateTradeActionWithStatus implements IStrategy {

	@Override
	public String process(Entity entity) {
		// TODO: Validate if trade action can be taken based on current trade status (example: authorizing already authorized trade, finishing already finished/not authorized, etc)
		return null;
	}

}
