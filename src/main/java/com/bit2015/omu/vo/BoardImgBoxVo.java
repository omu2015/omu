package com.bit2015.omu.vo;

public class BoardImgBoxVo {
	
	private long boardImgBox_no;
	private long board_no;
	private String imageURL;
	public long getBoardImgBox_no() {
		return boardImgBox_no;
	}
	public void setBoardImgBox_no(long boardImgBox_no) {
		this.boardImgBox_no = boardImgBox_no;
	}
	public long getBoard_no() {
		return board_no;
	}
	public void setBoard_no(long board_no) {
		this.board_no = board_no;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	@Override
	public String toString() {
		return "BoardImgBox [boardImgBox_no=" + boardImgBox_no + ", board_no="
				+ board_no + ", imageURL=" + imageURL + "]";
	}
	
}
