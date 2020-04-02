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

@WebFilter({ "/customer/*", "/pages/customer/*" })
public class CustomerFilter implements Filter {

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		User loggedUser = (User) request.getSession().getAttribute("loggedUser");

		// Redirects to login if admin or not logged-in user tries to access customer
		// pages
		if (null == loggedUser || loggedUser.getRole() != UserRole.CLIENT) {
			System.out.println("CustomerFilter: "
					+ (loggedUser != null ? loggedUser.getRole() + " (" + loggedUser.getEmail() + ")"
							: "not logged-in user")
					+ " tried to access customer page \"" + request.getRequestURI() + "\", redirecting...");
			response.sendRedirect("/note-commerce/pages/login.jsp");
			return;
		}

		chain.doFilter(request, response);
	}

	public void destroy() {
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

}
