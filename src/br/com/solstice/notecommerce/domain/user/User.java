package br.com.solstice.notecommerce.domain.user;

import br.com.solstice.notecommerce.domain.DomainEntity;

public class User extends DomainEntity {

	private String email;
	private String password;
	private String confirmPassword;
	private UserRole role;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public UserRole getRole() {
		return role;
	}

	public void setRole(UserRole role) {
		this.role = role;
	}

}