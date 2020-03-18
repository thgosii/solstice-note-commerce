package br.com.solstice.notecommerce.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
import br.com.solstice.notecommerce.controller.viewhelper.impl.BrandViewHelper;
import br.com.solstice.notecommerce.controller.viewhelper.impl.CustomerViewHelper;
import br.com.solstice.notecommerce.controller.viewhelper.impl.LoginViewHelper;
import br.com.solstice.notecommerce.controller.viewhelper.impl.ProductViewHelper;
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.Result;

@WebServlet(urlPatterns = { 
		"/login",
		"/logout",
		"/admin/products",
		"/customer/signup", 
		"/customer/update", 
		"/customer/consultAccountData",
		"/admin/brands"
})
@MultipartConfig
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
		
		// general
		viewHelpersMap.put("/note-commerce/login", new LoginViewHelper());
		
		// admin
		viewHelpersMap.put("/note-commerce/admin/products", new ProductViewHelper());
		viewHelpersMap.put("/note-commerce/admin/brands", new BrandViewHelper());
		
		// customer
		viewHelpersMap.put("/note-commerce/customer/signup", new CustomerViewHelper());
		viewHelpersMap.put("/note-commerce/customer/update", new CustomerViewHelper());
		viewHelpersMap.put("/note-commerce/customer/consultAccountData", new CustomerViewHelper());
		
		// shop
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// User logout
		if (request.getRequestURI().equals("/note-commerce/logout")) {
			if (null != request.getSession().getAttribute("loggedUser")) {
				request.getSession().invalidate();
			}
			response.sendRedirect("/note-commerce/pages/login.jsp");
			return;
		}
		
		processRequest(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);		
	}
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String operation = request.getParameter("operation");

		System.out.println("\n--------------------------------");
		System.out.println("New " + request.getMethod() + " request to " + request.getServletPath().toString() + " with operation \"" + operation + "\"");
		
		ICommand command = commandsMap.get(operation);
		System.out.println("command: " + (command != null ? command.getClass().getSimpleName() : command));

		IViewHelper viewHelper = viewHelpersMap.get(request.getRequestURI());
		System.out.println("viewHelper: " + (viewHelper != null ? viewHelper.getClass().getSimpleName() : viewHelper));

		DomainEntity entity = viewHelper.getEntity(request);
		System.out.println("entity: " + entity + "\n");
		
		if (null == entity) {
			return;
		}
		
		Result result = command.execute(entity, operation);
		System.out.println("\nResult entities list:"); if (result.getEntities() != null) for (DomainEntity resultEntity : result.getEntities()) { System.out.println(resultEntity); } else System.out.println("null entity list");
		
		viewHelper.setView(result, request, response);
		
		System.out.println("\n--------------------------------");
	}

}
