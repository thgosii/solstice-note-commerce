package br.com.solstice.notecommerce.controller.session;

import java.util.List;

import javax.servlet.http.HttpSession;

import br.com.solstice.notecommerce.entity.Entity;

public interface ISessionHelper {

	public void save(Entity entity, HttpSession session);

	public void remove(Entity entity, HttpSession session);

	public void update(Entity entity, HttpSession session);

	public List<Entity> consult(Entity entity, HttpSession session, String operation);

}
