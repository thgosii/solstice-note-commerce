package br.com.solstice.notecommerce.controller.viewhelper.impl.domain.sale;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;

public class SaleAdminVH implements IViewHelper {

	@Override
	public Entity getEntity(HttpServletRequest request) {
		String operation = request.getParameter("operation");
		
		if (operation.equals("consult")) {
			return new Sale();
		}
		
		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");
		
		if (operation.equals("consult")) {
			List<Entity> sales = (List<Entity>) result.getEntities();
			request.setAttribute("sales", sales);

			if (null == sales) {
				return;
			}
			
			request.getRequestDispatcher("/pages/admin/sales.jsp").forward(request, response);
		}
	}

}
