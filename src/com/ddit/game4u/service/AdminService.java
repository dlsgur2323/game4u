package com.ddit.game4u.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ddit.game4u.dto.GameVO;
import com.ddit.game4u.dto.HardwareVO;
import com.ddit.game4u.dto.TagkindVO;
import com.ddit.game4u.request.GameModifyRequest;
import com.ddit.game4u.request.GameRegistRequest;


public interface AdminService {

	//게임, os, 하드웨어, 태그 가져오기
	Map<String, Object> selectGameInfor() throws SQLException;
	
	//썸네일 등록
	public void updateThumbnail(GameVO game) throws SQLException;
	
	//수정 겟
	Map<String, Object> selectDetailByGno(int gno) throws SQLException;
	
	// 등록
	int registGame(GameRegistRequest req) throws SQLException;


	void registTagKind(TagkindVO tagkindVO) throws SQLException;


	int modifyGame(GameModifyRequest req)throws SQLException;


	void registCorp(String corp) throws SQLException;


	void registHardWare(HardwareVO hardWareVO) throws SQLException;
		
	// 수정
	//void modifyGame(Map<String, Object> modifyMap) throws SQLException;
}
