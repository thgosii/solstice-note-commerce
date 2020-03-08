package br.com.solstice.notecommerce.controller.facade.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import br.com.solstice.notecommerce.controller.facade.IFacade;
import br.com.solstice.notecommerce.controller.strategy.IStrategy;
import br.com.solstice.notecommerce.controller.strategy.impl.client.ValidateClientData;
import br.com.solstice.notecommerce.dao.IDAO;
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.Result;
import br.com.solstice.notecommerce.domain.client.Client;

public class Facade implements IFacade {

	private Map<String, Map<String, List<IStrategy>>> businessRulesMap;
	private Map<String, IDAO> daosMap;

	private Result result;

	private StringBuilder stringBuilder;

	public Facade() {
		stringBuilder = new StringBuilder();
		businessRulesMap = new HashMap<String, Map<String, List<IStrategy>>>();

		Map<String, List<IStrategy>> clientBusinessRulesMap = new HashMap<String, List<IStrategy>>();

		List<IStrategy> clientBusinessRulesSave = new ArrayList<IStrategy>();
		clientBusinessRulesSave.add(new ValidateClientData());

		clientBusinessRulesMap.put("save", clientBusinessRulesSave);

		businessRulesMap.put(Client.class.getName(), clientBusinessRulesMap);
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
			// daosMap.get(entityName).save(entity);
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
