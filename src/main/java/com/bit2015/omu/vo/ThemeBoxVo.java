package com.bit2015.omu.vo;

public class ThemeBoxVo {

	private long menuBox_no;
	private long content_no;
	private long product_no;
	public long getMenuBox_no() {
		return menuBox_no;
	}
	public void setMenuBox_no(long menuBox_no) {
		this.menuBox_no = menuBox_no;
	}
	public long getContent_no() {
		return content_no;
	}
	public void setContent_no(long content_no) {
		this.content_no = content_no;
	}
	public long getProduct_no() {
		return product_no;
	}
	public void setProduct_no(long product_no) {
		this.product_no = product_no;
	}
	@Override
	public String toString() {
		return "ThemeBoxVo [menuBox_no=" + menuBox_no + ", content_no="
				+ content_no + ", product_no=" + product_no + "]";
	}
	
	
	
}
