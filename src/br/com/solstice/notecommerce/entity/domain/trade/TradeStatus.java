package br.com.solstice.notecommerce.entity.domain.trade;

public enum TradeStatus {
	
	AWAITING_AUTHORIZATION, // Trade requested by customer, waiting authorization
	AUTHORIZED,			    // Trade authorized by admin, now waiting for product to arrive
	PRODUCT_RECIEVED		// Items were received by the store from the client, 
	
}
