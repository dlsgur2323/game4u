package com.ddit.game4u.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ddit.game4u.request.GameAndTagsRequest;

public class StoreDAOImpl implements StoreDAO{
	
	private SqlSessionFactory sqlSessionFactory;
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	@Override
	public List<GameAndTagsRequest> selectResultList(Map<String, Object> searchMap) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		List<GameAndTagsRequest> resultList = session.selectList("Store-Mapper.selectResultList", searchMap);
		session.close();
		return resultList;
	}
}
