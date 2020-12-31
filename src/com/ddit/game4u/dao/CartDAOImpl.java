package com.ddit.game4u.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ddit.game4u.dto.CartVO;
import com.ddit.game4u.dto.GameVO;
import com.ddit.game4u.dto.LibraryVO;

public class CartDAOImpl implements CartDAO{
	
	private SqlSessionFactory factory;
	public void setSqlSessionFactory(SqlSessionFactory factory) {
		this.factory = factory;
	}
	
	@Override
	public List<CartVO> getCartList(String email) throws SQLException {
		SqlSession session = factory.openSession();
		List<CartVO> result = session.selectList("Cart-Mapper.getCartList",email);
		session.close();
		return result;
	}
	@Override
	public GameVO getCartGameInfo(int gno) throws SQLException {
		SqlSession session = factory.openSession();
		//List<GameVO> result = null;
		GameVO result = null;
		result = session.selectOne("Cart-Mapper.getCartGameInfo",gno);
		session.close();
		return result;
	}
	@Override
	public void addCart(CartVO cartVO) throws SQLException {
		SqlSession session = factory.openSession(true);
		session.update("Cart-Mapper.addCart",cartVO);
		session.close();
	}
	@Override
	public void deleteCart(int cartNo) throws SQLException {
		SqlSession session = factory.openSession(true);
		session.update("Cart-Mapper.deleteCart",cartNo);
		session.close();	
	}
	@Override
	public void increaseSalesRate(int gno) throws SQLException {
		SqlSession session = factory.openSession(true);
		session.update("Cart-Mapper.increaseSalesRate",gno);
		session.close();	
	}
	@Override
	public void addToLibrary(LibraryVO library) throws SQLException {
		SqlSession session = factory.openSession(true);
		session.update("Cart-Mapper.addToLibrary",library);
		session.close();
	}

	@Override
	public int getCartNo() throws SQLException {
		int cartNo = 0;
		SqlSession session = factory.openSession();
		cartNo = session.selectOne("Cart-Mapper.getCartNo");
		session.close();
		return cartNo;
	}

	@Override
	public int getLibraryNo() throws SQLException {
		int libNo = 0;
		SqlSession session = factory.openSession();
		libNo = session.selectOne("Cart-Mapper.getLibraryNo");
		session.close();
		return libNo;
	}
	
	@Override
	public List<GameVO> getAdGameList() throws SQLException {
		List<GameVO> result = null;
		SqlSession session = factory.openSession();
		result = session.selectList("Cart-Mapper.getAdGameList");	
		session.close();
		return result;
	}
	
	@Override
	public GameVO getInfoForPay(int cartNo) throws SQLException {
		GameVO game = new GameVO(); 
		SqlSession session = factory.openSession();
		game = session.selectOne("Cart-Mapper.getInfoForPay",cartNo);	
		session.close();
		return game;
	}
	
	@Override
	public int checkLib(String email, int gno) throws SQLException {
		int result;
		SqlSession session = factory.openSession();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("email", email);
		params.put("gno", gno);
		result = session.selectOne("Cart-Mapper.checkLib", params);
		return result;
	}
}
