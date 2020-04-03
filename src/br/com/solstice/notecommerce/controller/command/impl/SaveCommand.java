package br.com.solstice.notecommerce.controller.command.impl;

import javax.servlet.http.HttpSession;

import br.com.solstice.notecommerce.controller.command.AbstractCommand;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;

public class SaveCommand extends AbstractCommand {

	@Override
	public Result execute(Entity entity, HttpSession session, String operation) {
		return facade.save(entity, session);
	}

}
