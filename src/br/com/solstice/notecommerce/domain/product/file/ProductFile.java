package br.com.solstice.notecommerce.domain.product.file;

import java.io.File;

public class ProductFile {
	
	private File file;
	private String url;

	public File getFile() {
		return file;
	}
	
	public void setFile(File file) {
		this.file = file;
	}
	
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}

}
