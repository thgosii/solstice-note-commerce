package br.com.solstice.notecommerce.entity.application.admin.dashboard;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.google.gson.annotations.SerializedName;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BrandSale {
	
	private transient LocalDate date;
	@SerializedName("x")
	private String formattedDate;
	@SerializedName("y")
	private Long amount;
	
	public BrandSale(LocalDate date, Long amount) {
		this.date = date;
		this.amount = amount;
		this.formattedDate = date != null ? date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) : null;
	}

}
