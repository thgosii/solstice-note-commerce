package br.com.solstice.notecommerce.controller.viewhelper.impl.domain.stock;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;

// TODO(?): This was just in case we had time to add an extra admin page (or modify the product listing) to show the stock of each product, not in requirements document 
public class StockAdminVH implements IViewHelper {

	@Override
	public Entity getEntity(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
	}

}
