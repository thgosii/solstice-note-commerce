package br.com.solstice.notecommerce.controller.viewhelper.impl.user.customer;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;
import br.com.solstice.notecommerce.entity.domain.user.User;
import br.com.solstice.notecommerce.entity.domain.user.UserRole;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;
import br.com.solstice.notecommerce.entity.domain.user.customer.Gender;

public class CustomerViewHelper implements IViewHelper {

	@Override
	public Entity getEntity(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String operation = request.getParameter("operation");

		if (operation != null) {
			if (operation.equals("save")) {
				String name = null;
				if (null != request.getParameter("name")) {
					try {
						name = request.getParameter("name");
					} catch (Exception ex) {
					}
				}

				String cpf = null;
				if (null != request.getParameter("cpf")) {
					try {
						cpf = request.getParameter("cpf").replaceAll("\\.", "").replaceAll("-", "");
					} catch (Exception ex) {
					}
				}

				LocalDate dateOfBirth = null;
				if (null != request.getParameter("dateOfBirth")) {
					try {
						dateOfBirth = LocalDate.parse(request.getParameter("dateOfBirth"),
								DateTimeFormatter.ofPattern("yyyy-MM-dd"));
					} catch (Exception ex) {
					}
				}

				String phone = null;
				if (null != request.getParameter("phone")) {
					try {
						phone = request.getParameter("phone");
					} catch (Exception ex) {
					}
				}

				String email = null;
				if (null != request.getParameter("email")) {
					try {
						email = request.getParameter("email");
					} catch (Exception ex) {
					}
				}

				String password = null;
				if (null != request.getParameter("password")) {
					try {
						password = request.getParameter("password");
					} catch (Exception ex) {
					}
				}

				String confirmPassword = null;
				if (null != request.getParameter("confirmPassword")) {
					try {
						confirmPassword = request.getParameter("confirmPassword");
					} catch (Exception ex) {
					}
				}

				Gender gender = null;
				if (null != request.getParameter("gender")) {
					try {
						if (request.getParameter("gender").charAt(0) == 'm') {
							gender = Gender.MALE;
						} else if (request.getParameter("gender").charAt(0) == 'f') {
							gender = Gender.FEMALE;
						}
					} catch (Exception ex) {
					}
				}

				Customer customer = new Customer();
				customer.setName(name);
				customer.setCpf(cpf);
				customer.setDateOfBirth(dateOfBirth);
				customer.setPhone(phone);

				User user = new User();
				user.setEmail(email);
				user.setPassword(password);
				user.setConfirmPassword(confirmPassword);
				user.setRole(UserRole.CLIENT);

				customer.setUser(user);
				customer.setGender(gender);

				return customer;
			} else if (operation.equals("consult")) {
				User loggedUser = (User) request.getSession().getAttribute("loggedUser");

				Long customerUserId = loggedUser.getId();

				Customer customer = new Customer();

				User user = new User();
				user.setId(customerUserId);

				customer.setUser(user);

				return customer;
			} else if (operation.equals("update")) {
				String name = null;
				if (null != request.getParameter("name")) {
					try {
						name = request.getParameter("name");
					} catch (Exception ex) {
					}
				}

				String cpf = null;
				if (null != request.getParameter("cpf")) {
					try {
						cpf = request.getParameter("cpf").replaceAll("\\.", "").replaceAll("-", "");
					} catch (Exception ex) {
					}
				}

				LocalDate dateOfBirth = null;
				if (null != request.getParameter("dateOfBirth")) {
					try {
						dateOfBirth = LocalDate.parse(request.getParameter("dateOfBirth"),
								DateTimeFormatter.ofPattern("yyyy-MM-dd"));
					} catch (Exception ex) {
					}
				}

				String phone = null;
				if (null != request.getParameter("phone")) {
					try {
						phone = request.getParameter("phone");
					} catch (Exception ex) {
					}
				}

				String email = null;
				if (null != request.getParameter("email")) {
					try {
						email = request.getParameter("email");
					} catch (Exception ex) {
					}
				}

				String password = null;
				if (null != request.getParameter("password")) {
					try {
						password = request.getParameter("password");
					} catch (Exception ex) {
					}
				}

				String confirmPassword = null;
				if (null != request.getParameter("confirmPassword")) {
					try {
						confirmPassword = request.getParameter("confirmPassword");
					} catch (Exception ex) {
					}
				}

				Gender gender = null;
				if (null != request.getParameter("gender")) {
					try {
						if (request.getParameter("gender").charAt(0) == 'm') {
							gender = Gender.MALE;
						} else if (request.getParameter("gender").charAt(0) == 'f') {
							gender = Gender.FEMALE;
						}
					} catch (Exception ex) {
					}
				}

				Long customerUserId = 0L;
				if (null != request.getParameter("customerUserId")) {
					try {
						customerUserId = Long.valueOf(request.getParameter("customerUserId"));
					} catch (Exception ex) {
					}
				}

				Long customerId = 0L;
				if (null != request.getParameter("customerId")) {
					try {
						customerId = Long.valueOf(request.getParameter("customerId"));
					} catch (Exception ex) {
					}
				}

				Customer customer = new Customer();
				customer.setId(customerId);
				customer.setName(name);
				customer.setCpf(cpf);
				customer.setDateOfBirth(dateOfBirth);
				customer.setPhone(phone);

				User user = new User();
				user.setId(customerUserId);
				user.setEmail(email);
				user.setPassword(password);
				user.setConfirmPassword(confirmPassword);
				user.setRole(UserRole.CLIENT);

				customer.setUser(user);
				customer.setGender(gender);

				return customer;
			}
		}

		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");

		if (operation.equals("save")) {
			Customer customer = (Customer) result.getEntities().get(0);
			request.setAttribute("previousCustomer", customer);

			if (null == customer) {
				return;
			}
			if (null == result.getMessage()) {
				request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
			} else {
				String[] messages = result.getMessage().trim().split("\n");
				request.setAttribute("messages", messages);

				request.getRequestDispatcher("/pages/customer-register.jsp").forward(request, response);
			}
		} else if (operation.equals("consult")) {
			Customer customer = (Customer) result.getEntities().get(0);
			request.setAttribute("customer", customer);
			if (null == customer) {
				return;
			}

			request.getRequestDispatcher("/pages/customer/customer-profile.jsp").forward(request, response);
		} else if (operation.equals("update")) {
			Customer customer = (Customer) result.getEntities().get(0);
			request.setAttribute("customer", customer);
			if (null == customer) {
				return;
			}
			if (null == result.getMessage()) {
				request.getSession().setAttribute("loggedUser", customer.getUser());
				request.getRequestDispatcher("/pages/customer/customer-profile.jsp").forward(request, response);
			} else {
				String[] messages = result.getMessage().trim().split("\n");
				request.setAttribute("messages", messages);
				request.getRequestDispatcher("/pages/customer/customer-profile.jsp").forward(request, response);
			}
		}
	}

}
