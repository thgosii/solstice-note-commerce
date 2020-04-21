package br.com.solstice.notecommerce.controller.viewhelper.impl.application.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;
import br.com.solstice.notecommerce.entity.application.admin.dashboard.DashboardData;

public class DashboardDataAdminVH implements IViewHelper {

	@Override
	public Entity getEntity(HttpServletRequest request) {

		String operation = request.getParameter("operation");

		if (operation.equals("consult")) {
			
			LocalDate minDate = LocalDate.MIN;
			try {
				minDate = LocalDate.parse(request.getParameter("minDate"));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			LocalDate maxDate = LocalDate.MAX;
			try {
				maxDate = LocalDate.parse(request.getParameter("maxDate"));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			DashboardData dashboardData = new DashboardData(minDate, maxDate);
			return dashboardData;
		}

		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");

		if (operation.equals("consult")) {
			DashboardData dashboardData = (DashboardData) result.getEntities().get(0);
			
			response.setContentType("application/json");
			
			Gson gson = new Gson();
			
			PrintWriter writer = response.getWriter();
			writer.write(gson.toJson(dashboardData));
			writer.flush();
		}
	}

}
