package com.ddit.game4u.request;

import java.util.Arrays;

import com.ddit.game4u.dto.GameVO;
import com.ddit.game4u.dto.GamepictureVO;
import com.ddit.game4u.dto.SystemVO;

public class GameModifyRequest {
	private GameVO gameVO;
	private GamepictureVO[] pictures;
	private String[] tagnames;
	private SystemVO[] systems;
	
	public GamepictureVO[] getPictures() {
		return pictures;
	}
	public void setPictures(GamepictureVO[] pictures) {
		this.pictures = pictures;
	}
	public GameVO getGameVO() {
		return gameVO;
	}
	public void setGameVO(GameVO gameVO) {
		this.gameVO = gameVO;
	}
	
	public String[] getTagnames() {
		return tagnames;
	}
	public void setTagnames(String[] tagnames) {
		this.tagnames = tagnames;
	}
	public SystemVO[] getSystems() {
		return systems;
	}
	public void setSystems(SystemVO[] systems) {
		this.systems = systems;
	}
	@Override
	public String toString() {
		return "GameRegistRequest [game=" + gameVO + ", pictures=" + Arrays.toString(pictures) + ", tagnames="
				+ Arrays.toString(tagnames) + ", systems=" + Arrays.toString(systems) + "]";
	}
	
	
}





















