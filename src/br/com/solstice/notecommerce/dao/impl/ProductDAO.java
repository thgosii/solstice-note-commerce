package br.com.solstice.notecommerce.dao.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.nio.file.CopyOption;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.util.http.fileupload.IOUtils;

import br.com.solstice.notecommerce.dao.AbstractDAO;
import br.com.solstice.notecommerce.domain.DomainEntity;
import br.com.solstice.notecommerce.domain.product.Product;
import br.com.solstice.notecommerce.domain.product.brand.Brand;
import br.com.solstice.notecommerce.domain.product.file.ProductFile;
import br.com.solstice.notecommerce.domain.user.User;
import br.com.solstice.notecommerce.domain.user.customer.Customer;
import br.com.solstice.notecommerce.domain.user.customer.Gender;

public class ProductDAO extends AbstractDAO {
	
	public ProductDAO() {
		super("products", "prd_id");
	}

	public ProductDAO(String table, String idtable) {
		super(table, idtable);
	}

	@Override
	public int save(DomainEntity entity, String operation) {
		openConnection();
		PreparedStatement pstm = null;

		Product product = (Product) entity;

		String sql = "INSERT INTO `notecommerce_db`.`products` "
				+ "(`prd_title`, `prd_image_url`, `prd_price`, `prd_description`, `prd_brd_id`, `prd_processor`, `prd_graphics_card`, `prd_ram`, `prd_monitor`, `prd_hd`, `prd_ssd`, `prd_so`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			pstm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			pstm.setString(1, product.getTitle());
			pstm.setString(2, product.getImage().getUrl());
			pstm.setDouble(3, product.getPrice());
			pstm.setString(4, product.getDescription());
			pstm.setLong(5, product.getBrand().getId());
			pstm.setString(6, product.getProcessor());
			pstm.setString(7, product.getGraphicsCard());
			pstm.setInt(8, product.getRam());
			pstm.setString(9, product.getMonitor());
			pstm.setInt(10, product.getHd());
			pstm.setInt(11, product.getSsd());
			pstm.setString(12, product.getOs());
			
			System.out.println("pstm: " + pstm.toString());

			pstm.execute();

			ResultSet rs = pstm.getGeneratedKeys();

			int idProduct = 0;

			if (rs.next()) {
				idProduct = rs.getInt(1);
			}

			return idProduct;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstm != null) {
				try {
					pstm.close();
				} catch (SQLException e) {
				}
			}
			if (connection != null) {
				try {
					System.out.println("Closing connection from " + this.getClass().getSimpleName());
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	
		saveOrOverwriteFile(product.getImage());
		
		return 0;
	}

	@Override
	public void remove(DomainEntity entity, String operation) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(DomainEntity entity, String operation) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<DomainEntity> consult(DomainEntity entity, String operation) {
		openConnection();

		PreparedStatement pstm = null;
		ResultSet rs = null;

		Product product = (Product) entity;

		String sql = "";

		if (operation.equals("consult")) {
			sql = "SELECT * from " + table + " WHERE prd_deleted = false";
		} else if (operation.equals("findById")) {
			sql = "SELECT * from " + table + " WHERE " + idTable + " = ? AND prd_deleted = false";
		}
		
		List<DomainEntity> products = new ArrayList<DomainEntity>();

		try {
			pstm = connection.prepareStatement(sql);

			if (operation.equals("consult")) {
			} else if (operation.equals("findById")) {
				pstm.setLong(1, product.getId());
			}
			
			System.out.println("pstm: " + pstm.toString());
			
			rs = pstm.executeQuery();

			BrandDAO brandDAO = new BrandDAO();

			while (rs.next()) {
				Product currentProduct = new Product();
				currentProduct.setId(rs.getLong(idTable));
				currentProduct.setTitle(rs.getString("prd_title"));
				
				ProductFile productFile = new ProductFile();
				productFile.setUrl(rs.getString("prd_image_url"));
				currentProduct.setImage(productFile);
				
				currentProduct.setPrice(rs.getDouble("prd_price"));
				currentProduct.setDescription(rs.getString("prd_description"));
				
				Brand brand = new Brand();
				brand.setId(rs.getLong("prd_brd_id"));
				brand = (Brand) brandDAO.consult(brand, "findById").get(0);
				currentProduct.setBrand(brand);
				
				currentProduct.setProcessor(rs.getString("prd_processor"));
				currentProduct.setGraphicsCard(rs.getString("prd_graphics_card"));
				currentProduct.setRam(rs.getInt("prd_ram"));
				currentProduct.setMonitor(rs.getString("prd_monitor"));
				currentProduct.setHd(rs.getInt("prd_hd"));
				currentProduct.setSsd(rs.getInt("prd_ssd"));
				currentProduct.setOs(rs.getString("prd_os"));

				products.add(currentProduct);
			}

			return products;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstm != null) {
				try {
					pstm.close();
				} catch (SQLException e) {
				}
			}
			if (connection != null) {
				try {
					System.out.println("Closing connection from " + this.getClass().getSimpleName());
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
		
		return null;
	}
	
	private void saveOrOverwriteFile(ProductFile productFile) {
		if (null == productFile.getFilePathInProject()) {
			System.out.println("no file path to save product file");
			return;
		}
		
		try {
    	    File targetFile = new File(productFile.getFilePathInProject());
    	    OutputStream outStream = new FileOutputStream(targetFile);
    	 
    	    byte[] buffer = new byte[8 * 1024];
    	    int bytesRead;
    	    while ((bytesRead = productFile.getFileContent().read(buffer)) != -1) {
    	        outStream.write(buffer, 0, bytesRead);
    	    }
    	    IOUtils.closeQuietly(productFile.getFileContent());
    	    IOUtils.closeQuietly(outStream);
    	    
    	    System.out.println("file " + productFile.getFilePathInProject() + " saved");
		} catch (Exception e)  {
			e.printStackTrace();
		}
	}

}
