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
import br.com.solstice.notecommerce.entity.domain.trade.TradeType;

public class TradeAdminVH implements IViewHelper {

	@Override
	public Entity getEntity(HttpServletRequest request) {
		String operation = request.getParameter("operation");
		
		if (operation == null) return null;
		
		String type = request.getParameter("type");
		if (type != null) {
			type = type.toUpperCase();
		}
		
		if (operation.equals("update")) {
			Long idTrade = null;
			try {
				idTrade = Long.parseLong(request.getParameter("id"));
			} catch (NumberFormatException e) {
			}
			
			Trade trade = new Trade();
			trade.setId(idTrade);
			trade.setType(TradeType.valueOf(type));
			return trade;
		} else if (operation.equals("consult")) {
			Trade trade = new Trade();
			trade.setType(TradeType.valueOf(type));
			return trade;
		}
		
		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");
		
		request.setAttribute("message", result.getMessage());
		
		String tradeType = request.getParameter("type");
		if (tradeType != null) {
			tradeType = tradeType.toUpperCase();
		}
		
		if (operation.equals("update")) {
			if (null == result.getMessage()) {
				response.sendRedirect("/note-commerce/admin/trades?type=" + tradeType.toLowerCase() + "operation=consult");
			} else {
				response.getWriter().write(result.getMessage());
			}
		} else if (operation.equals("consult")) {
			List<Trade> trades = new ArrayList<>();
			for (Entity entity : result.getEntities()) {
				trades.add((Trade) entity);
			}
			request.setAttribute("trades", trades);

			if (TradeType.DEVOLUTION.name().equals(tradeType)) {
				request.getRequestDispatcher("/pages/admin/trades-devolutions.jsp").forward(request, response);
			} else if (TradeType.EXCHANGE.name().equals(tradeType)) {
				request.getRequestDispatcher("/pages/admin/trades-exchanges.jsp").forward(request, response);
			}
		}

	}

}
