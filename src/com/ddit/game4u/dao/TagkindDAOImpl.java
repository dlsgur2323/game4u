package com.ddit.game4u.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ddit.game4u.dto.TagkindVO;

public class TagkindDAOImpl implements TagkindDAO{
	
	private SqlSessionFactory factory;
	public void setSqlSessionFactory(SqlSessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public List<TagkindVO> selectCategoList() throws SQLException {
		SqlSession session = factory.openSession();
		
		List<TagkindVO> categoList = session.selectList("Tag-Mapper.selectCategoList");
		session.close();
		
		return categoList;
	}

	@Override
	public List<TagkindVO> selectFuncList() throws SQLException {
		SqlSession session = factory.openSession();
		
		List<TagkindVO> funcList = session.selectList("Tag-Mapper.selectFuncList");
		session.close();
		
		return funcList;
	}

	@Override
	public List<String> selectOSList() throws SQLException {
		SqlSession session = factory.openSession();
		
		List<String> osList = session.selectList("Tag-Mapper.selectOSList");
		session.close();
		
		return osList;
	}

}
