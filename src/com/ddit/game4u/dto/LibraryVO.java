package com.ddit.game4u.dto;

import java.util.Date;

public class LibraryVO {
	private int libno;
	private int gno;
	private String cardno;
	private String email;
	private int price;
	private Date buydate;
	
	public int getLibno() {
		return libno;
	}
	public void setLibno(int libno) {
		this.libno = libno;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	
	public String getCardno() {
		return cardno;
	}
	public void setCardno(String cardno) {
		this.cardno = cardno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getBuydate() {
		return buydate;
	}
	public void setBuydate(Date buydate) {
		this.buydate = buydate;
	}
}
