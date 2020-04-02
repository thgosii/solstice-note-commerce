package br.com.solstice.notecommerce.controller.viewhelper.impl.domain.product;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.solstice.notecommerce.controller.viewhelper.IViewHelper;
import br.com.solstice.notecommerce.entity.Entity;
import br.com.solstice.notecommerce.entity.Result;
import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.product.Product;
import br.com.solstice.notecommerce.entity.domain.product.brand.Brand;
import br.com.solstice.notecommerce.entity.domain.product.file.ProductFile;
import br.com.solstice.notecommerce.entity.domain.user.User;

public class ProductVH implements IViewHelper {

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
				String title = request.getParameter("title");
				
				double price = -1d;
				if (null != request.getParameter("price")) {
					try {
						price = Double.parseDouble(request.getParameter("price"));
					} catch (Exception ex) {
					}
				}
				
				String imageUrl = null;
//				InputStream imageFileContent = null;
//				try {
//					Part imageFilePart = request.getPart("image");
//					System.out.println(imageFilePart);
//					
//					if (imageFilePart != null) {
//						System.out.println("size:" + imageFileContent.available());
//						imageFileContent = imageFilePart.getInputStream();
//						String fileName = Paths.get(imageFilePart.getSubmittedFileName()).getFileName().toString();
//						imageUrl = ProductFile.generateUrl(fileName);
//					}
//				} catch (Exception ex) {
//				}
				imageUrl = request.getParameter("imageBase64");

				String description = request.getParameter("description");
				
				long brandId = -1;
				if (null != request.getParameter("brand")) {
					try {
						brandId = Long.parseLong(request.getParameter("brand"));
					} catch (Exception ex) {
					}
				}

				String processor = request.getParameter("processor");

				String graphicsCard = request.getParameter("graphics_card");

				int ram = -1;
				if (null != request.getParameter("ram")) {
					try {
						ram = Integer.parseInt(request.getParameter("ram"));
					} catch (Exception ex) {
					}
				}

				String monitor = request.getParameter("monitor");

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
						ssd = Integer.parseInt(request.getParameter("ssd-capacity"));
					} catch (Exception ex) {
					}
				}

				String os = request.getParameter("os");

				Brand brand = new Brand();
				brand.setId(brandId);
				ProductFile image = new ProductFile();
//				image.setFileContent(imageFileContent);
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
				
				return product;
			} else if (operation.equals("update")) {
				long productId = -1L;
				if (null != request.getParameter("id")) {
					try {
						productId = Long.parseLong(request.getParameter("id"));
					} catch (Exception ex) {
					}
				}
				
				String title = request.getParameter("title");
				
				double price = -1d;
				if (null != request.getParameter("price")) {
					try {
						price = Double.parseDouble(request.getParameter("price"));
					} catch (Exception ex) {
					}
				}
				
				String imageUrl = null;
//				InputStream imageFileContent = null;
//				try {
//					Part imageFilePart = request.getPart("image");
//					System.out.println(imageFilePart);
//					
//					if (imageFilePart != null) {
//						System.out.println("size:" + imageFileContent.available());
//						imageFileContent = imageFilePart.getInputStream();
//						String fileName = Paths.get(imageFilePart.getSubmittedFileName()).getFileName().toString();
//						imageUrl = ProductFile.generateUrl(fileName);
//					}
//				} catch (Exception ex) {
//				}
				imageUrl = request.getParameter("imageBase64");

				String description = request.getParameter("description");
				
				long brandId = -1;
				if (null != request.getParameter("brand")) {
					try {
						brandId = Long.parseLong(request.getParameter("brand"));
					} catch (Exception ex) {
					}
				}

				String processor = request.getParameter("processor");

				String graphicsCard = request.getParameter("graphics_card");

				int ram = -1;
				if (null != request.getParameter("ram")) {
					try {
						ram = Integer.parseInt(request.getParameter("ram"));
					} catch (Exception ex) {
					}
				}

				String monitor = request.getParameter("monitor");

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
						ssd = Integer.parseInt(request.getParameter("ssd-capacity"));
					} catch (Exception ex) {
					}
				}

				String os = request.getParameter("os");

				Brand brand = new Brand();
				brand.setId(brandId);
				ProductFile image = new ProductFile();
//				image.setFileContent(imageFileContent);
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
				
				product.setId(productId);
				
				return product;
			} else if (operation.equals("remove")) {
				long productId = -1L;
				if (null != request.getParameter("id")) {
					try {
						productId = Long.parseLong(request.getParameter("id"));
					} catch (Exception ex) {
					}
				}
				
				Product product = new Product();
				product.setId(productId);
				
				return product;
			} else if (operation.equals("consult")) {
				long productId = -1L;
				if (null != request.getParameter("id")) {
					try {
						productId = Long.parseLong(request.getParameter("id"));
					} catch (Exception ex) {
					}
				}
				
				Product product = new Product();
				product.setId(productId);
				
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
				response.sendRedirect("/note-commerce/admin/products?operation=consult");
			} else {
				request.setAttribute("previousProduct", getEntity(request));
				request.getRequestDispatcher("/pages/admin/products-new.jsp").forward(request, response);
			}
		} else if (operation.equals("consult")) {
			if (((DomainEntity) getEntity(request)).getId() != -1L) {
				request.setAttribute("previousProduct", result.getEntities().get(0));
				request.getRequestDispatcher("/pages/admin/products-new.jsp").forward(request, response);
			} else {
				List<Product> products = new ArrayList<>();
				for (Entity entity : result.getEntities()) {
					products.add((Product) entity);
				}
				request.setAttribute("products", products);
				request.getRequestDispatcher("/pages/admin/products-list.jsp").forward(request, response);
			}
		} else if (operation.equals("update")) {
			if (null == result.getMessage()) {
				response.sendRedirect("/note-commerce/admin/products?operation=consult");
			} else {
				request.setAttribute("previousProduct", getEntity(request));
				request.getRequestDispatcher("/pages/admin/products-new.jsp").forward(request, response);
			}
		} else if (operation.equals("remove")) {
			response.sendRedirect("/note-commerce/admin/products?operation=consult");
		}
	}

}
