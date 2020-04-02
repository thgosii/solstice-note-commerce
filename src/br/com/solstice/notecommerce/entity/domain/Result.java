package br.com.solstice.notecommerce.entity.domain;

import java.util.ArrayList;
import java.util.List;

public class Result {

	private List<DomainEntity> entities;
	private String message;
	
	public Result() {
		entities = new ArrayList<DomainEntity>();
	}

	public List<DomainEntity> getEntities() {
		return entities;
	}

	public void setEntities(List<DomainEntity> entities) {
		this.entities = entities;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
