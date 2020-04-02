package br.com.solstice.notecommerce.dao;

import java.util.List;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;

public interface IDAO {

	public int save(DomainEntity entity);

	public void remove(DomainEntity entity);

	public void update(DomainEntity entity);

	public List<DomainEntity> consult(DomainEntity entity, String operation);

}
