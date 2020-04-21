package br.com.solstice.notecommerce.entity.domain.product;

import br.com.solstice.notecommerce.entity.domain.DomainEntity;
import br.com.solstice.notecommerce.entity.domain.product.brand.Brand;
import br.com.solstice.notecommerce.entity.domain.product.file.ProductFile;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Product extends DomainEntity {

	private String title;
	private ProductFile image;
	private double price;
	private transient String description;
	private Brand brand;
	private String processor;
	private String graphicsCard;
	private int ram;
	private String monitor;
	private int hd;
	private int ssd;
	private String os;


	@Override
	public String toString() {
		return "Product [title=" + (title != null ? (title.length() > 20 ? title.substring(0, 20) + "..." : title) : title) + ", image=" + image + ", price=" + price + ", description=" + (description != null ? (description.length() > 20 ? description.substring(0, 20) + "..." : description) : description)
				+ ", brand=" + brand + ", processor=" + processor + ", graphicsCard=" + graphicsCard + ", ram=" + ram
				+ ", monitor=" + monitor + ", hd=" + hd + ", ssd=" + ssd + ", os=" + os + ", getId()=" + getId() + "]";
	}

}
