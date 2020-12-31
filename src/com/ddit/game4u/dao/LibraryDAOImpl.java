package com.ddit.game4u.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ddit.game4u.dto.GameVO;
import com.ddit.game4u.dto.LibraryVO;

public class LibraryDAOImpl implements LibraryDAO{
	
	private SqlSessionFactory factory;
	public void setSqlSessionFactory(SqlSessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public List<GameVO> selectLibraryByEmail(String email, String sort) throws SQLException {
		
		Map<String, String> dataMap = new HashMap<String, String>();
		
		dataMap.put("email", email);
		dataMap.put("sort", sort);
		
		SqlSession session = factory.openSession();
		List<GameVO> library = session.selectList("Library-Mapper.selectLibraryByEmail", dataMap);
		session.close();
		
		return library;
	}

}
