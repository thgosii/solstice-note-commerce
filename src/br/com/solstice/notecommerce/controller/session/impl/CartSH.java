package br.com.solstice.notecommerce.controller.session.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import br.com.solstice.notecommerce.controller.session.ISessionHelper;
import br.com.solstice.notecommerce.dao.impl.domain.product.ProductDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.product.Product;
import br.com.solstice.notecommerce.entity.domain.shop.cart.Cart;
import br.com.solstice.notecommerce.entity.domain.shop.cart.CartItem;

public class CartSH implements ISessionHelper {

	@Override
	public void save(Entity entity, HttpSession session) {
		CartItem cartItem = (CartItem) entity;

		cartItem.setProduct((Product) new ProductDAO().consult(cartItem.getProduct(), "findById").get(0));
		cartItem.setSubTotal(cartItem.getProduct().getPrice() * cartItem.getQuantity());

		Cart cart = null;

		if (session.getAttribute("cart") == null) {
			session.setAttribute("cart", new Cart());
		}

		cart = (Cart) session.getAttribute("cart");

		boolean isExists = false;

		for (CartItem item : cart.getItems()) {
			if (item.getProduct().equals(cartItem.getProduct())) {
				isExists = true;
			}
		}

		if (!isExists) {
			cart.addItem(cartItem);
		}
	}

	@Override
	public void remove(Entity entity, HttpSession session) {
		CartItem cartItem = (CartItem) entity;

		Cart cart = (Cart) session.getAttribute("cart");
		
		cart.removeItem(cartItem);
	}

	@Override
	public void update(Entity entity, HttpSession session) {
		CartItem cartItem = (CartItem) entity;

		Cart cart = (Cart) session.getAttribute("cart");
		
		for (CartItem item : cart.getItems()) {
			if (item.getProduct().getId() == cartItem.getProduct().getId()) {
				item.setQuantity(cartItem.getQuantity());
			}
		}
		
		for (CartItem item : cart.getItems()) {
			System.out.println(item.getQuantity());
		}
	}

	@Override
	public List<Entity> consult(Entity entity, HttpSession session, String operation) {
		Cart cart = null;

		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		}

		List<Entity> cartItems = cart == null ? new ArrayList<>()
				: cart.getItems().stream().map(ent -> (Entity) ent).collect(Collectors.toList());

		return cartItems;
	}

}
