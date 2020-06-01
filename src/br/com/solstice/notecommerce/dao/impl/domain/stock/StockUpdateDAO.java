package br.com.solstice.notecommerce.dao.impl.domain.stock;

import java.sql.Connection;
import java.util.List;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.entity.Entity;

public class StockUpdateDAO extends AbstractDAO {
	
	public StockUpdateDAO() {
		super();
	}

	public StockUpdateDAO(Connection connection) {
		super(connection);
	}

	@Override
	public long save(Entity entity) {
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
		return null;
	}

}
