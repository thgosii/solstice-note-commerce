package br.com.solstice.notecommerce.controller.command;

import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.Result;

public interface ICommand {
	
	public Result execute(DomainEntity entity, String operation);

}
