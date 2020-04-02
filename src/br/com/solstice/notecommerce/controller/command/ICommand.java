package br.com.solstice.notecommerce.controller.command;

import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.Result;

public interface ICommand {
	
	public Result execute(Entity entity, String operation);

}
