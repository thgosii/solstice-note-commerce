package br.com.solstice.notecommerce.controller.viewhelper.impl.product;

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
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.Result;
import br.com.solstice.notecommerce.domain.product.Product;

public class ProductShopViewHelper implements IViewHelper {

	@Override
	public DomainEntity getEntity(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException ex) {
			ex.printStackTrace();
		}

		String operation = request.getParameter("operation");

		if (operation.equals("consult")) {
			Product product = new Product();
			product.setId(-1L);
			return product;
		}

		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");

		if (operation.equals("consult")) {
			List<Product> products = result.getEntities().stream().map(product -> (Product) product)
					.collect(Collectors.toList());

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			try {
				JSONObject responseDetailsJson = new JSONObject();
				JSONArray jsonArray = new JSONArray();

				for (Product product : products) {
					JSONObject brandDetailsJSON = new JSONObject();
					brandDetailsJSON.put("id", product.getHd());
					brandDetailsJSON.put("title", product.getTitle());
					brandDetailsJSON.put("imageURL", product.getImage().getUrl());
					brandDetailsJSON.put("price", product.getPrice());
					brandDetailsJSON.put("description", product.getDescription());
					brandDetailsJSON.put("brandName", product.getBrand().getName());
					brandDetailsJSON.put("processor", product.getProcessor());
					brandDetailsJSON.put("graphicsCard", product.getGraphicsCard());
					brandDetailsJSON.put("ram", product.getRam());
					brandDetailsJSON.put("monitor", product.getMonitor());
					brandDetailsJSON.put("hd", product.getHd());
					brandDetailsJSON.put("ssd", product.getSsd());
					brandDetailsJSON.put("os", product.getOs());
					jsonArray.put(brandDetailsJSON);
				}
				responseDetailsJson.put("brands", jsonArray);

				PrintWriter writer = response.getWriter();
				writer.write(jsonArray.toString());
				writer.flush();
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
	}

}
