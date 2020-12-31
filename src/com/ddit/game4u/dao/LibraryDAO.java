package com.ddit.game4u.dao;

import java.sql.SQLException;
import java.util.List;

import com.ddit.game4u.dto.GameVO;
import com.ddit.game4u.dto.LibraryVO;

public interface LibraryDAO {
	
	// 유저 라이브러리 검색
	List<GameVO> selectLibraryByEmail(String email, String sort) throws SQLException;

}
