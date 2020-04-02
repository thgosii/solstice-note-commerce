package br.com.solstice.notecommerce.entity.domain.shop.cart;

import java.util.List;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;

public class Cart extends DomainEntity {

	private List<CartItem> items;

	public List<CartItem> getItems() {
		return items;
	}

	public void setItems(List<CartItem> items) {
		this.items = items;
	}

	public void addItem(CartItem item) {
		items.add(item);
	}

	public void removeItem(CartItem item) {
		items.remove(item);
	}

}
