package br.com.solstice.notecommerce.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.solstice.notecommerce.controller.command.ICommand;
import br.com.solstice.notecommerce.controller.command.impl.ConsultCommand;
import br.com.solstice.notecommerce.controller.command.impl.RemoveCommand;
import br.com.solstice.notecommerce.controller.command.impl.SaveCommand;
import br.com.solstice.notecommerce.controller.command.impl.UpdateCommand;
import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.controller.viewhelper.impl.CustomerViewHelper;
import br.com.solstice.notecommerce.controller.viewhelper.impl.LoginViewHelper;
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.Result;

@WebServlet(urlPatterns = { "/customer/signup", "/customer/update", "/customer/consultAccountData", "/login", "/logout" })
public class Controller extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private Map<String, ICommand> commandsMap;
	private Map<String, IViewHelper> viewHelpersMap;

	public Controller() {
		commandsMap = new HashMap<String, ICommand>();
		commandsMap.put("save", new SaveCommand());
		commandsMap.put("update", new UpdateCommand());
		commandsMap.put("consult", new ConsultCommand());
		commandsMap.put("remove", new RemoveCommand());
		commandsMap.put("login", new ConsultCommand());
		
		viewHelpersMap = new HashMap<String, IViewHelper>();
		// customer
		viewHelpersMap.put("/note-commerce/customer/signup", new CustomerViewHelper());
		viewHelpersMap.put("/note-commerce/customer/update", new CustomerViewHelper());
		viewHelpersMap.put("/note-commerce/customer/consultAccountData", new CustomerViewHelper());
		viewHelpersMap.put("/note-commerce/login", new LoginViewHelper());
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getRequestURI().equals("/note-commerce/shop/logout")) {
			if (null != request.getSession().getAttribute("loggedUser")) {
				request.getSession().removeAttribute("loggedUser");
			}
		}
		response.sendRedirect("/note-commerce/pages/login.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String operation = request.getParameter("operation");
		
		ICommand command = commandsMap.get(operation);
		
		IViewHelper viewHelper = viewHelpersMap.get(request.getRequestURI());

		DomainEntity entity = viewHelper.getEntity(request);
		
		if (null == entity) {
			return;
		}
		
		Result result = command.execute(entity, operation);
		
		viewHelper.setView(result, request, response);
	}

}
