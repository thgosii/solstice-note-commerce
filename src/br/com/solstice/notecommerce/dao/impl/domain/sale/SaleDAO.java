package br.com.solstice.notecommerce.dao.impl.domain.sale;

import java.util.List;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.entity.Entity;

public class SaleDAO extends AbstractDAO {

	public SaleDAO() {
		super("sales", "sal_id");
	}

	@Override
	public int save(Entity entity) {
		return 0;
	}

	@Override
	public void remove(Entity entity) {
		
	}

	@Override
	public void update(Entity entity) {
		
	}

	@Override
	public List<Entity> consult(Entity entity, String operation) {
		return null;
	}

}
