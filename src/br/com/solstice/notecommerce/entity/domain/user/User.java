package br.com.solstice.notecommerce.entity.domain.user;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class User extends DomainEntity {

	private String email;
	private transient String password;
	private String confirmPassword;
	private UserRole role;

}