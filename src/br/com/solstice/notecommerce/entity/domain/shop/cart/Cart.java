package br.com.solstice.notecommerce.entity.domain.shop.cart;

import java.util.ArrayList;
import java.util.List;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString(callSuper = true)
public class Cart extends DomainEntity {

	private List<CartItem> items;

	public Cart() {
		items = new ArrayList<CartItem>();
	}

	public void addItem(CartItem item) {
		items.add(item);
	}

	public void removeItem(CartItem item) {
		for (int i = 0; i < items.size(); i++) {
			if (item.getProduct().getId() == items.get(i).getProduct().getId()) {
				items.remove(i);
				break;
			}
		}
	}

}
