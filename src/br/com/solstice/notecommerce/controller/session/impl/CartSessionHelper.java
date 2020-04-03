package br.com.solstice.notecommerce.controller.session.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import br.com.solstice.notecommerce.controller.session.ISessionHelper;
import br.com.solstice.notecommerce.entity.Entity;

public class CartSessionHelper implements ISessionHelper {

	@Override
	public void save(Entity entity, HttpSession session) {
		
	}

	@Override
	public void remove(Entity entity, HttpSession session) {
		
	}

	@Override
	public void update(Entity entity, HttpSession session) {
		
	}

	@Override
	public List<Entity> consult(Entity entity, HttpSession session, String operation) {
		return null;
	}

}
