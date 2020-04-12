package br.com.solstice.notecommerce.dao.impl.domain.trade;

import java.util.List;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.entity.Entity;

public class TradeDAO extends AbstractDAO {
	
	public TradeDAO() {
		super("trades", "trd_id");
	}

	public TradeDAO(String table, String idtable) {
		super(table, idtable);
	}

	@Override
	public int save(Entity entity) {
		// TODO Auto-generated method stub
		// Called when customer requests trade
		return 0;
	}

	@Override
	public void remove(Entity entity) {
	}

	@Override
	public void update(Entity entity) {
		// TODO Auto-generated method stub
		// Called when admin chooses next action
	}

	@Override
	public List<Entity> consult(Entity entity, String operation) {
		// Called in /admin and /customer to list trades in table
		// May need an application entity for customer to see status of trade with sale details (modal)
		return null;
	}

}
