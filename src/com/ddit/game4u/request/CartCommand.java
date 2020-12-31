package com.ddit.game4u.request;

import com.ddit.game4u.dto.CartVO;

public class CartCommand extends CartVO{
	private String gname;
	private int price; 
	private int sprice;
	private String thumbnail;
	
	public CartCommand() {};
	
	public CartCommand(CartVO cartVO) {
		this.setCartno(cartVO.getCartno());
		this.setEmail(cartVO.getEmail());
		this.setGno(cartVO.getGno());
	}
	
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSprice() {
		return sprice;
	}
	public void setSprice(int sprice) {
		this.sprice = sprice;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
}
