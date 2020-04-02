package br.com.solstice.notecommerce.controller.command.impl;

import javax.servlet.http.HttpServletRequest;

import br.com.solstice.notecommerce.controller.command.AbstractCommand;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;

public class SaveCommand extends AbstractCommand {

	@Override
	public Result execute(Entity entity, HttpServletRequest request) {
		return facade.save(entity, request);
	}

}
