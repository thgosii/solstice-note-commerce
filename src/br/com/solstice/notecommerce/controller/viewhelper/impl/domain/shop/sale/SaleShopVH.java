package br.com.solstice.notecommerce.controller.viewhelper.impl.domain.shop.sale;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleInProgress;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleStatus;

public class SaleShopVH implements IViewHelper {

	@Override
	public Entity getEntity(HttpServletRequest request) {
		String operation = request.getParameter("operation");

		if (operation.equals("save")) {
			Sale sale = new Sale();

			SaleInProgress saleInProgress = (SaleInProgress) request.getSession().getAttribute("saleInProgress");

			if (saleInProgress.getCreditCard() != null) {
				sale.setCreditCard(saleInProgress.getCreditCard());
			}
			sale.setAddress(saleInProgress.getAddress());
			sale.setBalanceUsage(saleInProgress.getBalanceUsage());
			sale.setCustomer(saleInProgress.getCustomer());
			sale.setDateTime(LocalDateTime.now());
			sale.setStatus(SaleStatus.PAYMENT_APPROVED);
			sale.setItems(saleInProgress.getItems());
			sale.setIdentifyNumber(Sale.generateIdentifyNumber(sale.getCustomer().getUser().getId()));
			
			return sale;
		}

		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");
		
		if (operation.equals("save")) {
			Sale sale = (Sale) result.getEntities().get(0);
			request.setAttribute("sale", sale);

			if (null == sale) {
				return;
			}
			
			if (null == result.getMessage()) {
				request.getRequestDispatcher("/pages/shop/checkout-finish.jsp").forward(request, response);
			} else {
				String[] messages = result.getMessage().trim().split("\n");
				request.setAttribute("messages", messages);

				request.getRequestDispatcher("/pages/shop/checkout-step-1.jsp").forward(request, response);
			}
		}
	}

}
