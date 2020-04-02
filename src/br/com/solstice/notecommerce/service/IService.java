package br.com.solstice.notecommerce.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import br.com.solstice.notecommerce.entity.Entity;

public interface IService {

	public void save(Entity entity, HttpServletRequest request);

	public void remove(Entity entity, HttpServletRequest request);

	public void update(Entity entity, HttpServletRequest request);

	public List<Entity> consult(Entity entity, HttpServletRequest request);

}
