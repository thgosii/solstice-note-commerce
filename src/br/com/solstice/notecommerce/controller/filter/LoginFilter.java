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

@WebFilter({ "/pages/login.jsp" })
public class LoginFilter implements Filter {

	public void init(FilterConfig fConfig) throws ServletException {
	}
	
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		User loggedUser = (User) request.getSession().getAttribute("loggedUser");

		// Redirects to main page if already logged in
		if (null != loggedUser) {
			System.out.println("LoginFilter: Already logged in as " + loggedUser.getRole() + ", redirecting...");
			if (loggedUser.getRole() == UserRole.CLIENT) {
				response.sendRedirect("/note-commerce/pages/shop/products.jsp");
			} else if (loggedUser.getRole() == UserRole.ADMIN) {
				response.sendRedirect("/note-commerce/pages/admin/dashboard.jsp");
			}
			return;
		}
		
		chain.doFilter(request, response);
	}
	
	public void destroy() {
	}

}
