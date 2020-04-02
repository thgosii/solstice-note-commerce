package br.com.solstice.notecommerce.entity;

import java.util.ArrayList;
import java.util.List;

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
