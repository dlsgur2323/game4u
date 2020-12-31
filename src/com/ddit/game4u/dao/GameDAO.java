package com.ddit.game4u.dao;

import java.sql.SQLException;
import java.util.List;

import com.ddit.game4u.dto.GameVO;
import com.ddit.game4u.dto.GamepictureVO;
import com.ddit.game4u.dto.SystemVO;
import com.ddit.game4u.dto.TagVO;

public interface GameDAO {

	List<GameVO> getPopularList() throws SQLException;

	List<GameVO> getNewList() throws SQLException;

	List<GameVO> getSaleList() throws SQLException;

	List<GameVO> getFreeList() throws SQLException;

	
	//선영
	//상세페이지
	GameVO selectGameByGno(int gno) throws SQLException;
	
	List<SystemVO> selectSystemByGno(int gno) throws SQLException;
	
	List<TagVO> selectTagByGno(int gno) throws SQLException;
	
	List<GamepictureVO> selectGamePictureByGno(int gno) throws SQLException;
}
