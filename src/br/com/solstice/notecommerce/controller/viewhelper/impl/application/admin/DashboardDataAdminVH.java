package br.com.solstice.notecommerce.controller.viewhelper.impl.application.admin;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;
import br.com.solstice.notecommerce.entity.application.admin.dashboard.DashboardData;
import br.com.solstice.notecommerce.entity.domain.product.Product;

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
			
		}
	}

}
