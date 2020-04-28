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
import br.com.solstice.notecommerce.entity.domain.trade.TradeType;
import br.com.solstice.notecommerce.entity.domain.user.User;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;

public class TradeCustomerVH implements IViewHelper {

	@Override
	public Entity getEntity(HttpServletRequest request) {
		String operation = request.getParameter("operation");
		
		if (operation == null) return null;
		
		String type = request.getParameter("type");
		if (type != null) {
			type = type.toUpperCase();
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
			trade.setType(TradeType.valueOf(type));
			return trade;
		} else if (operation.equals("consult")) {
			User user = (User) request.getSession().getAttribute("loggedUser");
			
			Customer customer = new Customer();
			customer.setUser(user);
			
			Sale sale = new Sale();
			sale.setCustomer(customer);
			
			Trade trade = new Trade();
			trade.setSale(sale);
			trade.setType(TradeType.valueOf(type));
			return trade;
		}
		
		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");
		
		request.setAttribute("message", result.getMessage());
		
		String tradeType = request.getParameter("type");
		if (tradeType != null) {
			tradeType = tradeType.toUpperCase();
		}
		
		if (operation.equals("save")) {
			if (null != result.getMessage()) {
				if (TradeType.DEVOLUTION.name().equals(tradeType)) {
					request.getRequestDispatcher("/pages/customer/customer-trade-devolution.jsp").forward(request, response);
				} else if (TradeType.EXCHANGE.name().equals(tradeType)) {
					request.getRequestDispatcher("/pages/customer/customer-trade-exchange.jsp").forward(request, response);
				}
			} else {
				response.sendRedirect("/note-commerce/customer/trades?type=" + tradeType.toLowerCase() + "operation=consult");
			}
		} else if (operation.equals("consult")) {
			List<Trade> trades = new ArrayList<>();
			for (Entity entity : result.getEntities()) {
				trades.add((Trade) entity);
			}
			request.setAttribute("trades", trades);
			
			if (TradeType.DEVOLUTION.name().equals(tradeType)) {
				request.getRequestDispatcher("/pages/customer/customer-trade-devolutions.jsp").forward(request, response);
			} else if (TradeType.EXCHANGE.name().equals(tradeType)) {
				request.getRequestDispatcher("/pages/customer/customer-trade-exchanges.jsp").forward(request, response);
			}
		}

	}

}
