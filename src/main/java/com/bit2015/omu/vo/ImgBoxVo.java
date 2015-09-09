package com.bit2015.omu.vo;

public class ImgBoxVo {
	
	private long imgBox_no;
	private long content_no;
	private String imageUrl;
	public long getImgBox_no() {
		return imgBox_no;
	}
	public void setImgBox_no(long imgBox_no) {
		this.imgBox_no = imgBox_no;
	}
	public long getContent_no() {
		return content_no;
	}
	public void setContent_no(long content_no) {
		this.content_no = content_no;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	@Override
	public String toString() {
		return "ImgBoxVo [imgBox_no=" + imgBox_no + ", content_no="
				+ content_no + ", imageUrl=" + imageUrl + "]";
	}
	
}
