package com.ddit.game4u.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ddit.game4u.dao.GameDAO;
import com.ddit.game4u.dto.GameVO;
import com.ddit.game4u.dto.GamepictureVO;
import com.ddit.game4u.dto.SystemVO;
import com.ddit.game4u.dto.TagVO;

public class GameServiceImpl implements GameService{
	
	private GameDAO gameDAO;
	public void setGameDAO(GameDAO gameDAO) {
		this.gameDAO = gameDAO;
	}
	
	
	@Override
	public Map<String, Object> getStoreMap() throws SQLException {
		
		Map<String, Object> storeMap = new HashMap<>();
		
		List<GameVO> popularList = gameDAO.getPopularList();
		List<GameVO> newList = gameDAO.getNewList();
		List<GameVO> saleList = gameDAO.getSaleList();
		List<GameVO> freeList = gameDAO.getFreeList();
		
		storeMap.put("popularList", popularList);
		storeMap.put("newList", newList);
		storeMap.put("saleList", saleList);
		storeMap.put("freeList", freeList);
		
		return storeMap;
	}
	
	//선영
	@Override
	public Map<String, Object> selectDetailByGno(int gno) throws SQLException {
		
		Map<String, Object> detailMap = new HashMap<>();
		
		GameVO game = (GameVO) gameDAO.selectGameByGno(gno);
		List<SystemVO> systemList = gameDAO.selectSystemByGno(gno);
		List<TagVO> tagList = gameDAO.selectTagByGno(gno);
		List<GamepictureVO> gamePictureList = gameDAO.selectGamePictureByGno(gno);
		
		detailMap.put("game",game);
		detailMap.put("systemList", systemList);
		detailMap.put("tagList", tagList);
		detailMap.put("gamePictureList", gamePictureList);
		
		return detailMap;
	}

	
}
