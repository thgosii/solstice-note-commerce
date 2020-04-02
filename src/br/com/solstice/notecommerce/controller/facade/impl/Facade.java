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
import br.com.solstice.notecommerce.controller.strategy.impl.customer.ValidateExistsEmail;
import br.com.solstice.notecommerce.controller.strategy.impl.customer.ValidatePasswordStrength;
import br.com.solstice.notecommerce.controller.strategy.impl.customer.address.ValidateAddressData;
import br.com.solstice.notecommerce.controller.strategy.impl.customer.credit_card.ValidateCreditCardData;
import br.com.solstice.notecommerce.controller.strategy.impl.product.ValidateBrand;
import br.com.solstice.notecommerce.controller.strategy.impl.product.ValidateProductSave;
import br.com.solstice.notecommerce.controller.strategy.impl.product.ValidateProductUpdate;
import br.com.solstice.notecommerce.controller.strategy.impl.product.ValidateStorage;
import br.com.solstice.notecommerce.dao.IDAO;
import br.com.solstice.notecommerce.dao.impl.product.BrandDAO;
import br.com.solstice.notecommerce.dao.impl.product.ProductDAO;
import br.com.solstice.notecommerce.dao.impl.user.UserDAO;
import br.com.solstice.notecommerce.dao.impl.user.customer.AddressDAO;
import br.com.solstice.notecommerce.dao.impl.user.customer.CreditCardDAO;
import br.com.solstice.notecommerce.dao.impl.user.customer.CustomerDAO;
import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.Result;
import br.com.solstice.notecommerce.entity.domain.product.Product;
import br.com.solstice.notecommerce.entity.domain.product.brand.Brand;
import br.com.solstice.notecommerce.entity.domain.user.User;
import br.com.solstice.notecommerce.entity.domain.user.customer.Customer;
import br.com.solstice.notecommerce.entity.domain.user.customer.address.Address;
import br.com.solstice.notecommerce.entity.domain.user.customer.credit_card.CreditCard;

public class Facade implements IFacade {

	private Map<String, Map<String, List<IStrategy>>> businessRulesMap;
	private Map<String, IDAO> daosMap;

	private Result result;

	private StringBuilder stringBuilder;

	public Facade() {
		stringBuilder = new StringBuilder();

		daosMap = new HashMap<String, IDAO>();

		businessRulesMap = new HashMap<String, Map<String, List<IStrategy>>>();

		/*
		 * Admin
		 */

		// Products
		daosMap.put(Product.class.getName(), new ProductDAO());
		Map<String, List<IStrategy>> productBusinessRulesMap = new HashMap<String, List<IStrategy>>();

		List<IStrategy> productBusinessRulesSave = new ArrayList<IStrategy>();
		productBusinessRulesSave.add(new ValidateProductSave());
		productBusinessRulesSave.add(new ValidateBrand());
		productBusinessRulesSave.add(new ValidateStorage());

		List<IStrategy> productBusinessRulesUpdate = new ArrayList<IStrategy>();
		productBusinessRulesUpdate.add(new ValidateProductUpdate());
		productBusinessRulesUpdate.add(new ValidateBrand());
		productBusinessRulesUpdate.add(new ValidateStorage());

		productBusinessRulesMap.put("save", productBusinessRulesSave);
		productBusinessRulesMap.put("update", productBusinessRulesUpdate);

		businessRulesMap.put(Product.class.getName(), productBusinessRulesMap);

		// Brands
		daosMap.put(Brand.class.getName(), new BrandDAO());
		
		// Stock

		/*
		 * Customer
		 */

		// Customer
		daosMap.put(Customer.class.getName(), new CustomerDAO());
		Map<String, List<IStrategy>> customerBusinessRulesMap = new HashMap<String, List<IStrategy>>();

		List<IStrategy> customerBusinessRulesSave = new ArrayList<IStrategy>();
		customerBusinessRulesSave.add(new ValidateCustomerDataSignup());
		customerBusinessRulesSave.add(new ValidateConfirmPassword());
		customerBusinessRulesSave.add(new ValidateCPF());
		customerBusinessRulesSave.add(new ValidateDateOfBirth());
		customerBusinessRulesSave.add(new ValidateEmail());
		customerBusinessRulesSave.add(new ValidatePasswordStrength());
		customerBusinessRulesSave.add(new ValidateExistsEmail());

		List<IStrategy> customerBusinessRulesUpdate = new ArrayList<IStrategy>();
		customerBusinessRulesUpdate.add(new ValidateCustomerDataUpdate());
		customerBusinessRulesUpdate.add(new ValidateDateOfBirth());
		customerBusinessRulesUpdate.add(new ValidateConfirmPassword());
		customerBusinessRulesUpdate.add(new ValidatePasswordStrength());

		customerBusinessRulesMap.put("save", customerBusinessRulesSave);
		customerBusinessRulesMap.put("update", customerBusinessRulesUpdate);

		businessRulesMap.put(Customer.class.getName(), customerBusinessRulesMap);

		// Address
		daosMap.put(Address.class.getName(), new AddressDAO());
		Map<String, List<IStrategy>> addressBusinessRulesMap = new HashMap<String, List<IStrategy>>();
		
		List<IStrategy> addressBusinessRulesSave = new ArrayList<IStrategy>();
		addressBusinessRulesSave.add(new ValidateAddressData());
		
		List<IStrategy> addressBusinessRulesUpdate = new ArrayList<IStrategy>();
		addressBusinessRulesUpdate.add(new ValidateAddressData());
		
		addressBusinessRulesMap.put("save", addressBusinessRulesSave);
		addressBusinessRulesMap.put("update", addressBusinessRulesUpdate);
		
		businessRulesMap.put(Address.class.getName(), addressBusinessRulesMap);
		
		
		// Credit Card
		
		daosMap.put(CreditCard.class.getName(), new CreditCardDAO());
		Map<String, List<IStrategy>> creditCardBusinessRulesMap = new HashMap<String, List<IStrategy>>();
		
		List<IStrategy> creditCardBusinessRulesSave = new ArrayList<IStrategy>();
		creditCardBusinessRulesSave.add(new ValidateCreditCardData());
		
		List<IStrategy> creditCardBusinessRulesUpdate = new ArrayList<IStrategy>();
		creditCardBusinessRulesUpdate.add(new ValidateCreditCardData());
		
		creditCardBusinessRulesMap.put("save", creditCardBusinessRulesSave);
		creditCardBusinessRulesMap.put("update", creditCardBusinessRulesUpdate);
		
		businessRulesMap.put(CreditCard.class.getName(), creditCardBusinessRulesMap);
		
		/*
		 * Shop
		 */

		daosMap.put(User.class.getName(), new UserDAO());

	}

	public void processBusinessRules(List<IStrategy> businessRules, DomainEntity entity) {
		stringBuilder = new StringBuilder();
		for (IStrategy businessRule : businessRules) {
			System.out.println("Processing bussiness rule " + businessRule.getClass().getSimpleName());
			String message = businessRule.process(entity);

			if (message != null && !message.trim().isEmpty()) {
				System.out.println("\tmessage: " + message.replaceAll("\r", " ").replaceAll("\n", " "));
				stringBuilder.append(message + '\n');
			}
		}
	}

	@Override
	public Result save(DomainEntity entity) {
		result = new Result();
		stringBuilder.setLength(0);

		String entityName = entity.getClass().getName();

		Map<String, List<IStrategy>> businessRulesEntityMap = businessRulesMap.get(entityName);
		List<IStrategy> businessRulesSaveEntity = businessRulesEntityMap.get("save");

		processBusinessRules(businessRulesSaveEntity, entity);

		result.getEntities().add(entity);

		if (stringBuilder.length() == 0) {
			daosMap.get(entityName).save(entity);
		} else {
			result.setMessage(stringBuilder.toString());
		}

		return result;
	}

	@Override
	public Result remove(DomainEntity entity) {
		result = new Result();

		String entityName = entity.getClass().getName();

		daosMap.get(entityName).remove(entity);

		result.getEntities().add(entity);

		return result;
	}

	@Override
	public Result update(DomainEntity entity) {
		result = new Result();
		stringBuilder.setLength(0);

		String entityName = entity.getClass().getName();

		Map<String, List<IStrategy>> businessRulesEntityMap = businessRulesMap.get(entityName);
		List<IStrategy> businessRulesUpdateEntity = businessRulesEntityMap.get("update");

		processBusinessRules(businessRulesUpdateEntity, entity);

		result.getEntities().add(entity);

		if (stringBuilder.length() == 0) {
			daosMap.get(entityName).update(entity);
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
