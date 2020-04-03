package br.com.solstice.notecommerce.controller.facade;

import javax.servlet.http.HttpSession;

import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;

public interface IFacade {

	public Result save(Entity entity, HttpSession session);

	public Result remove(Entity entity, HttpSession session);

	public Result update(Entity entity, HttpSession session);

	public Result consult(Entity entity, HttpSession session, String operation);

}
