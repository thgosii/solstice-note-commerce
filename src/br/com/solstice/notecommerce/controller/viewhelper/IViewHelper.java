package br.com.solstice.notecommerce.controller.viewhelper;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.Result;

public interface IViewHelper {

	public Entity getEntity(HttpServletRequest request);

	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException;

}
