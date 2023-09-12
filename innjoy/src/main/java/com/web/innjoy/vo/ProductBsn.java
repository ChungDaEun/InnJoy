package com.web.innjoy.vo;

public class ProductBsn {
	private Product product;
	private Bsn_user bsn_user;
	public ProductBsn() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductBsn(Product product, Bsn_user bsn_user) {
		super();
		this.product = product;
		this.bsn_user = bsn_user;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Bsn_user getBsn_user() {
		return bsn_user;
	}
	public void setBsn_user(Bsn_user bsn_user) {
		this.bsn_user = bsn_user;
	}
	

}
