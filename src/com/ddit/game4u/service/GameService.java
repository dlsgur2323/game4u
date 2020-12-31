package com.ddit.game4u.service;

import java.sql.SQLException;
import java.util.Map;

import com.ddit.game4u.dto.GameVO;
import com.ddit.game4u.dto.SystemVO;
import com.ddit.game4u.dto.TagVO;

public interface GameService {
	
	Map<String, Object> getStoreMap() throws SQLException;
		
	//선영
	Map<String, Object> selectDetailByGno(int gno) throws SQLException;

	
}
