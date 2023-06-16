package com.tonyspring.example.domain;

import java.time.LocalDateTime;

public class Board {
	private int bId;
	private String bTitle;
	private String bContent;
	private String bWriter;
	private LocalDateTime bDateTime;
	
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
}
