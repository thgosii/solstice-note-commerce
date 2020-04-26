package br.com.solstice.notecommerce.dao;

import java.util.List;

import br.com.solstice.notecommerce.entity.Entity;

public interface IDAO {

	public long save(Entity entity);

	public void remove(Entity entity);

	public void update(Entity entity);

	public List<Entity> consult(Entity entity, String operation);

}
