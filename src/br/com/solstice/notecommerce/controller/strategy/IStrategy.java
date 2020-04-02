package br.com.solstice.notecommerce.controller.strategy;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;

public interface IStrategy {

	public String process(DomainEntity entity);
	
}
