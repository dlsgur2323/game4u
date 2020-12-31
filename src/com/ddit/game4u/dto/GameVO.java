package com.ddit.game4u.dto;

import java.util.Date;

public class GameVO {
	private int gno           ;
	private String gname         ;
	private Date reldate       ;
	private int price         ;
	private int sprice        ;
	private Date startdate     ;
	private Date enddate       ;
	private String thumbnail     ;
	private String content       ;
	private String simcontent    ;
	private int selling       ;
	private int salerate      ;
	private String developer     ;
	private String distributor   ;
	private String downurl		 ;
	
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public Date getReldate() {
		return reldate;
	}
	public void setReldate(Date reldate) {
		this.reldate = reldate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSprice() {
		if(startdate !=null && enddate != null) {
			if(new Date().after(startdate) && new Date().before(enddate)) {
				return this.sprice;
			} else {
				return 0;
			}
		} 
		return 0;
		
	}
	public void setSprice(int sprice) {
		this.sprice = sprice;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSimcontent() {
		return simcontent;
	}
	public void setSimcontent(String simcontent) {
		this.simcontent = simcontent;
	}
	public int getSelling() {
		return selling;
	}
	public void setSelling(int selling) {
		this.selling = selling;
	}
	public int getSalerate() {
		return salerate;
	}
	public void setSalerate(int salerate) {
		this.salerate = salerate;
	}
	public String getDeveloper() {
		return developer;
	}
	public void setDeveloper(String developer) {
		this.developer = developer;
	}
	public String getDistributor() {
		return distributor;
	}
	public void setDistributor(String distributor) {
		this.distributor = distributor;
	}
	public String getDownurl() {
		return downurl;
	}
	public void setDownurl(String downurl) {
		this.downurl = downurl;
	}
	@Override
	public String toString() {
		return "GameVO [gno=" + gno + ", gname=" + gname + ", reldate=" + reldate + ", price=" + price + ", sprice="
				+ sprice + ", startdate=" + startdate + ", enddate=" + enddate + ", thumbnail=" + thumbnail
				+ ", content=" + content + ", simcontent=" + simcontent + ", developer=" + developer + ", distributor="
				+ distributor + "]";
	}
	


	
	
	
	
}
