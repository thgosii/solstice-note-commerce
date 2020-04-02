package br.com.solstice.notecommerce.controller.facade;

import javax.servlet.http.HttpServletRequest;

import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;

public interface IFacade {

	public Result save(Entity entity, HttpServletRequest request);

	public Result remove(Entity entity, HttpServletRequest request);

	public Result update(Entity entity, HttpServletRequest request);

	public Result consult(Entity entity, HttpServletRequest request);

}
