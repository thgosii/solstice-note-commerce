package br.com.solstice.notecommerce.controller.viewhelper.impl.domain.trade;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;
import br.com.solstice.notecommerce.entity.domain.trade.Trade;

public class TradeAdminVH implements IViewHelper {

	@Override
	public Entity getEntity(HttpServletRequest request) {
		String operation = request.getParameter("operation");
		
		if (operation == null) return null;
		
		if (operation.equals("update")) {
			Long idTrade = null;
			try {
				idTrade = Long.parseLong(request.getParameter("id"));
			} catch (NumberFormatException e) {
			}
			
			Trade trade = new Trade();
			trade.setId(idTrade);
			return trade;
		} else if (operation.equals("consult")) {
			return new Trade();
		}
		
		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");
		
		request.setAttribute("message", result.getMessage());
		
		if (operation.equals("update")) {
			if (null == result.getMessage()) {
				response.sendRedirect("/note-commerce/admin/trades?operation=consult");
			} else {
				response.getWriter().write(result.getMessage());
			}
		} else if (operation.equals("consult")) {
			List<Trade> trades = new ArrayList<>();
			for (Entity entity : result.getEntities()) {
				trades.add((Trade) entity);
			}
			request.setAttribute("trades", trades);
			
			request.getRequestDispatcher("/pages/admin/trades.jsp").forward(request, response);;
		}

	}

}
