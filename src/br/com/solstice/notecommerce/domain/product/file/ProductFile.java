package br.com.solstice.notecommerce.domain.product.file;

import java.io.InputStream;

public class ProductFile {
	
	private InputStream fileContent;
	private String url;

	public InputStream getFileContent() {
		return fileContent;
	}
	
	public void setFileContent(InputStream fileContent) {
		this.fileContent = fileContent;
	}
	
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}

}
