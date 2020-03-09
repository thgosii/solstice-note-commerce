package br.com.solstice.notecommerce.controller.facade.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import br.com.solstice.notecommerce.controller.facade.IFacade;
import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.controller.strategy.impl.customer.ValidateCPF;
import br.com.solstice.notecommerce.controller.strategy.impl.customer.ValidateConfirmPassword;
import br.com.solstice.notecommerce.controller.strategy.impl.customer.ValidateCustomerDataSignup;
import br.com.solstice.notecommerce.controller.strategy.impl.customer.ValidateCustomerDataUpdate;
import br.com.solstice.notecommerce.controller.strategy.impl.customer.ValidateDateOfBirth;
import br.com.solstice.notecommerce.controller.strategy.impl.customer.ValidateEmail;
import br.com.solstice.notecommerce.dao.IDAO;
import br.com.solstice.notecommerce.dao.impl.CustomerDAO;
import br.com.solstice.notecommerce.dao.impl.UserDAO;
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.Result;
import br.com.solstice.notecommerce.domain.user.User;
import br.com.solstice.notecommerce.domain.user.customer.Customer;

public class Facade implements IFacade {

	private Map<String, Map<String, List<IStrategy>>> businessRulesMap;
	private Map<String, IDAO> daosMap;

	private Result result;

	private StringBuilder stringBuilder;

	public Facade() {
		stringBuilder = new StringBuilder();

		daosMap = new HashMap<String, IDAO>();
		daosMap.put(Customer.class.getName(), new CustomerDAO());
		daosMap.put(User.class.getName(), new UserDAO());

		businessRulesMap = new HashMap<String, Map<String, List<IStrategy>>>();

		Map<String, List<IStrategy>> customerBusinessRulesMap = new HashMap<String, List<IStrategy>>();

		List<IStrategy> customerBusinessRulesSave = new ArrayList<IStrategy>();
		customerBusinessRulesSave.add(new ValidateCustomerDataSignup());
		customerBusinessRulesSave.add(new ValidateConfirmPassword());
		customerBusinessRulesSave.add(new ValidateCPF());
		customerBusinessRulesSave.add(new ValidateDateOfBirth());
		customerBusinessRulesSave.add(new ValidateEmail());

		List<IStrategy> customerBusinessRulesUpdate = new ArrayList<IStrategy>();
		customerBusinessRulesUpdate.add(new ValidateCustomerDataUpdate());
		customerBusinessRulesUpdate.add(new ValidateDateOfBirth());
		customerBusinessRulesUpdate.add(new ValidateConfirmPassword());

		customerBusinessRulesMap.put("save", customerBusinessRulesSave);
		customerBusinessRulesMap.put("update", customerBusinessRulesUpdate);

		businessRulesMap.put(Customer.class.getName(), customerBusinessRulesMap);
	}

	public void processBusinessRules(List<IStrategy> businessRules, DomainEntity entity) {
		stringBuilder = new StringBuilder();
		for (IStrategy businessRule : businessRules) {
			String message = businessRule.process(entity);

			if (message != null) {
				stringBuilder.append(message + '\n');
			}
		}
	}

	@Override
	public Result save(DomainEntity entity, String operation) {
		result = new Result();
		stringBuilder.setLength(0);

		String entityName = entity.getClass().getName();

		Map<String, List<IStrategy>> businessRulesEntityMap = businessRulesMap.get(entityName);
		List<IStrategy> businessRulesSaveEntity = businessRulesEntityMap.get("save");

		processBusinessRules(businessRulesSaveEntity, entity);

		result.getEntities().add(entity);

		if (stringBuilder.length() == 0) {
			daosMap.get(entityName).save(entity, operation);
		} else {
			result.setMessage(stringBuilder.toString());
		}

		return result;
	}

	@Override
	public Result remove(DomainEntity entity, String operation) {
		result = new Result();

		String entityName = entity.getClass().getName();

		daosMap.get(entityName).remove(entity, operation);

		result.getEntities().add(entity);

		return result;
	}

	@Override
	public Result update(DomainEntity entity, String operation) {
		result = new Result();
		stringBuilder.setLength(0);

		String entityName = entity.getClass().getName();

		Map<String, List<IStrategy>> businessRulesEntityMap = businessRulesMap.get(entityName);
		List<IStrategy> businessRulesUpdateEntity = businessRulesEntityMap.get("update");

		processBusinessRules(businessRulesUpdateEntity, entity);

		result.getEntities().add(entity);

		if (stringBuilder.length() == 0) {
			daosMap.get(entityName).update(entity, operation);
		} else {
			result.setMessage(stringBuilder.toString());
		}

		return result;
	}

	@Override
	public Result consult(DomainEntity entity, String operation) {
		result = new Result();

		String entityName = entity.getClass().getName();

		List<DomainEntity> consultEntities = daosMap.get(entityName).consult(entity, operation);

		result.setEntities(consultEntities);

		return result;
	}

}
