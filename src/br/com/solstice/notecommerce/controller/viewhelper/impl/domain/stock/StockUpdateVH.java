package br.com.solstice.notecommerce.controller.viewhelper.impl.domain.stock;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;
import br.com.solstice.notecommerce.entity.domain.product.Product;
import br.com.solstice.notecommerce.entity.domain.stock.Stock;
import br.com.solstice.notecommerce.entity.domain.stock.StockUpdate;

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
			
			LocalDateTime date = null; 
			try {
				// TODO: apply correct datetimeformatter depending of jquery plugin returned value format
				date = LocalDateTime.parse(request.getParameter("date"));
			} catch (NumberFormatException e) {
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
		// TODO Auto-generated method stub

	}

}
