package br.com.solstice.notecommerce.entity.domain.product.brand;

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
public class Brand extends DomainEntity {
	
	private String name;

}
