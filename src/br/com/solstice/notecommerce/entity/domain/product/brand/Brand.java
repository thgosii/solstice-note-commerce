package br.com.solstice.notecommerce.entity.domain.product.brand;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;

public class Brand extends DomainEntity {
	
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Brand [getId()=" + getId() + ", name=" + name + "]";
	}

}
