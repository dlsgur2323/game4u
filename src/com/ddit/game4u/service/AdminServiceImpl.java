package com.ddit.game4u.service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ddit.game4u.dao.AdminDAO;
import com.ddit.game4u.dto.GameVO;
import com.ddit.game4u.dto.GamepictureVO;
import com.ddit.game4u.dto.HardwareVO;
import com.ddit.game4u.dto.SystemVO;
import com.ddit.game4u.dto.TagVO;
import com.ddit.game4u.dto.TagkindVO;
import com.ddit.game4u.request.CartCommand;
import com.ddit.game4u.request.GameModifyRequest;
import com.ddit.game4u.request.GameRegistRequest;

public class AdminServiceImpl implements AdminService {

	private AdminDAO adminDAO;
	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}
	
	//os,하드웨어, 태그 가져오기  + 수정 겟
	@Override
	public Map<String, Object> selectGameInfor() throws SQLException {
		Map<String, Object> adminMap = new HashMap<>();
		
		List<String> comList = adminDAO.selectCompany();
		List<String> osList = adminDAO.selectOS();
		List<HardwareVO> processorList = adminDAO.selectProcessor();
		List<HardwareVO> graphicList = adminDAO.selectGraphic();
		List<TagkindVO> categoryList = adminDAO.selectTagCategory();
		List<TagkindVO> functionList = adminDAO.selectTagFunction();
		
		adminMap.put("comList", comList);
		adminMap.put("osList",osList);
		adminMap.put("processorList", processorList);
		adminMap.put("graphicList", graphicList);
		adminMap.put("categoryList", categoryList);
		adminMap.put("functionList", functionList);
		
		return adminMap;
	}
	
	//썸네일 등록
	@Override
	public void updateThumbnail(GameVO game) throws SQLException {
		adminDAO.updateThumbnail(game);
	}
	
	//수정 겟
	@Override
	public Map<String, Object> selectDetailByGno(int gno) throws SQLException {
		
		Map<String, Object> detailMap = new HashMap<>();
		
		GameVO game = (GameVO) adminDAO.selectGameByGno(gno);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date rel = game.getReldate();
		String reldate = sdf.format(rel);
		
		
		List<SystemVO> systemList = adminDAO.selectSystemByGno(gno);
		List<TagVO> tagList = adminDAO.selectTagByGno(gno);
		List<GamepictureVO> gamePictureList = adminDAO.selectGamePictureByGno(gno);
		
		detailMap.put("game",game);
		detailMap.put("systemList", systemList);
		detailMap.put("tagList", tagList);
		detailMap.put("gamePictureList", gamePictureList);
		
		Date end = game.getEnddate();
		if(end != null) {
			String enddate = sdf.format(end);
			detailMap.put("enddate", enddate);
		}
		Date start = game.getStartdate();
		if(start != null) {
			String startdate = sdf.format(start);
			detailMap.put("startdate", startdate);
		}
		detailMap.put("reldate", reldate);
		
		return detailMap;
	}
	
	
	@Override
	public int modifyGame(GameModifyRequest req) throws SQLException {
		
		GameVO game = req.getGameVO();
		SystemVO[] systems = req.getSystems();
		GamepictureVO[] pictures = req.getPictures();
		String[] tagnames = req.getTagnames();
		System.out.println(game);
		int gno = game.getGno();
		adminDAO.updateGame(game);
		
		for(GamepictureVO picture : pictures) {
			picture.setGno(gno);
			int picno = picture.getPicno();
			adminDAO.deletePicture(picno);
			adminDAO.insertPicture(picture);
		}
		
		adminDAO.deleteTag(gno);
		adminDAO.deleteSystem(gno);
		for(String str : tagnames) {
			TagVO tag = new TagVO();
			tag.setTagname(str);
			tag.setGno(gno);
			adminDAO.insertTag(tag);
		}
		for(SystemVO system : systems) {
			system.setGno(gno);
			adminDAO.insertSystem(system);
		}
		
		
		return gno;
		
	}
	
	
	//게임등록
	@Override
	public int registGame(GameRegistRequest req) throws SQLException {
		int gno = adminDAO.selectGameSeqNext();
		
		GameVO game = req.getGameVO();
		SystemVO[] systems = req.getSystems();
		String[] pictures = req.getPictures();
		String[] tagnames = req.getTagnames();
	
		System.out.println("game = " + game);
		game.setGno(gno);
		adminDAO.registGame(game);
		
		for(String str : pictures) {
			GamepictureVO picture = new GamepictureVO();
			picture.setPicture(str);
			picture.setGno(gno);
			adminDAO.insertPicture(picture);
		}
		
		for(String str : tagnames) {
			TagVO tag = new TagVO();
			tag.setTagname(str);
			tag.setGno(gno);
			adminDAO.insertTag(tag);
		}
		for(SystemVO system : systems) {
			system.setGno(gno);
			adminDAO.insertSystem(system);
		}
		
		
		return gno;
		
		
		
	}
	@Override
	public void registTagKind(TagkindVO tagkindVO) throws SQLException {
		adminDAO.insertTagKind(tagkindVO);
		
	}
	@Override
	public void registCorp(String corp) throws SQLException {
		adminDAO.registCorp(corp);
		
	}
	
	@Override
	public void registHardWare(HardwareVO hardWareVO) throws SQLException {
		adminDAO.insertHardWare(hardWareVO);
		
	}


}
