package com.bit2015.omu.vo;

public class ProductVo {
	
	private long product_no;
	private long content_no;
	private String productName;
	private String productPrice;
	public long getProduct_no() {
		return product_no;
	}
	public void setProduct_no(long product_no) {
		this.product_no = product_no;
	}
	public long getContent_no() {
		return content_no;
	}
	public void setContent_no(long content_no) {
		this.content_no = content_no;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	@Override
	public String toString() {
		return "ProductVo [product_no=" + product_no + ", content_no="
				+ content_no + ", productName=" + productName
				+ ", productPrice=" + productPrice + "]";
	}
	
	
}
