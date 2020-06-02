package br.com.solstice.notecommerce.controller.viewhelper.impl.domain.stock;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;
import br.com.solstice.notecommerce.entity.domain.product.Product;
import br.com.solstice.notecommerce.entity.domain.stock.Stock;
import br.com.solstice.notecommerce.entity.domain.stock.StockUpdate;
import br.com.solstice.notecommerce.entity.domain.trade.Trade;

public class StockUpdateVH implements IViewHelper {
	
	@Override
	public Entity getEntity(HttpServletRequest request) {
		String operation = request.getParameter("operation");
		
		if (operation == null) return null;
		
		if (operation.equals("save")) {
			
			Long idProduct = null;
			try {
				idProduct = Long.parseLong(request.getParameter("idProduct"));
			} catch (NumberFormatException e) {
			}
			
			Integer quantity = null; 
			try {
				quantity = Integer.parseInt(request.getParameter("quantity"));
			} catch (NumberFormatException e) {
			}
			
			String dateString = request.getParameter("date"); 
			String timeString = request.getParameter("time");
			LocalDateTime date = null;
			try {
				// TODO: apply correct datetimeformatter depending of jquery plugin returned value format
				date = LocalDateTime.parse(dateString + " " + timeString, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			Product product = new Product();
			product.setId(idProduct);
			Stock stock = new Stock();
			stock.setProduct(product);
			StockUpdate stockUpdate = new StockUpdate();
			stockUpdate.setStock(stock);
			stockUpdate.setQuantity(quantity);
			stockUpdate.setDate(date);
			return stockUpdate;
		} else if (operation.equals("consult")) {
			return new StockUpdate();
		}
		
		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");
		
		request.setAttribute("message", result.getMessage());
		
		if (operation.equals("save")) {
			if (null == result.getMessage()) {
				response.sendRedirect("/note-commerce/admin/stockHistory?operation=consult");
			} else {
				response.getWriter().write(result.getMessage());
			}
		} else if (operation.equals("consult")) {
			List<StockUpdate> stockUpdates = new ArrayList<>();
			for (Entity entity : result.getEntities()) {
				stockUpdates.add((StockUpdate) entity);
			}
			request.setAttribute("stockUpdates", stockUpdates);

			request.getRequestDispatcher("/pages/admin/stock-history.jsp").forward(request, response);
		}
 

	}

}
