package br.com.solstice.notecommerce.controller.viewhelper.impl.domain.user.customer;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;
import br.com.solstice.notecommerce.entity.domain.user.User;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;
import br.com.solstice.notecommerce.entity.domain.user.customer.credit_card.CreditCard;

public class CreditCardVH implements IViewHelper {

	@Override
	public Entity getEntity(HttpServletRequest request) {

		String operation = request.getParameter("operation");

		if (null != operation) {
			if (operation.equals("save")) {
				String number = "";
				if (null != request.getParameter("number")) {
					try {
						number = request.getParameter("number");
					} catch (Exception ex) {
					}
				}

				String securityCode = "";
				if (null != request.getParameter("securityCode")) {
					try {
						securityCode = request.getParameter("securityCode");
					} catch (Exception ex) {
					}
				}

				String printedName = "";
				if (null != request.getParameter("printedName")) {
					try {
						printedName = request.getParameter("printedName");
					} catch (Exception ex) {
					}
				}

				CreditCard creditCard = new CreditCard();

				creditCard.setNumber(number);
				creditCard.setSecurityCode(securityCode);
				creditCard.setPrintedName(printedName);

				Customer customer = new Customer();

				User loggedUser = (User) request.getSession().getAttribute("loggedUser");
				Long customerUserId = loggedUser.getId();
				
				User user = new User();
				user.setId(customerUserId);

				customer.setUser(user);

				creditCard.setCustomer(customer);

				return creditCard;
			} else if (operation.equals("consult")) {
				User loggedUser = (User) request.getSession().getAttribute("loggedUser");
				Long userId = loggedUser.getId();

				CreditCard creditCard = new CreditCard();

				Customer customer = new Customer();

				User user = new User();
				user.setId(userId);

				customer.setUser(user);

				creditCard.setCustomer(customer);

				return creditCard;
			} else if (operation.equals("remove")) {
				Long id = 0L;
				if (null != request.getParameter("id")) {
					try {
						id = Long.valueOf(request.getParameter("id"));
					} catch (Exception ex) {
					}
				}

				CreditCard creditCard = new CreditCard();

				creditCard.setId(id);

				return creditCard;
			} else if (operation.equals("update")) {
				Long userId = 0L;
				if (null != request.getParameter("userId")) {
					try {
						userId = Long.valueOf(request.getParameter("userId"));
					} catch (Exception ex) {
					}
				}

				Long id = 0L;
				if (null != request.getParameter("id")) {
					try {
						id = Long.valueOf(request.getParameter("id"));
					} catch (Exception ex) {
					}
				}

				String number = "";
				if (null != request.getParameter("number")) {
					try {
						number = request.getParameter("number");
					} catch (Exception ex) {
					}
				}

				String securityCode = "";
				if (null != request.getParameter("securityCode")) {
					try {
						securityCode = request.getParameter("securityCode");
					} catch (Exception ex) {
					}
				}

				String printedName = "";
				if (null != request.getParameter("printedName")) {
					try {
						printedName = request.getParameter("printedName");
					} catch (Exception ex) {
					}
				}

				CreditCard creditCard = new CreditCard();

				creditCard.setId(id);
				creditCard.setNumber(number);
				creditCard.setSecurityCode(securityCode);
				creditCard.setPrintedName(printedName);

				Customer customer = new Customer();

				User user = new User();
				user.setId(userId);

				customer.setUser(user);

				creditCard.setCustomer(customer);

				return creditCard;
			} else if (operation.equals("prepareUpdate")) {
				Long id = 0L;
				if (null != request.getParameter("id")) {
					try {
						id = Long.valueOf(request.getParameter("id"));
					} catch (Exception ex) {
					}
				}

				CreditCard creditCard = new CreditCard();

				creditCard.setId(id);

				return creditCard;
			}
		}

		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");

		if (operation.equals("save")) {
			CreditCard creditCard = (CreditCard) result.getEntities().get(0);
			request.setAttribute("creditCard", creditCard);
			if (null == creditCard) {
				return;
			}
			if (null == result.getMessage()) {
				response.sendRedirect("/note-commerce/customer/creditCards?operation=consult");
			} else {
				String[] messages = result.getMessage().trim().split("\n");
				request.setAttribute("messages", messages);
				request.getRequestDispatcher("/pages/customer/customer-credit-card-new.jsp").forward(request, response);
			}
		} else if (operation.equals("consult")) {
			List<Entity> creditCards = (List<Entity>) result.getEntities();
			request.setAttribute("creditCards", creditCards);

			if (null == creditCards) {
				return;
			}

			request.getRequestDispatcher("/pages/customer/customer-credit-card-list.jsp").forward(request, response);
		} else if (operation.equals("remove")) {
			response.sendRedirect("/note-commerce/customer/creditCards?operation=consult");
		} else if (operation.equals("update")) {
			CreditCard creditCard = (CreditCard) result.getEntities().get(0);
			request.setAttribute("creditCard", creditCard);
			if (null == creditCard) {
				return;
			}
			if (null == result.getMessage()) {
				response.sendRedirect("/note-commerce/customer/creditCards?operation=consult");
			} else {
				String[] messages = result.getMessage().trim().split("\n");
				request.setAttribute("messages", messages);
				request.getRequestDispatcher("/pages/customer/customer-credit-card-new.jsp").forward(request, response);
			}
		} else if (operation.equals("prepareUpdate")) {
			CreditCard creditCard = (CreditCard) result.getEntities().get(0);

			if (null == creditCard) {
				return;
			}

			request.setAttribute("creditCard", creditCard);

			request.getRequestDispatcher("/pages/customer/customer-credit-card-new.jsp").forward(request, response);
		}
	}

}
