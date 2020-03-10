package br.com.solstice.notecommerce.domain.product.file;

import java.io.InputStream;
import java.util.UUID;

public class ProductFile {
	
	private InputStream fileContent; // For upload and save file only
	private String url;              // For use in JSP

	public static String generateUrl(String fileName) {
		String url = "/note-commerce/static/images/";
		String[] fileNameParts = fileName.split("\\.");
		String uuid = UUID.randomUUID().toString().replace("-", "");
		
		if (fileNameParts.length > 1) {
			url += uuid + "." + fileNameParts[1];
		} else {
			url += uuid + ".unknown";
		}
		return url;
	}
	
	public String getFilePathInProject() {
		if (url == null)
			return null;
		// from: /note-commerce/static/images/...
		// to:   WebContent/static/images/...
		return url.replaceAll("/note-commerce", "WebContent");
	}
	
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
