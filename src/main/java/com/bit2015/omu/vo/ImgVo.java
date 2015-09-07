package com.bit2015.omu.vo;

public class ImgVo {
	private long img_no;
	private String imageURL;
	
	public long getImg_no() {
		return img_no;
	}
	public void setImg_no(long img_no) {
		this.img_no = img_no;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	@Override
	public String toString() {
		return "ImgVo [img_no=" + img_no + ", imageURL=" + imageURL + "]";
	}
	
	

}
