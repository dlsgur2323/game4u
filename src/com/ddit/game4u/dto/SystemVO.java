package com.ddit.game4u.dto;

public class SystemVO {

	private int sysno     ;
	private int gno       ;
	private String os        ;
	private int memory    ;
	private String graphic1  ;
	private String graphic2  ;
	private String processor1;
	private String processor2;
	private int disk      ;
	private int directx   ;
	
	
	public int getSysno() {
		return sysno;
	}
	public void setSysno(int sysno) {
		this.sysno = sysno;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os;
	}
	public int getMemory() {
		return memory;
	}
	public void setMemory(int memory) {
		this.memory = memory;
	}
	public String getGraphic1() {
		return graphic1;
	}
	public void setGraphic1(String graphic1) {
		this.graphic1 = graphic1;
	}
	public String getGraphic2() {
		return graphic2;
	}
	public void setGraphic2(String graphic2) {
		this.graphic2 = graphic2;
	}
	public String getProcessor1() {
		return processor1;
	}
	public void setProcessor1(String processor1) {
		this.processor1 = processor1;
	}
	public String getProcessor2() {
		return processor2;
	}
	public void setProcessor2(String processor2) {
		this.processor2 = processor2;
	}
	public int getDisk() {
		return disk;
	}
	public void setDisk(int disk) {
		this.disk = disk;
	}
	public int getDirectx() {
		return directx;
	}
	public void setDirectx(int directx) {
		this.directx = directx;
	}
	@Override
	public String toString() {
		return "SystemVO [sysno=" + sysno + ", gno=" + gno + ", os=" + os + ", memory=" + memory + ", graphic1="
				+ graphic1 + ", graphic2=" + graphic2 + ", processor1=" + processor1 + ", processor2=" + processor2
				+ ", disk=" + disk + ", directx=" + directx + "]";
	}
	
	
	
	
	
}
