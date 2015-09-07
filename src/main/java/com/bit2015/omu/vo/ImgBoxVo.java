package com.bit2015.omu.vo;

public class ImgBoxVo {
	
	private long imgBox_no;
	private long img_no;
	private long content_no;
	
	public long getImgBox_no() {
		return imgBox_no;
	}
	public void setImgBox_no(long imgBox_no) {
		this.imgBox_no = imgBox_no;
	}
	public long getImg_no() {
		return img_no;
	}
	public void setImg_no(long img_no) {
		this.img_no = img_no;
	}
	public long getContent_no() {
		return content_no;
	}
	public void setContent_no(long content_no) {
		this.content_no = content_no;
	}
	
	@Override
	public String toString() {
		return "ImgBoxVo [imgBox_no=" + imgBox_no + ", img_no=" + img_no
				+ ", content_no=" + content_no + "]";
	}
	
	

}
