package com.ddit.game4u.dao;

import java.sql.SQLException;
import java.util.List;

import com.ddit.game4u.dto.CartVO;
import com.ddit.game4u.dto.GameVO;
import com.ddit.game4u.dto.LibraryVO;
public interface CartDAO {
	
	//카트 리스트 - 추후 서비스에서 CartCommand 합쳐질 예정
	public List<CartVO> getCartList(String email) throws SQLException;
	
	//카트 게임 리스트 
	public GameVO getCartGameInfo(int gno) throws SQLException;
	
	// 카트등록
	public void addCart(CartVO cartVO) throws SQLException;
	
	//카트 삭제
	public void deleteCart(int cartNo) throws SQLException;
	
	//구매시 게임 판매량 +1 
	public void increaseSalesRate(int gno) throws SQLException;
	
	// 구매시 라이브러리에 추가
	public void addToLibrary(LibraryVO library) throws SQLException;
	
	//카트 번호 시퀀스 가져오기
	public int getCartNo() throws SQLException;
	
	// 라이브러리 번호 시퀀스 가져오기
	public int getLibraryNo() throws SQLException;
	
	//광고 썸넬, 사진, 가격, 할인가격 가져오기
	public List<GameVO> getAdGameList() throws SQLException;
	
	// 카트에 있는 게임 정보 가져오기
	public GameVO getInfoForPay(int cartNo) throws SQLException;
	
	// 라이브러이에 있는 게임 개수 가져오기
	public int checkLib(String email, int gno) throws SQLException;

}
