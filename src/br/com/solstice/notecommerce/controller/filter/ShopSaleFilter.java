package br.com.solstice.notecommerce.controller.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.solstice.notecommerce.entity.domain.user.User;
import br.com.solstice.notecommerce.entity.domain.user.UserRole;

@WebFilter({ 
	"/pages/shop/checkout-step-1.jsp", 
	"/pages/shop/checkout-step-2.jsp", 
	"/pages/shop/checkout-step-3.jsp", 
	"/pages/shop/checkout-step-finish.jsp"
})
public class ShopSaleFilter implements Filter {
	
	public void init(FilterConfig fConfig) throws ServletException {
	}
	
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		User loggedUser = (User) request.getSession().getAttribute("loggedUser");
		
		// Redirects to login if not-logged-in or not client user tries to start a sale checkout
		if (null == loggedUser || loggedUser.getRole() != UserRole.CLIENT) {
			System.out.println("ShopSaleFilter: "
					+ (loggedUser != null ? loggedUser.getRole() + " (" + loggedUser.getEmail() + ")"
							: "not logged-in user")
					+ " tried to start sale checkout (\"" + request.getRequestURI().substring(request.getContextPath().length()) + "\"), redirecting...");
			response.sendRedirect("/note-commerce/pages/login.jsp?redirect=" + request.getRequestURI());
			return;
		}
		
		chain.doFilter(request, response);
	}
	
	public void destroy() {
	}

}
