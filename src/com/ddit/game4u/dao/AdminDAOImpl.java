package com.ddit.game4u.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ddit.game4u.dto.GameVO;
import com.ddit.game4u.dto.GamepictureVO;
import com.ddit.game4u.dto.HardwareVO;
import com.ddit.game4u.dto.SystemVO;
import com.ddit.game4u.dto.TagVO;
import com.ddit.game4u.dto.TagkindVO;

public class AdminDAOImpl implements AdminDAO {

	private SqlSessionFactory sqlSessionFactory;
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	//게임번호 시퀀스
	@Override
	public int selectGameSeqNext() throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		int seq_num = session.selectOne("Admin-Mapper.selectGameSeqNext");
		session.close();
		return seq_num;
	}
	
	//게임 가져오기
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
	
	//업체 가져오기
	@Override
	public List<String> selectCompany() throws SQLException{
		SqlSession session = sqlSessionFactory.openSession();
		List<String> company = session.selectList("Admin-Mapper.selectCompany");
		session.close();
		return company;
	}
	
	//운영체제 가져오기
	@Override
	public List<String> selectOS() throws SQLException{
		SqlSession session = sqlSessionFactory.openSession();
		List<String> os = session.selectList("Admin-Mapper.selectOS");
		session.close();
		return os;
	}
	
	//하드웨어 가져오기
	@Override
	public List<HardwareVO> selectProcessor() throws SQLException{
		SqlSession session = sqlSessionFactory.openSession();
		List<HardwareVO> processor = session.selectList("Admin-Mapper.selectProcessor");
		session.close();
		return processor;
	}
	
	@Override
	public List<HardwareVO> selectGraphic() throws SQLException{
		SqlSession session = sqlSessionFactory.openSession();
		List<HardwareVO> graphic = session.selectList("Admin-Mapper.selectGraphic");
		session.close();
		return graphic;
	}
	
	//카테고리 가져오기
	public List<TagkindVO> selectTagCategory() throws SQLException{
		SqlSession session = sqlSessionFactory.openSession();
		List<TagkindVO> category = session.selectList("Admin-Mapper.selectTagCategory");
		session.close();
		return category;
	}
	
	public List<TagkindVO> selectTagFunction() throws SQLException{
		SqlSession session = sqlSessionFactory.openSession();
		List<TagkindVO> function = session.selectList("Admin-Mapper.selectTagFunction");
		session.close();
		return function;
	}
	
	
	//썸네일 등록
	@Override
	public void updateThumbnail(GameVO game) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("Admin-Mapper.updateThumbnail", game);
		session.close();
	}
	
	//게임등록
	@Override
	public void registGame(GameVO game) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession(true);		
		session.update("Admin-Mapper.registGame",game);
		session.close();
	}

	@Override
	public void insertPicture(GamepictureVO picture)  throws SQLException{
		SqlSession session = sqlSessionFactory.openSession(true);		
		session.update("Admin-Mapper.insertPicture",picture);
		session.close();
		
	}

	@Override
	public void insertTag(TagVO tag)  throws SQLException{
		SqlSession session = sqlSessionFactory.openSession(true);		
		session.update("Admin-Mapper.insertTag",tag);
		session.close();
		
	}

	@Override
	public void insertSystem(SystemVO system)  throws SQLException{
		SqlSession session = sqlSessionFactory.openSession(true);		
		session.update("Admin-Mapper.insertSystem",system);
		session.close();
		
	}
	@Override
	public void insertTagKind(TagkindVO tagkindVO) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("Admin-Mapper.insertTagKind", tagkindVO);
		session.close();
	}
	@Override
	public void deletePicture(int picno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("Admin-Mapper.deletePicture", picno);
		session.close();
	}
	@Override
	public void deleteSystem(int gno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("Admin-Mapper.deleteSystem", gno);
		session.close();
		// TODO Auto-generated method stub
		
	}
	@Override
	public void deleteTag(int gno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("Admin-Mapper.deleteTag", gno);
		session.close();
		// TODO Auto-generated method stub
		
	}
	@Override
	public void updateGame(GameVO game) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("Admin-Mapper.updateGame", game);
		session.close();
		// TODO Auto-generated method stub
		
	}
	@Override
	public void registCorp(String corp) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("Admin-Mapper.registCorp", corp);
		session.close();
	}
	@Override
	public void insertHardWare(HardwareVO hardWareVO) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("Admin-Mapper.insertHardWare", hardWareVO);
		session.close();
		
	}
	
}
