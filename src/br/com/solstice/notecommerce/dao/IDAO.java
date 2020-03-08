package br.com.solstice.notecommerce.dao;

import java.util.List;

import br.com.solstice.notecommerce.domain.DomainEntity;

public interface IDAO {

	public int save(DomainEntity entity, String operation);

	public void remove(DomainEntity entity, String operation);

	public void update(DomainEntity entity, String operation);

	public List<DomainEntity> consult(DomainEntity entity, String operation);

}
