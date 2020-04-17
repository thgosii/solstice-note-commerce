package br.com.solstice.notecommerce.controller;

import java.io.IOException;
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
import br.com.solstice.notecommerce.controller.viewhelper.impl.application.admin.BrandAdminVH;
import br.com.solstice.notecommerce.controller.viewhelper.impl.application.admin.DashboardDataAdminVH;
import br.com.solstice.notecommerce.controller.viewhelper.impl.application.customer.BalanceCustomerVH;
import br.com.solstice.notecommerce.controller.viewhelper.impl.application.shop.ProductShopVH;
import br.com.solstice.notecommerce.controller.viewhelper.impl.domain.product.ProductVH;
import br.com.solstice.notecommerce.controller.viewhelper.impl.domain.shop.cart.CartVH;
import br.com.solstice.notecommerce.controller.viewhelper.impl.domain.user.LoginVH;
import br.com.solstice.notecommerce.controller.viewhelper.impl.domain.user.customer.AddressVH;
import br.com.solstice.notecommerce.controller.viewhelper.impl.domain.user.customer.CreditCardVH;
import br.com.solstice.notecommerce.controller.viewhelper.impl.domain.user.customer.CustomerVH;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;

@WebServlet(urlPatterns = { 
		"/login",
		"/logout",
		"/signup",
		"/admin/*" ,
		"/customer/*",
		"/shop/*"
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
		commandsMap.put("prepareUpdate", new ConsultCommand());

		viewHelpersMap = new HashMap<String, IViewHelper>();

		// general
		viewHelpersMap.put("/note-commerce/login", new LoginVH());

		// admin
		viewHelpersMap.put("/note-commerce/admin/products", new ProductVH());
		viewHelpersMap.put("/note-commerce/admin/dashboard", new DashboardDataAdminVH());
		viewHelpersMap.put("/note-commerce/admin/brands", new BrandAdminVH());

		// customer
		viewHelpersMap.put("/note-commerce/signup", new CustomerVH());
		viewHelpersMap.put("/note-commerce/customer", new CustomerVH());
		viewHelpersMap.put("/note-commerce/customer/creditCards", new CreditCardVH());
		viewHelpersMap.put("/note-commerce/customer/adresses", new AddressVH());
		viewHelpersMap.put("/note-commerce/customer/balance", new BalanceCustomerVH());

		// shop
		viewHelpersMap.put("/note-commerce/shop/products", new ProductShopVH());
		viewHelpersMap.put("/note-commerce/shop/cart", new CartVH());
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");

		System.out.println("================================");
		System.out.println("New " + request.getMethod() + " request to " + request.getRequestURI().substring(request.getContextPath().length())
				+ " with operation \"" + operation + "\"");

		ICommand command = commandsMap.get(operation);
		System.out.println("command: " + (command != null ? command.getClass().getSimpleName() : command));

		IViewHelper viewHelper = viewHelpersMap.get(request.getRequestURI());
		System.out.println("viewHelper: " + (viewHelper != null ? viewHelper.getClass().getSimpleName() : viewHelper));

		if (null == command || null == viewHelper) {
			response.setStatus(422); // Unprocessable Entity
			System.out.println("Invalid path or operation\n================================\n\n");
			return;
		}

		Entity entity = viewHelper.getEntity(request);
		System.out.println("entity: " + entity + "\n--------------------------------");

		Result result = command.execute(entity, request.getSession(), operation);
		System.out.println("--------------------------------\nResult entities list" + (result.getEntities() != null ? " (" + result.getEntities().size() + "):" : ":"));
		if (result.getEntities() != null) {
			for (Entity resultEntity : result.getEntities()) {
				System.out.println(resultEntity);
			}
		} else { System.out.println("null entity list"); }

		viewHelper.setView(result, request, response);

		System.out.println("================================\n\n");
	}

}
