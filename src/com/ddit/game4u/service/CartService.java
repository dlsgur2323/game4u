package com.ddit.game4u.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ddit.game4u.dto.CardVO;
import com.ddit.game4u.dto.CartVO;
import com.ddit.game4u.dto.LibraryVO;
import com.ddit.game4u.request.CartCommand;

public interface CartService {
	
/*	// 화면에 뿌릴 카트 리스트
	public List<CartCommand> getCartCommandList(String email);
	
	// 사용자 카드 정보 리스트
	public List<CardVO> getCardList(String email);*/
	
	//화면에 나갈 dataMap
	public Map<String, Object> dataMap(String email);
	
	// 구매시 실행될 메서드  : 라이브러리에 추가, 게임 판매량 올리기, 카트에서 지우기
	public void purchase(int cartNo, String email, String cardNo); 
	
	// 카트 등록
	public void addCart(CartVO cartVO);
	
	//카트 삭제
	public void deleteCart(int cartNo);
	
	//카트 중복 체크
	public boolean checkCart(String email, int gno);
	
	//사용자 카드 정보
	public CardVO getUserCard(String email, int cardNo);
	
	//라이브러리 체크
	public boolean checkLib(String email, int gno);

}
