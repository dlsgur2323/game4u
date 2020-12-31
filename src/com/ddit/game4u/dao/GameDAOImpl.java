package com.ddit.game4u.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ddit.game4u.dto.GameVO;
import com.ddit.game4u.dto.GamepictureVO;
import com.ddit.game4u.dto.SystemVO;
import com.ddit.game4u.dto.TagVO;

public class GameDAOImpl implements GameDAO{

	private SqlSessionFactory sqlSessionFactory;
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	@Override
	public List<GameVO> getPopularList() throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		List<GameVO> list = session.selectList("Game-Mapper.getPopularList");
		session.close();
		return list;
	}

	@Override
	public List<GameVO> getNewList() throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		List<GameVO> list = session.selectList("Game-Mapper.getNewList");
		session.close();
		return list;
	}

	@Override
	public List<GameVO> getSaleList() throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		List<GameVO> list = session.selectList("Game-Mapper.getSaleList");
		session.close();
		return list;
	}

	@Override
	public List<GameVO> getFreeList() throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		List<GameVO> list = session.selectList("Game-Mapper.getFreeList");
		session.close();
		return list;
	}
	
	//선영
	@Override
	public GameVO selectGameByGno(int gno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		GameVO game = (GameVO) session.selectOne("Game-Mapper.selectGameByGno", gno);
		session.close();
		return game;
	}

	@Override
	public List<SystemVO> selectSystemByGno(int gno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		List<SystemVO> system = session.selectList("Game-Mapper.selectSystemByGno", gno);
		session.close();
		return system;
	}

	@Override
	public List<TagVO> selectTagByGno(int gno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		List<TagVO> tag = session.selectList("Game-Mapper.selectTagByGno", gno);
		session.close();
		return tag;
	}
	
	@Override
	public List<GamepictureVO> selectGamePictureByGno(int gno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		List<GamepictureVO> gamePicture = session.selectList("Game-Mapper.selectGamePictureByGno", gno);
		session.close();
		return gamePicture;
	}
}
