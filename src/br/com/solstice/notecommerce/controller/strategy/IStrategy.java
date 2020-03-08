package br.com.solstice.notecommerce.controller.strategy;

import br.com.solstice.notecommerce.domain.DomainEntity;

public interface IStrategy {

	public String process(DomainEntity entity);
	
}
