package br.com.solstice.notecommerce.controller.viewhelper.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.Result;
import br.com.solstice.notecommerce.domain.customer.Customer;

public class CustomerViewHelper implements IViewHelper {

	@Override
	public DomainEntity getEntity(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String operation = request.getParameter("operation");

		if (operation != null) {
			if (operation.equals("save")) {
				String name = null;
				if (request.getParameter("name") != null) {
					try {
						name = request.getParameter("name");
					} catch (Exception ex) {
					}
				}
				
				String description = null;
				if (request.getParameter("description") != null) {
					try {
						description = request.getParameter("description");
					} catch (Exception ex) {
					}
				}
				
				Customer client = new Customer();
				client.setName(name);
				client.setDescription(description);
				
				return client;
			}
		}
		
		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");

		if (operation.equals("save")) {
			Customer client = (Customer) result.getEntities().get(0);
			request.setAttribute("customer", client);
			if (null == client) {
				return;
			}
			if (null == result.getMessage()) {
//				request.getRequestDispatcher("sign-up-success.jsp").forward(request, response);
			} else {
				String[] messages = result.getMessage().trim().split("\n");
				request.setAttribute("messages", messages);
//				request.getRequestDispatcher("sign-up-success.jsp").forward(request, response);
			}
		}
	}

}
