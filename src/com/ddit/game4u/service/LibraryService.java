package com.ddit.game4u.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ddit.game4u.dto.GameVO;
import com.ddit.game4u.dto.LibraryVO;

public interface LibraryService {
	
	// 구매한 게임 리스트 가져오기 
	List<GameVO> getLibraryGameList(String email, String sort) throws SQLException;

}
