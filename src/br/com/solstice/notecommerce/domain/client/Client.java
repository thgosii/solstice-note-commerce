package br.com.solstice.notecommerce.domain.client;

import br.com.solstice.notecommerce.domain.DomainEntity;

public class Client extends DomainEntity {

	private String name;
	private String description;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}