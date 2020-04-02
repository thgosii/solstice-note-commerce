package br.com.solstice.notecommerce.controller.facade;

import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.Result;

public interface IFacade {
	
	public Result save(Entity entity);
	public Result remove(Entity entity);
	public Result update(Entity entity);
	public Result consult(Entity entity, String operation);

}
