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

@WebFilter({ "/admin/*", "/pages/admin/*" })
public class AdminFilter implements Filter {

	public void init(FilterConfig fConfig) throws ServletException {
	}
	
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		User loggedUser = (User) request.getSession().getAttribute("loggedUser");

		// Redirects to login if client or not logged-in user tries to access admin pages
		if (null == loggedUser || loggedUser.getRole() != UserRole.ADMIN) {
			System.out.println("AdminFilter: " + (loggedUser != null ? loggedUser.getRole() + " (" + loggedUser.getEmail() + ")" : "not logged-in user") + " tried to access admin page \"" + request.getRequestURI() + "\", redirecting...");
			response.sendRedirect("/note-commerce/pages/login.jsp");
			return;
		}
		
		chain.doFilter(request, response);
	}

	public void destroy() {
	}

}
