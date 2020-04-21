package br.com.solstice.notecommerce.entity.domain;

import br.com.solstice.notecommerce.entity.Entity;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
//@ToString(of = "id")
public class DomainEntity extends Entity {

	private Long id;
	private transient boolean deleted;
	
	public DomainEntity(Long id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "(id=" + id + ")";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DomainEntity other = (DomainEntity) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
