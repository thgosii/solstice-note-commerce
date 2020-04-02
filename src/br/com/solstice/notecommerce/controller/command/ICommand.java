package br.com.solstice.notecommerce.controller.command;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.Result;

public interface ICommand {
	
	public Result execute(DomainEntity entity, String operation);

}
