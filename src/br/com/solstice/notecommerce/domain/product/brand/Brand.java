package br.com.solstice.notecommerce.domain.product.brand;

import br.com.solstice.notecommerce.domain.DomainEntity;

public class Brand extends DomainEntity {
	
	private String name;
	
	public Brand(long id) {
		this.setId(id);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
