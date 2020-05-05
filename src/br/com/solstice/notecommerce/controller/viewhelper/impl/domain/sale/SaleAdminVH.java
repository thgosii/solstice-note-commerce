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
		} else if (operation.equals("update")) {
			Long id = null;
			if (null != request.getParameter("id")) {
				try {
					id = Long.parseLong(request.getParameter("id"));
				} catch (Exception ex) {
				}
			}
			
			Sale sale = new Sale();
			sale.setId(id);
			
			return sale;
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
		} else if (operation.equals("update")) {
			Sale sale = (Sale) result.getEntities().get(0);
			
			request.setAttribute("sale", sale);
			
			if (null == sale) {
				return;
			}
			
			response.sendRedirect("/note-commerce/admin/sales?operation=consult");
		}
	}

}
