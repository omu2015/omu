package com.bit2015.omu.vo;

public class BoardImgBoxVo {
	
	private long boardImgBox_no;
	private long board_no;
	private String imageUrl;
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
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	@Override
	public String toString() {
		return "BoardImgBoxVo [boardImgBox_no=" + boardImgBox_no
				+ ", board_no=" + board_no + ", imageUrl=" + imageUrl + "]";
	}

	
}
