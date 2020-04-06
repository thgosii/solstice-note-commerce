package br.com.solstice.notecommerce.controller.viewhelper.impl.domain.shop.cart;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;
import br.com.solstice.notecommerce.entity.domain.product.Product;
import br.com.solstice.notecommerce.entity.domain.shop.cart.CartItem;

public class CartVH implements IViewHelper {

	@Override
	public Entity getEntity(HttpServletRequest request) {
		String operation = request.getParameter("operation");

		if (operation.equals("save")) {
			CartItem cartItem = new CartItem();

			Product product = new Product();

			Long productId = -1L;

			if (request.getParameter("productId") != null) {
				try {
					productId = Long.parseLong(request.getParameter("productId"));
				} catch (Exception ex) {
				}
			}

			product.setId(productId);

			cartItem.setProduct(product);
			cartItem.setQuantity(1);
			cartItem.setSubTotal(0);

			return cartItem;
		} else if (operation.equals("consult")) {
			return new CartItem();
		} else if (operation.equals("remove")) {
			CartItem cartItem = new CartItem();

			Product product = new Product();

			Long productId = -1L;

			if (request.getParameter("productId") != null) {
				try {
					productId = Long.parseLong(request.getParameter("productId"));
				} catch (Exception ex) {
				}
			}

			product.setId(productId);

			cartItem.setProduct(product);

			return cartItem;
		} else if (operation.equals("update")) {
			CartItem cartItem = new CartItem();

			Product product = new Product();

			Long productId = -1L;
			if (request.getParameter("productId") != null) {
				try {
					productId = Long.parseLong(request.getParameter("productId"));
				} catch (Exception ex) {
				}
			}

			int quantity = -1;
			if (request.getParameter("quantity") != null) {
				try {
					quantity = Integer.parseInt(request.getParameter("quantity"));
				} catch (Exception ex) {
				}
			}

			product.setId(productId);

			cartItem.setProduct(product);
			cartItem.setQuantity(quantity);

			return cartItem;
		}

		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");

		if (operation.equals("consult")) {
			List<CartItem> cartItems = result.getEntities().stream().map(cartItem -> (CartItem) cartItem)
					.collect(Collectors.toList());

			request.setAttribute("items", cartItems);

			request.getRequestDispatcher("/pages/shop/cart.jsp").forward(request, response);
		}
	}

}
