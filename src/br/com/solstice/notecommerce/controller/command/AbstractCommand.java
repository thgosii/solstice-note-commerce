package br.com.solstice.notecommerce.controller.command;

import br.com.solstice.notecommerce.controller.facade.IFacade;
import br.com.solstice.notecommerce.controller.facade.impl.Facade;

public abstract class AbstractCommand implements ICommand {

	protected IFacade facade = new Facade();
	
}
