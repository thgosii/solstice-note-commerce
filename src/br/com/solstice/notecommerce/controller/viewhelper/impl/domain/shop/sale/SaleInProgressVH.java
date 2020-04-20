package br.com.solstice.notecommerce.controller.viewhelper.impl.domain.shop.sale;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleInProgress;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleItem;
import br.com.solstice.notecommerce.entity.domain.user.customer.address.Address;
import br.com.solstice.notecommerce.entity.domain.user.customer.credit_card.CreditCard;

public class SaleInProgressVH implements IViewHelper {

	@Override
	public Entity getEntity(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException ex) {
			ex.printStackTrace();
		}

		String operation = request.getParameter("operation");

		if (operation.equals("save")) {
			int step = Integer.valueOf(request.getParameter("step"));
			
			switch (step) {
				case 1: {
					// Save Address
					Long addressId = Long.valueOf(request.getParameter("address"));
	
					SaleInProgress saleInProgress = new SaleInProgress();
					saleInProgress.setBalanceUsage(-1);
					
					Address address = new Address();
					address.setId(addressId);
	
					saleInProgress.setAddress(address);
	
					return saleInProgress;
				}
				case 2: {
					// Save Credit Card
					double balance = 0.0;
					Long creditCardId = null;
	
					if (request.getParameter("balance") != null) {
						balance = Double.valueOf(request.getParameter("balance"));
					}
	
					if (request.getParameter("creditCard") != null) {
						creditCardId = Long.valueOf(request.getParameter("creditCard"));
					}
	
					SaleInProgress saleInProgress = new SaleInProgress();
					saleInProgress.setBalanceUsage(balance);
	
					CreditCard creditCard = new CreditCard();
					creditCard.setId(creditCardId);
	
					saleInProgress.setCreditCard(creditCard);
	
					return saleInProgress;
				}
			}
		} else if (operation.equals("consult")) {
			return new SaleInProgress();
		}

		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");

		if (operation.equals("save")) {
			SaleInProgress saleInProgress = (SaleInProgress) result.getEntities().get(0);

			if (saleInProgress.getCreditCard() == null && saleInProgress.getBalanceUsage() == -1.0) {
				response.sendRedirect("/note-commerce/pages/shop/checkout-step-2.jsp");
			} else {
				response.sendRedirect("/note-commerce/pages/shop/checkout-step-3.jsp");
			}
		} else if (operation.equals("consult")) {
			SaleInProgress saleInProgress = (SaleInProgress) result.getEntities().get(0);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			try {
				JSONObject jsonObject = new JSONObject();
				
				jsonObject.put("saleInProgress", saleInProgress);
				
				PrintWriter writer = response.getWriter();
				writer.write(jsonObject.toString());
				writer.flush();
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
	}

}
