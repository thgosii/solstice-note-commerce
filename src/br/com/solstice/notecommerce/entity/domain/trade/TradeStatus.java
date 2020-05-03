package br.com.solstice.notecommerce.entity.domain.trade;

public enum TradeStatus {
	
	AWAITING_AUTHORIZATION, // Trade requested by customer, waiting authorization
	DENIED,					// Trade denied by admin, no more actions
	AUTHORIZED,			    // Trade authorized by admin, now waiting for product to arrive
	PRODUCT_RECEIVED,		// Trade items were received by the store from the client. (Devolution only: balance updated, no more actions)
	REPLACEMENT_ON_DELIVERY,// (Exchange only): Replacement products are being delivered
	REPLACEMENT_DELIVERED   // (Exchange only): Replacement products were delivered (or balanced updated if there is no stock)
	
}
