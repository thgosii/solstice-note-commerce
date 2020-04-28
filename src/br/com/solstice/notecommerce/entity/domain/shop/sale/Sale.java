package br.com.solstice.notecommerce.entity.domain.shop.sale;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;
import br.com.solstice.notecommerce.entity.domain.user.customer.address.Address;
import br.com.solstice.notecommerce.entity.domain.user.customer.credit_card.CreditCard;
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
public class Sale extends DomainEntity {

	private double balanceUsage;
	private CreditCard creditCard;
	private Address address;
	private Customer customer;
	private List<SaleItem> items;
	private LocalDateTime dateTime;
	private SaleStatus status;
	private String identifyNumber;

	public static String generateIdentifyNumber(Long userId) {
		String millis = String.valueOf(System.currentTimeMillis());
		String invertedMillis = "";

		for (int i = millis.length() - 1; i >= 0; i--) {
			invertedMillis += millis.charAt(i);
		}

		return userId + "" + invertedMillis;
	}

	public double getTotal() {
		double total = 0;

		for (SaleItem item : items) {
			total += item.getSubTotal();
		}

		return total;
	}

	public String getFormattedDateTime() {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy hh:mm");
		return formatter.format(dateTime);
	}

	public String getFormattedStatus() {
		switch (status) {
			case DELIVERED:
				return "Entregue";
			case ON_DELIVERY:
				return "Entrega em andamento";
			case PAYMENT_APPROVED:
				return "Pagamento aprovado";
		}

		return "";
	}

	public String getStatusColorName() {
		switch (status) {
			case DELIVERED:
				return "bg-success";
			case ON_DELIVERY:
				return "bg-warning";
			case PAYMENT_APPROVED:
				return "bg-primary";
		}

		return "";
	}
	
	public double getCreditCardUsage() {
		return getTotal() - balanceUsage;
	}

}
