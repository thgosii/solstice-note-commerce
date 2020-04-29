package br.com.solstice.notecommerce.controller.viewhelper.impl.domain.shop.sale;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;
import br.com.solstice.notecommerce.entity.domain.user.User;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;

public class SaleCustomerVH implements IViewHelper {

	@Override
	public Entity getEntity(HttpServletRequest request) {
		String operation = request.getParameter("operation");

		if (operation.equals("findByCustomer")) {
			Sale sale = new Sale();
			
			User user = (User) request.getSession().getAttribute("loggedUser");
			
			Customer customer = new Customer();
			customer.setUser(user);
			
			sale.setCustomer(customer);
			
			return sale;
		}

		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");

		if (operation.equals("findByCustomer")) {
			List<Entity> sales = (List<Entity>) result.getEntities();
			request.setAttribute("sales", sales);

			if (null == sales) {
				return;
			}
			
			request.getRequestDispatcher("/pages/customer/sales.jsp").forward(request, response);
		}
	}

}
