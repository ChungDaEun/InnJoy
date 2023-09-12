package com.web.innjoy.model;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="PRO_TYPE_ID")
public class Pro_Type_Id {
	
	@Id
	@Column(name="PRO_TYPE_ID", unique = true)
	private int proTypeId;
	
	@Column(name="PRO_TYPE")
	private String proType;
	
	@OneToMany(mappedBy = "proTypeId")		//  one product type, many products
	private List<Product> product;
	
	public Pro_Type_Id() {}

	public Pro_Type_Id(int proTypeId, String proType, List<Product> product) {
		this.proTypeId = proTypeId;
		this.proType = proType;
		this.product = product;
	}

	public int getProTypeId() {
		return proTypeId;
	}

	public void setProTypeId(int proTypeId) {
		this.proTypeId = proTypeId;
	}

	public String getProType() {
		return proType;
	}

	public void setProType(String proType) {
		this.proType = proType;
	}

	public List<Product> getProduct() {
		return product;
	}

	public void setProduct(List<Product> product) {
		this.product = product;
	}

}
