package br.com.solstice.notecommerce.controller.strategy;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;

public abstract class AbstractStrategy implements IStrategy {

	// Business rules that need to be already validated for this business rule to process
	private final List<String> requiredBussinessRules;

	public AbstractStrategy(List<String> requiredBussinessRules) {
		this.requiredBussinessRules = requiredBussinessRules;
	}
	
	public boolean canBeProcessed(ArrayList<String> validatedBussinessRules) {
		// True if all required BRs are already validated, false otherwise
		for (String requiredBusinessRuleName : requiredBussinessRules) {
			if (!validatedBussinessRules.contains(requiredBusinessRuleName)) {
				return false;
			}
		}
		return true;
	}

}
