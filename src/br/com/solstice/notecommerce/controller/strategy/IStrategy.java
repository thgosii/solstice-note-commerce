package br.com.solstice.notecommerce.controller.strategy;

import br.com.solstice.notecommerce.entity.Entity;

public interface IStrategy {

	public String process(Entity entity);
	
}
