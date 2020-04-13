package br.com.solstice.notecommerce.controller.viewhelper.impl.application.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;
import br.com.solstice.notecommerce.entity.domain.product.Product;
import br.com.solstice.notecommerce.entity.domain.user.User;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;

public class BalanceCustomerVH implements IViewHelper {
	
	@Override
	public Entity getEntity(HttpServletRequest request) {
		String operation = request.getParameter("operation");
		
		if (operation.equals("consult")) {
			User loggedUser = (User) request.getSession().getAttribute("loggedUser");
			Long userId = loggedUser.getId();

			Customer customer = new Customer();

			User user = new User();
			user.setId(userId);

			customer.setUser(user);
			
			return customer;
		}
		
		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");

		if (operation.equals("consult")) {
			Customer customer = (Customer) result.getEntities().get(0);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			try {
				JSONObject jsonObject = new JSONObject();
				
				jsonObject.put("balance", customer.getBalance());

				PrintWriter writer = response.getWriter();
				writer.write(jsonObject.toString());
				writer.flush();
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
	}

}
