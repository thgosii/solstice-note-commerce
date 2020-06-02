package br.com.solstice.notecommerce.controller.viewhelper.impl.domain.shop.sale;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleCreditCard;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleInProgress;
import br.com.solstice.notecommerce.entity.domain.user.User;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;
import br.com.solstice.notecommerce.entity.domain.user.customer.address.Address;
import br.com.solstice.notecommerce.entity.domain.user.customer.address.AddressType;
import br.com.solstice.notecommerce.entity.domain.user.customer.credit_card.CreditCard;

public class SaleInProgressVH implements IViewHelper {

	@Override
	public Entity getEntity(HttpServletRequest request) {
		String operation = request.getParameter("operation");

		if (operation.equals("save")) {
			int step = Integer.valueOf(request.getParameter("step"));

			switch (step) {
			case 1: {
				// Save Address
				Address address = new Address();

				long addressId = 0;

				if (request.getParameter("address") != null) {
					addressId = Long.valueOf(request.getParameter("address"));
				} else {
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
				}

				SaleInProgress saleInProgress = new SaleInProgress();

				boolean saveForNext = request.getParameter("saveForNext") != null ? true : false;

				saleInProgress.setSaveAddressForNext(saveForNext);

				if (addressId != 0) {
					address.setId(addressId);
				}

				saleInProgress.setAddress(address);

				return saleInProgress;
			}
			case 2: {
				// Save Credit Cards
				double balance = 0.0;
				
				List<SaleCreditCard> creditCards = new ArrayList<SaleCreditCard>();

				if (request.getParameter("balance") != null) {
					try {
						balance = Double.valueOf(request.getParameter("balance"));
					} catch (Exception ex) {
						balance = 0.0;
					}
				}

				if (request.getParameter("ids") == null && request.getParameter("values") == null) {
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
					
					SaleCreditCard saleCreditCard = new SaleCreditCard();
					
					double total = 0.0;
					try {
						total = Double.valueOf(request.getParameter("total"));
					} catch (Exception ex) {}
					
					saleCreditCard.setValue(total);
					saleCreditCard.setCreditCard(creditCard);
					
					creditCards.add(saleCreditCard);
				} else {
					long[] ids = null;
					if (null != request.getParameterValues("ids")) {
						try {
							String[] idsAux = request.getParameterValues("ids");
							
							ids = new long[idsAux.length];
							
							for (int i = 0; i < ids.length; i++) {
								ids[i] = Long.valueOf(idsAux[i]);
							}
						} catch (Exception ex) {
						}
					}
					
					double[] values = null;
					if (null != request.getParameterValues("values")) {
						try {
							String[] valuesAux = request.getParameterValues("values");
							
							values = new double[valuesAux.length];
							
							for (int i = 0; i < values.length; i++) {
								values[i] = Double.valueOf(valuesAux[i]);
							}
						} catch (Exception ex) {
						}
					}
					
					for (int i = 0; i < values.length; i++) {
						SaleCreditCard saleCreditCard = new SaleCreditCard();
						saleCreditCard.setValue(values[i]);
						
						CreditCard creditCard = new CreditCard();
						creditCard.setId(ids[i]);
						
						saleCreditCard.setCreditCard(creditCard);
						
						creditCards.add(saleCreditCard);
					}
				}

				SaleInProgress saleInProgress = new SaleInProgress();

				boolean saveForNext = request.getParameter("saveForNext") != null ? true : false;
				saleInProgress.setSaveCreditCardForNext(saveForNext);
				saleInProgress.setBalanceUsage(balance);
				saleInProgress.setCreditCards(creditCards);

				return saleInProgress;
			}
			}
		} else if (operation.equals("consult")) {
			return new SaleInProgress();
		}

		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");

		if (operation.equals("save")) {
			SaleInProgress saleInProgress = (SaleInProgress) result.getEntities().get(0);

			if (saleInProgress.getCreditCards() == null) {
				response.sendRedirect("/note-commerce/pages/shop/checkout-step-2.jsp");
			} else {
				response.sendRedirect("/note-commerce/pages/shop/checkout-step-3.jsp");
			}
		} else if (operation.equals("consult")) {
			SaleInProgress saleInProgress = (SaleInProgress) result.getEntities().get(0);

			response.setContentType("application/json");

			String json = new Gson().toJson(saleInProgress);

			PrintWriter writer = response.getWriter();
			writer.print(json);
			writer.flush();
		}
	}

}
