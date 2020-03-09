package br.com.solstice.notecommerce.domain.product;

import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.product.brand.Brand;
import br.com.solstice.notecommerce.domain.product.file.ProductFile;

public class Product extends DomainEntity {
	
	private String title;
	private ProductFile image;
	private double price;
	private String description;
	private Brand brand;
	private String processor;
	private String graphicsCard;
	private int ram;
	private String monitor;
	private int hd;
	private int ssd;
	private String os;

	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public ProductFile getImage() {
		return image;
	}
	
	public void setImage(ProductFile image) {
		this.image = image;
	}
	
	public double getPrice() {
		return price;
	}
	
	public void setPrice(double price) {
		this.price = price;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public Brand getBrand() {
		return brand;
	}
	
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	
	public String getProcessor() {
		return processor;
	}
	
	public void setProcessor(String processor) {
		this.processor = processor;
	}
	
	public String getGraphicsCard() {
		return graphicsCard;
	}
	
	public void setGraphicsCard(String graphicsCard) {
		this.graphicsCard = graphicsCard;
	}
	
	public int getRam() {
		return ram;
	}
	
	public void setRam(int ram) {
		this.ram = ram;
	}
	
	public String getMonitor() {
		return monitor;
	}
	
	public void setMonitor(String monitor) {
		this.monitor = monitor;
	}
	
	public int getHd() {
		return hd;
	}
	
	public void setHd(int hd) {
		this.hd = hd;
	}
	
	public int getSsd() {
		return ssd;
	}
	
	public void setSsd(int ssd) {
		this.ssd = ssd;
	}
	
	public String getOs() {
		return os;
	}
	
	public void setOs(String os) {
		this.os = os;
	}

	@Override
	public String toString() {
		return "Product [title=" + title + ", image=" + image + ", price=" + price + ", description=" + description
				+ ", brand=" + brand + ", processor=" + processor + ", graphicsCard=" + graphicsCard + ", ram=" + ram
				+ ", monitor=" + monitor + ", hd=" + hd + ", ssd=" + ssd + ", os=" + os + ", getId()=" + getId() + "]";
	}
	
	

}
