package br.com.solstice.notecommerce.entity.application.admin.dashboard;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import br.com.solstice.notecommerce.entity.application.ApplicationEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DashboardData extends ApplicationEntity {
	
	private LocalDate minDate;
	private LocalDate maxDate;
	private Map<String, BrandSale> brandSaleGraph; // Re-mapped in client
	private Map<String, RegionSale> regionSaleMap;
	private List<MostSoldProduct> mostSoldProductsTable;
	private List<MostTradedProduct> mostTradedProductsTable;
	
	public DashboardData(LocalDate minDate, LocalDate maxDate) {
		this.minDate = minDate;
		this.maxDate = maxDate;
	}

}
