package br.com.solstice.notecommerce.controller.command.impl;

import br.com.solstice.notecommerce.controller.command.AbstractCommand;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.Result;

public class ConsultCommand extends AbstractCommand {

	@Override
	public Result execute(Entity entity, String operation) {
		return facade.consult(entity, operation);
	}

}
