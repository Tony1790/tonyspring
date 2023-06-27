package com.tonyspring.example.domain;

import java.time.LocalDateTime;

public class Comment {
	private int c_id;
	private int b_id;
	private String c_content;
	private String c_writer;
	private LocalDateTime c_date;
	private int c_group;
	private int c_order;
	private int c_depth;
	
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_writer() {
		return c_writer;
	}
	public void setC_writer(String c_writer) {
		this.c_writer = c_writer;
	}
	public LocalDateTime getC_date() {
		return c_date;
	}
	public void setC_date(LocalDateTime c_date) {
		this.c_date = c_date;
	}
	public int getC_group() {
		return c_group;
	}
	public void setC_group(int c_group) {
		this.c_group = c_group;
	}
	public int getC_order() {
		return c_order;
	}
	public void setC_order(int c_order) {
		this.c_order = c_order;
	}
	public int getC_depth() {
		return c_depth;
	}
	public void setC_depth(int c_depth) {
		this.c_depth = c_depth;
	}
}
