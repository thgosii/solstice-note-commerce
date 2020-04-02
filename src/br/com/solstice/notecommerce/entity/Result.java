package br.com.solstice.notecommerce.entity.domain;

import java.util.ArrayList;
import java.util.List;

import br.com.solstice.notecommerce.entity.Entity;

public class Result {

	private List<Entity> entities;
	private String message;
	
	public Result() {
		entities = new ArrayList<Entity>();
	}

	public List<Entity> getEntities() {
		return entities;
	}

	public void setEntities(List<Entity> entities) {
		this.entities = entities;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
