package com.ddit.game4u.dao;

import java.sql.SQLException;
import java.util.List;

import com.ddit.game4u.dto.GameVO;
import com.ddit.game4u.dto.GamepictureVO;
import com.ddit.game4u.dto.HardwareVO;
import com.ddit.game4u.dto.SystemVO;
import com.ddit.game4u.dto.TagVO;
import com.ddit.game4u.dto.TagkindVO;


public interface AdminDAO {

	int selectGameSeqNext() throws SQLException;
	
	//게임 가져오기
	GameVO selectGameByGno(int gno) throws SQLException;
	
	List<SystemVO> selectSystemByGno(int gno) throws SQLException;
	
	List<TagVO> selectTagByGno(int gno) throws SQLException;
	
	List<GamepictureVO> selectGamePictureByGno(int gno) throws SQLException;
	
	//업체 가져오기
	List<String> selectCompany() throws SQLException;
	
	//운영체제 가져오기
	List<String> selectOS() throws SQLException;
	
	//하드웨어 가져오기
	List<HardwareVO> selectProcessor() throws SQLException;
	List<HardwareVO> selectGraphic() throws SQLException;
	
	//카테고리
	List<TagkindVO> selectTagCategory() throws SQLException;
	List<TagkindVO> selectTagFunction() throws SQLException;
	
	//썸네일 등록
	public void updateThumbnail(GameVO game) throws SQLException;
	
	//게임등록
	void registGame(GameVO game) throws SQLException;

	void insertPicture(GamepictureVO picture) throws SQLException;

	void insertTag(TagVO tag) throws SQLException;

	void insertSystem(SystemVO system) throws SQLException;

	void insertTagKind(TagkindVO tagkindVO) throws SQLException;

	void deletePicture(int picno) throws SQLException;

	void deleteTag(int gno) throws SQLException;

	void updateGame(GameVO game) throws SQLException;

	void deleteSystem(int gno) throws SQLException;
	
	void registCorp(String corp) throws SQLException;

	void insertHardWare(HardwareVO hardWareVO) throws SQLException;

	//void modifyGame(Map<String, Object> modifyMap) throws SQLException;
}
