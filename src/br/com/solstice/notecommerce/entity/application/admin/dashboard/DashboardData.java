package br.com.solstice.notecommerce.entity.application.admin.dashboard;

import java.time.LocalDate;

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
	private BrandSaleGraph brandSaleGraph;
	private RegionSaleMap regionSaleMap;
	private MostSoldProductsTable mostSoldProductsTable;
	private MostTradedProductsTable mostTradedProductsTable;
	
	public DashboardData(LocalDate minDate, LocalDate maxDate) {
		this.minDate = minDate;
		this.maxDate = maxDate;
	}

}
