package br.com.solstice.notecommerce.controller.viewhelper.impl.application.admin;

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

import com.google.gson.Gson;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;
import br.com.solstice.notecommerce.entity.domain.product.brand.Brand;

public class BrandAdminVH implements IViewHelper {

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

			Gson gson = new Gson();

			PrintWriter writer = response.getWriter();
			writer.write(gson.toJson(brands));
			writer.flush();
		}
	}

}
