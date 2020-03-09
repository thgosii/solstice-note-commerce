package br.com.solstice.notecommerce.domain.product.file;

import java.io.InputStream;

public class ProductFile {
	
	private InputStream fileContent; // For upload and save file only
	private String url;              // For use in JSP

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

	@Override
	public String toString() {
		return "ProductFile [fileContent=" + fileContent + ", url=" + url + "]";
	}

}
