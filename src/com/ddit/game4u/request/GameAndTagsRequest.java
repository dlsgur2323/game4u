package com.ddit.game4u.request;

import java.util.Date;

public class GameAndTagsRequest {
	private int gno           ;
	private String gname         ;
	private Date relDate       ;
	private int price         ;
	private int sprice        ;
	private Date startDate     ;
	private Date endDate       ;
	private String thumbnail     ;
	private String content       ;
	private String simcontent    ;
	private int selling       ;
	private int salerate      ;
	private String developer     ;
	private String distributor   ;
	private String downurl		 ;
	private String[] tagnames;
	private String[] os;
	
	public String[] getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os.split(os);
	}
	public String[] getTagnames() {
		return tagnames;
	}
	public void setTagnames(String tagnames) {
		this.tagnames = tagnames.split(",");
	}
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
	public Date getRelDate() {
		return relDate;
	}
	public void setRelDate(Date relDate) {
		this.relDate = relDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSprice() {
		if(startDate != null && endDate != null) {
			
			if(new Date().after(startDate) && new Date().before(endDate)) {
				return sprice;
			} else {
				return 0;
			}
		}
		return 0;
	}
	public void setSprice(int sprice) {
		this.sprice = sprice;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
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
	
	
	
}
