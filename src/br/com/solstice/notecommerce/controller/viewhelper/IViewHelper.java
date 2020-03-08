package br.com.solstice.notecommerce.controller.viewhelper;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.Result;

public interface IViewHelper {

	public DomainEntity getEntity(HttpServletRequest request);

	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException;

}
