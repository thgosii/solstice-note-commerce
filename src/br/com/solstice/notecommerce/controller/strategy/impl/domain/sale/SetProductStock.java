package br.com.solstice.notecommerce.controller.strategy.impl.domain.sale;

import java.util.Iterator;
import java.util.List;

import br.com.solstice.notecommerce.controller.strategy.AbstractStrategy;
import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.dao.impl.domain.stock.StockDAO;
import br.com.solstice.notecommerce.dao.impl.domain.stock.StockUpdateDAO;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.product.Product;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleItem;
import br.com.solstice.notecommerce.entity.domain.stock.Stock;
import br.com.solstice.notecommerce.entity.domain.stock.StockUpdate;

public class SetProductStock extends AbstractStrategy implements IStrategy {

	public SetProductStock(List<String> requiredBussinessRules) {
		super(requiredBussinessRules);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String process(Entity entity) {
		Sale sale = (Sale) entity;
		
		// Checks for available stock
		StockDAO stockDAO = new StockDAO();
		
		for (SaleItem saleItem : sale.getItems()) {
			System.out.println("saleitem: " + saleItem);
			Stock stock = new Stock();
			stock.setProduct(saleItem.getProduct());
			Stock stockOfProduct = (Stock) stockDAO.consult(stock, "consult").get(0);
			
			if (stockOfProduct.getQuantity() < saleItem.getQuantity()) {
				return "Um ou mais produtos estão em falta no estoque";
			}
		}

		
		// Updates stock
		StockUpdateDAO stockUpdateDAO = new StockUpdateDAO();

		for (SaleItem saleItem : sale.getItems()) {
			StockUpdate stockUpdate = new StockUpdate();
			
			Stock stock = new Stock();
			stock.setProduct(saleItem.getProduct());
			Stock stockOfProduct = (Stock) stockDAO.consult(stock, "consult").get(0);
			
			stockUpdate.setStock(stockOfProduct);
			stockUpdate.setQuantity(saleItem.getQuantity() * -1);
			System.out.println("stockupdate save: " + stockUpdate);
			stockUpdateDAO.save(stockUpdate);
		}
		
		
		return null;
	}

}
