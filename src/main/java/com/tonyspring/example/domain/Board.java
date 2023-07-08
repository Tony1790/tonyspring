package com.tonyspring.example.domain;

import lombok.Data;
import java.util.List;
import java.time.LocalDateTime;

@Data
public class Board {
	private int bId;
	private String bTitle;
	private String bContent;
	private String bWriter;
	private LocalDateTime bDateTime;
	private int bGroup;
	private int bOrder;
	private int bDepth;
	private List<BoardAttachVO> attachList;
	
	public List<BoardAttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<BoardAttachVO> attachList) {
		this.attachList = attachList;
	}
	public int getbGroup() {
		return bGroup;
	}
	public void setbGroup(int bGroup) {
		this.bGroup = bGroup;
	}
	public int getbOrder() {
		return bOrder;
	}
	public void setbOrder(int bOrder) {
		this.bOrder = bOrder;
	}
	public int getbDepth() {
		return bDepth;
	}
	public void setbDepth(int bDepth) {
		this.bDepth = bDepth;
	}
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getbWriter() {
		return bWriter;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public LocalDateTime getbDateTime() {
		return bDateTime;
	}
	public void setbDateTime(LocalDateTime bDateTime) {
		this.bDateTime = bDateTime;
	}
	@Override
	public String toString() {
		return "Board [bId=" + bId + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bWriter=" + bWriter
				+ ", bDateTime=" + bDateTime + ", bGroup=" + bGroup + ", bOrder=" + bOrder + ", bDepth=" + bDepth
				+ ", attachList=" + attachList + "]";
	}
	
	
}
