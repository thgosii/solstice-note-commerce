package br.com.solstice.notecommerce.controller.viewhelper.impl.product;

import java.io.IOException;
import java.io.PrintWriter;
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
import br.com.solstice.notecommerce.entity.domain.product.brand.Brand;

public class BrandViewHelper implements IViewHelper {

	@Override
	public Entity getEntity(HttpServletRequest request) {
		String operation = request.getParameter("operation");

		if (operation.equals("consult")) {
			return new Brand();
		}

		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");

		if (operation.equals("consult")) {
			List<Brand> brands = result.getEntities().stream().map(brand -> (Brand) brand).collect(Collectors.toList());

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			try {
				JSONObject responseDetailsJson = new JSONObject();
				JSONArray jsonArray = new JSONArray();

				for (Brand brand : brands) {
					JSONObject brandDetailsJSON = new JSONObject();
					brandDetailsJSON.put("id", brand.getId());
					brandDetailsJSON.put("name", brand.getName());
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
