package br.com.solstice.notecommerce.controller.viewhelper.impl;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.Result;
import br.com.solstice.notecommerce.domain.product.Product;
import br.com.solstice.notecommerce.domain.product.brand.Brand;
import br.com.solstice.notecommerce.domain.product.file.ProductFile;
import br.com.solstice.notecommerce.domain.user.User;
import br.com.solstice.notecommerce.domain.user.UserRole;
import br.com.solstice.notecommerce.domain.user.customer.Customer;
import br.com.solstice.notecommerce.domain.user.customer.Gender;

public class ProductViewHelper implements IViewHelper {

	@Override
	public DomainEntity getEntity(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String operation = request.getParameter("operation");
		
		if (operation != null) {
			if (operation.equals("save")) {
				String title = null;
				if (null != request.getParameter("title")) {
					try {
						title = request.getParameter("title");
					} catch (Exception ex) {
					}
				}
				
				double price = -1d;
				if (null != request.getParameter("price")) {
					try {
						price = Double.parseDouble(request.getParameter("price"));
					} catch (Exception ex) {
					}
				}
				
				String imageUrl = null;
				InputStream imageFileContent = null;
				try {
					Part imageFilePart = request.getPart("image");
					imageFileContent = imageFilePart.getInputStream();
					String fileName = Paths.get(imageFilePart.getSubmittedFileName()).getFileName().toString();
					imageUrl = ProductFile.generateUrl(fileName);
				} catch (Exception ex) {
				}

				String description = null;
				if (null != request.getParameter("description")) {
					try {
						description = request.getParameter("description");
					} catch (Exception ex) {
					}
				}
				
				long brandId = -1;
				if (null != request.getParameter("brand")) {
					try {
						brandId = Long.parseLong(request.getParameter("brand"));
					} catch (Exception ex) {
					}
				}

				String processor = null;
				if (null != request.getParameter("processor")) {
					try {
						processor = request.getParameter("processor");
					} catch (Exception ex) {
					}
				}

				String graphicsCard = null;
				if (null != request.getParameter("graphics_card")) {
					try {
						graphicsCard = request.getParameter("graphics_card");
					} catch (Exception ex) {
					}
				}

				int ram = -1;
				if (null != request.getParameter("ram")) {
					try {
						ram = Integer.parseInt(request.getParameter("ram"));
					} catch (Exception ex) {
					}
				}

				String monitor = null;
				if (null != request.getParameter("monitor")) {
					try {
						monitor = request.getParameter("monitor");
					} catch (Exception ex) {
					}
				}

				int hd = -1;
				if (null != request.getParameter("hd-capacity")) {
					try {
						hd = Integer.parseInt(request.getParameter("hd-capacity"));
					} catch (Exception ex) {
					}
				}

				int ssd = -1;
				if (null != request.getParameter("ssd-capacity")) {
					try {
						hd = Integer.parseInt(request.getParameter("ssd-capacity"));
					} catch (Exception ex) {
					}
				}

				String os = null;
				if (null != request.getParameter("os")) {
					try {
						os = request.getParameter("os");
					} catch (Exception ex) {
					}
				}

				Brand brand = new Brand();
				brand.setId(brandId);
				ProductFile image = new ProductFile();
				image.setFileContent(imageFileContent);
				image.setUrl(imageUrl);
				Product product = new Product();
				product.setTitle(title);
				product.setPrice(price);
				product.setImage(image);
				product.setDescription(description);
				product.setBrand(brand);
				product.setProcessor(processor);
				product.setGraphicsCard(graphicsCard);
				product.setRam(ram);
				product.setMonitor(monitor);
				product.setHd(hd);
				product.setSsd(ssd);
				product.setOs(os);
				
				System.out.println(product);
				
				return product;
			} else if (operation == "consult") {
				
				long productId = -1;
				if (null != request.getParameter("productId")) {
					try {
						productId = Long.parseLong(request.getParameter("productId"));
					} catch (Exception ex) {
					}
				}
				
				Product product = new Product();
				product.setId(productId);
				
				System.out.println(product);
				
				return product;
			}
		}
		
		return null;		
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String operation = request.getParameter("operation");
		
		request.setAttribute("loggedUser", (User) request.getSession().getAttribute("loggedUser"));
		request.setAttribute("message", result.getMessage());

		if (operation.equals("save")) {
			if (null == result.getMessage()) {
				request.getRequestDispatcher("/pages/admin/products-list.jsp").forward(request, response);
			} else {
				request.setAttribute("invalidProduct", getEntity(request));
				request.getRequestDispatcher("/pages/admin/products-new.jsp").forward(request, response);
			}
		} else if (operation.equals("consult")) {
			List<Product> products = new ArrayList<>();
			for (DomainEntity entity : result.getEntities()) {
				products.add((Product) entity);
			}
			request.setAttribute("products", products);

			request.getRequestDispatcher("/pages/admin/products-list.jsp").forward(request, response);
		} else if (operation.equals("update")) {
			if (null == result.getMessage()) {
				request.getRequestDispatcher("/pages/admin/products-list.jsp").forward(request, response);
			} else {
				request.setAttribute("invalidProduct", getEntity(request));
				request.getRequestDispatcher("/pages/admin/products-new.jsp").forward(request, response);
			}
		} else if (operation.equals("remove")) {
			request.getRequestDispatcher("/pages/admin/products-list.jsp").forward(request, response);
		}
	}

}
