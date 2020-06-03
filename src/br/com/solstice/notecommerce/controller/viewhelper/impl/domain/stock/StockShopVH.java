package br.com.solstice.notecommerce.controller.viewhelper.impl.domain.stock;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;
import br.com.solstice.notecommerce.entity.domain.stock.Stock;

public class StockShopVH implements IViewHelper {

	@Override
	public Entity getEntity(HttpServletRequest request) {
		String operation = request.getParameter("operation");

		if (operation.equals("consult")) {
			return new Stock();
		}

		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");

		if (operation.equals("consult")) {
			List<Stock> stocks = result.getEntities().stream().map(stock -> (Stock) stock).collect(Collectors.toList());

			response.setContentType("application/json");

			Gson gson = new Gson();

			PrintWriter writer = response.getWriter();
			writer.write(gson.toJson(stocks));
			writer.flush();
		}
	}

}
