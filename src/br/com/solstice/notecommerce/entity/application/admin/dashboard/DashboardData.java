package br.com.solstice.notecommerce.entity.application.admin.dashboard;

import java.time.LocalDate;

import br.com.solstice.notecommerce.entity.application.ApplicationEntity;

public class DashboardData extends ApplicationEntity {
	
	private LocalDate minDate;
	private LocalDate maxDate;
	private BrandSaleGraph brandSaleGraph;
	private RegionSaleMap regionSaleMap;
	private MostSoldProductsTable mostSoldProductsTable;
	private MostTradedProductsTable mostTradedProductsTable;
	
	public DashboardData() {
	}
	
	public DashboardData(LocalDate minDate, LocalDate maxDate) {
		this.minDate = minDate;
		this.maxDate = maxDate;
	}
	
	public LocalDate getMinDate() {
		return minDate;
	}

	public void setMinDate(LocalDate minDate) {
		this.minDate = minDate;
	}

	public LocalDate getMaxDate() {
		return maxDate;
	}

	public void setMaxDate(LocalDate maxDate) {
		this.maxDate = maxDate;
	}

	public BrandSaleGraph getBrandSaleGraph() {
		return brandSaleGraph;
	}

	public void setBrandSaleGraph(BrandSaleGraph brandSaleGraph) {
		this.brandSaleGraph = brandSaleGraph;
	}

	public RegionSaleMap getRegionSaleMap() {
		return regionSaleMap;
	}

	public void setRegionSaleMap(RegionSaleMap regionSaleMap) {
		this.regionSaleMap = regionSaleMap;
	}

	public MostSoldProductsTable getMostSoldProductsTable() {
		return mostSoldProductsTable;
	}

	public void setMostSoldProductsTable(MostSoldProductsTable mostSoldProductsTable) {
		this.mostSoldProductsTable = mostSoldProductsTable;
	}

	public MostTradedProductsTable getMostTradedProductsTable() {
		return mostTradedProductsTable;
	}

	public void setMostTradedProductsTable(MostTradedProductsTable mostTradedProductsTable) {
		this.mostTradedProductsTable = mostTradedProductsTable;
	}

}
