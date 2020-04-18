package br.com.solstice.notecommerce.controller.strategy;

import java.util.ArrayList;
import java.util.List;

public abstract class AbstractStrategy implements IStrategy {

	// Business rules that need to be already validated for this business rule to process
	private final List<String> requiredBussinessRules;

	public AbstractStrategy(List<String> requiredBussinessRules) {
		this.requiredBussinessRules = requiredBussinessRules;
	}
	
	public boolean canBeProcessed(ArrayList<String> validBussinessRules) {
		for (String requiredBusinessRuleName : requiredBussinessRules) {
			if (!validBussinessRules.contains(requiredBusinessRuleName)) {
				return false;
			}
		}
		return true;
	}

}
