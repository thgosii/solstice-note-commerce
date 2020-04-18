package br.com.solstice.notecommerce.entity.domain.trade;

import java.time.LocalDateTime;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.shop.sale.Sale;
import br.com.solstice.notecommerce.entity.domain.shop.sale.SaleItem;
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
public class Trade extends DomainEntity {
	
	private String trackingNumber;
	private LocalDateTime requestDate;
	private TradeStatus status;
	private Integer productQuantity;
	private SaleItem saleItem;
	private Sale sale;
	
	public static String generateTrackingNumber(Long userId) {
		long millis = System.currentTimeMillis();
		return "T-" + userId + "-" + millis;
	}
	
	public Double getBalanceReturn() {
		return saleItem.getPricePerProduct();
	}

}
