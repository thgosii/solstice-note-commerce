package br.com.solstice.notecommerce.entity.domain.shop.sale;

public enum SaleStatus {

	PAYMENT_APPROVED,	// Customer just confirmed sale, payment validated and approved
	ON_DELIVERY,		// Admin confirmed start of delivery of sale products
	DELIVERED			// Admin confirmed that products were delivered, no more actions

}
