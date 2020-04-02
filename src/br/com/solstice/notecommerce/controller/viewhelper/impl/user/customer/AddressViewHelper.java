package br.com.solstice.notecommerce.controller.viewhelper.impl.user.customer;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.domain.Result;
import br.com.solstice.notecommerce.entity.domain.user.User;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;
import br.com.solstice.notecommerce.entity.domain.user.customer.address.Address;
import br.com.solstice.notecommerce.entity.domain.user.customer.address.AddressType;
import br.com.solstice.notecommerce.entity.domain.user.customer.credit_card.CreditCard;

public class AddressViewHelper implements IViewHelper {

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
				String cep = "";
				if (null != request.getParameter("cep")) {
					try {
						cep = request.getParameter("cep");
					} catch (Exception ex) {
					}
				}

				String publicPlace = "";
				if (null != request.getParameter("publicPlace")) {
					try {
						publicPlace = request.getParameter("publicPlace");
						System.out.println(publicPlace);
					} catch (Exception ex) {
					}
				}

				String state = "";
				if (null != request.getParameter("state")) {
					try {
						state = request.getParameter("state");
					} catch (Exception ex) {
					}
				}

				String city = "";
				if (null != request.getParameter("city")) {
					try {
						city = request.getParameter("city");
					} catch (Exception ex) {
					}
				}

				String neighbourhood = "";
				if (null != request.getParameter("neighbourhood")) {
					try {
						neighbourhood = request.getParameter("neighbourhood");
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

				String complement = "";
				if (null != request.getParameter("complement")) {
					try {
						complement = request.getParameter("complement");
					} catch (Exception ex) {
					}
				}

				String type = "";
				if (null != request.getParameter("type")) {
					try {
						type = request.getParameter("type");
					} catch (Exception ex) {
					}
				}

				Address address = new Address();
				address.setCep(cep);
				address.setPublicPlace(publicPlace);
				address.setState(state);
				address.setCity(city);
				address.setNeighbourhood(neighbourhood);
				address.setNumber(number);
				address.setComplement(complement);

				if (type.equals("shipping")) {
					address.setType(AddressType.SHIPPING);
				} else if (type.equals("billing")) {
					address.setType(AddressType.BILLING);
				} else if (type.equals("shipping_and_billing")) {
					address.setType(AddressType.SHIPPING_AND_BILLING);
				}

				Customer customer = new Customer();

				User loggedUser = (User) request.getSession().getAttribute("loggedUser");
				Long userId = loggedUser.getId();

				User user = new User();
				user.setId(userId);

				customer.setUser(user);

				address.setCustomer(customer);

				return address;
			} else if (operation.equals("consult")) {
				User loggedUser = (User) request.getSession().getAttribute("loggedUser");
				Long userId = loggedUser.getId();

				Address address = new Address();

				Customer customer = new Customer();

				User user = new User();
				user.setId(userId);

				customer.setUser(user);

				address.setCustomer(customer);

				return address;
			} else if (operation.equals("remove")) {
				Long id = 0L;
				if (null != request.getParameter("id")) {
					try {
						id = Long.valueOf(request.getParameter("id"));
					} catch (Exception ex) {
					}
				}

				Address address = new Address();
				address.setId(id);

				return address;
			} else if (operation.equals("prepareUpdate")) {
				Long id = 0L;
				if (null != request.getParameter("id")) {
					try {
						id = Long.valueOf(request.getParameter("id"));
					} catch (Exception ex) {
					}
				}

				Address address = new Address();
				address.setId(id);

				return address;
			} else if (operation.equals("update")) {				
				Long id = 0L;
				if (null != request.getParameter("id")) {
					try {
						id = Long.valueOf(request.getParameter("id"));
					} catch (Exception ex) {
					}
				}
				
				String cep = "";
				if (null != request.getParameter("cep")) {
					try {
						cep = request.getParameter("cep");
					} catch (Exception ex) {
					}
				}

				String publicPlace = "";
				if (null != request.getParameter("publicPlace")) {
					try {
						publicPlace = request.getParameter("publicPlace");
						System.out.println(publicPlace);
					} catch (Exception ex) {
					}
				}

				String state = "";
				if (null != request.getParameter("state")) {
					try {
						state = request.getParameter("state");
					} catch (Exception ex) {
					}
				}

				String city = "";
				if (null != request.getParameter("city")) {
					try {
						city = request.getParameter("city");
					} catch (Exception ex) {
					}
				}

				String neighbourhood = "";
				if (null != request.getParameter("neighbourhood")) {
					try {
						neighbourhood = request.getParameter("neighbourhood");
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

				String complement = "";
				if (null != request.getParameter("complement")) {
					try {
						complement = request.getParameter("complement");
					} catch (Exception ex) {
					}
				}

				String type = "";
				if (null != request.getParameter("type")) {
					try {
						type = request.getParameter("type");
					} catch (Exception ex) {
					}
				}

				Address address = new Address();
				address.setId(id);
				address.setCep(cep);
				address.setPublicPlace(publicPlace);
				address.setState(state);
				address.setCity(city);
				address.setNeighbourhood(neighbourhood);
				address.setNumber(number);
				address.setComplement(complement);

				if (type.equals("shipping")) {
					address.setType(AddressType.SHIPPING);
				} else if (type.equals("billing")) {
					address.setType(AddressType.BILLING);
				} else if (type.equals("shipping_and_billing")) {
					address.setType(AddressType.SHIPPING_AND_BILLING);
				}

				Customer customer = new Customer();

				User loggedUser = (User) request.getSession().getAttribute("loggedUser");
				Long userId = loggedUser.getId();

				User user = new User();
				user.setId(userId);

				customer.setUser(user);

				address.setCustomer(customer);

				return address;
			}
		}

		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");

		if (operation.equals("save")) {
			Address address = (Address) result.getEntities().get(0);
			request.setAttribute("address", address);
			if (null == address) {
				return;
			}
			if (null == result.getMessage()) {
				response.sendRedirect("/note-commerce/customer/adresses?operation=consult");
			} else {
				String[] messages = result.getMessage().trim().split("\n");
				request.setAttribute("messages", messages);
				request.getRequestDispatcher("/pages/customer/customer-address-new.jsp").forward(request, response);
			}
		} else if (operation.equals("consult")) {
			List<Entity> adresses = (List<Entity>) result.getEntities();
			request.setAttribute("adresses", adresses);

			if (null == adresses) {
				return;
			}
			request.getRequestDispatcher("/pages/customer/customer-address-list.jsp").forward(request, response);
		} else if (operation.equals("remove")) {
			response.sendRedirect("/note-commerce/customer/adresses?operation=consult");
		} else if (operation.equals("update")) {
			Address address = (Address) result.getEntities().get(0);
			request.setAttribute("address", address);
			if (null == address) {
				return;
			}
			if (null == result.getMessage()) {
				response.sendRedirect("/note-commerce/customer/adresses?operation=consult");
			} else {
				String[] messages = result.getMessage().trim().split("\n");
				request.setAttribute("messages", messages);
				request.getRequestDispatcher("/pages/customer/customer-address-new.jsp").forward(request, response);
			}
		} else if (operation.equals("prepareUpdate")) {
			Address address = (Address) result.getEntities().get(0);

			if (null == address) {
				return;
			}

			request.setAttribute("address", address);

			request.getRequestDispatcher("/pages/customer/customer-address-new.jsp").forward(request, response);
		} else if (operation.equals("update")) {
			Address address = (Address) result.getEntities().get(0);
			request.setAttribute("address", address);
			if (null == address) {
				return;
			}
			if (null == result.getMessage()) {
				response.sendRedirect("/note-commerce/customer/adresses?operation=consult");
			} else {
				String[] messages = result.getMessage().trim().split("\n");
				request.setAttribute("messages", messages);
				request.getRequestDispatcher("/pages/customer/customer-address-new.jsp").forward(request, response);
			}
		}
	}

}
