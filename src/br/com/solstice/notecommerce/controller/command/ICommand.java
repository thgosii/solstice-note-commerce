package br.com.solstice.notecommerce.controller.command;

import javax.servlet.http.HttpServletRequest;

import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;

public interface ICommand {
	
	public Result execute(Entity entity, HttpServletRequest request);

}
