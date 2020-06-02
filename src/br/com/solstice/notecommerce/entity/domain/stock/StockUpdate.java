package br.com.solstice.notecommerce.entity.domain.stock;

import java.time.LocalDateTime;

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
public class StockUpdate extends DomainEntity {
	
	private Stock stock;
	private Integer quantity;
	private LocalDateTime date;

	public StockUpdate(Long id) {
		super(id);
	}

}
