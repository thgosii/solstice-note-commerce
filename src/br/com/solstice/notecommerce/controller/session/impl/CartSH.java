package br.com.solstice.notecommerce.controller.session.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import br.com.solstice.notecommerce.controller.session.ISessionHelper;
import br.com.solstice.notecommerce.dao.impl.domain.product.ProductDAO;
import br.com.solstice.notecommerce.dao.impl.domain.stock.StockDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.product.Product;
import br.com.solstice.notecommerce.entity.domain.shop.cart.Cart;
import br.com.solstice.notecommerce.entity.domain.shop.cart.CartItem;
import br.com.solstice.notecommerce.entity.domain.stock.Stock;

public class CartSH implements ISessionHelper {

	@Override
	public void save(Entity entity, HttpSession session) {
		CartItem cartItem = (CartItem) entity;

		// Check if has stock
		Product product = (Product) new ProductDAO().consult(cartItem.getProduct(), "findById").get(0);
		Stock stock = (Stock) new StockDAO().consult(new Stock(product, null), "consult").get(0);
		if (stock.getQuantity() < cartItem.getQuantity()) {
			System.out.println("no stock");
			return;
		}
		
		cartItem.setProduct(product);
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

				// Check if has stock
				Product product = (Product) new ProductDAO().consult(cartItem.getProduct(), "findById").get(0);
				Stock stock = (Stock) new StockDAO().consult(new Stock(product, null), "consult").get(0);
				if (stock.getQuantity() < cartItem.getQuantity()) {
					System.out.println("no stock2");
					return;
				}
				
				item.setQuantity(cartItem.getQuantity());
				item.setSubTotal(item.getQuantity() * item.getProduct().getPrice());
			}
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
