package br.com.solstice.notecommerce.controller.viewhelper.impl.domain.trade;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;
import br.com.solstice.notecommerce.entity.domain.product.Product;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleItem;
import br.com.solstice.notecommerce.entity.domain.trade.Trade;
import br.com.solstice.notecommerce.entity.domain.trade.TradeStatus;
import br.com.solstice.notecommerce.entity.domain.trade.TradeType;
import br.com.solstice.notecommerce.entity.domain.user.User;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;

public class TradeCustomerVH implements IViewHelper {

	@Override
	public Entity getEntity(HttpServletRequest request) {
		String operation = request.getParameter("operation");
		
		if (operation == null) return null;
		
		TradeType type = null;
		try {
			type = TradeType.valueOf(request.getParameter("type").toUpperCase());
		} catch (Exception exception) {
			System.out.println("Invalid TradeType: " + request.getParameter("type"));
			return null;
		}
		
		if (operation.equals("save")) {
			Long idProduct = null;
			try {
				idProduct = Long.parseLong(request.getParameter("product"));
			} catch (NumberFormatException e) {
			}
			
			Integer productQuantity = null;
			try {
				productQuantity = Integer.parseInt(request.getParameter("quantity"));
			} catch (NumberFormatException e) {
			}
			
			Long idSale = null;
			try {
				idSale = Long.parseLong(request.getParameter("sale"));
			} catch (NumberFormatException e) {
			}
			
			Sale sale = new Sale();
			sale.setId(idSale);
			
			Product product = new Product();
			product.setId(idProduct);
			
			SaleItem saleItem = new SaleItem();
			saleItem.setProduct(product);
			
			Trade trade = new Trade();
			trade.setProductQuantity(productQuantity);
			trade.setSale(sale);
			trade.setSaleItem(saleItem);
			trade.setStatus(TradeStatus.AWAITING_AUTHORIZATION);
			trade.setTrackingNumber(Trade.generateTrackingNumber(((User) request.getSession().getAttribute("loggedUser")).getId()));
			trade.setType(type);
			return trade;
		} else if (operation.equals("consult")) {
			User user = (User) request.getSession().getAttribute("loggedUser");
			
			Customer customer = new Customer();
			customer.setUser(user);
			
			Sale sale = new Sale();
			sale.setCustomer(customer);
			
			Trade trade = new Trade();
			trade.setSale(sale);
			trade.setType(type);
			return trade;
		}
		
		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");

		String tradeType = request.getParameter("type");
		
		if (operation.equals("save")) {
			if (null != result.getMessage()) {
				request.setAttribute("messages", result.getMessage().split("\n"));
				
				request.setAttribute("idSale", request.getParameter("sale"));
				request.setAttribute("idProduct", request.getParameter("product"));
				request.setAttribute("quantity", request.getParameter("quantity"));
				request.setAttribute("saleQuantity", request.getParameter("saleQuantity"));
				request.setAttribute("title", request.getParameter("title"));
				request.getRequestDispatcher("/pages/customer/customer-trade-form.jsp").forward(request, response);
			} else {
				response.sendRedirect("/note-commerce/customer/trades?type=" + tradeType + "&operation=consult");
			}
		} else if (operation.equals("consult")) {
			List<Trade> trades = new ArrayList<>();
			for (Entity entity : result.getEntities()) {
				trades.add((Trade) entity);
			}
			request.setAttribute("trades", trades);
			
			request.getRequestDispatcher("/pages/customer/customer-trade-list.jsp").forward(request, response);
		}

	}

}
