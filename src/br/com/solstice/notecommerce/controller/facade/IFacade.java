package br.com.solstice.notecommerce.controller.facade;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.Result;

public interface IFacade {
	
	public Result save(DomainEntity entity);
	public Result remove(DomainEntity entity);
	public Result update(DomainEntity entity);
	public Result consult(DomainEntity entity, String operation);

}
