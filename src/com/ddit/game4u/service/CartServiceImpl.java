package com.ddit.game4u.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ddit.game4u.dao.CardDAO;
import com.ddit.game4u.dao.CartDAO;
import com.ddit.game4u.dto.CardVO;
import com.ddit.game4u.dto.CartVO;
import com.ddit.game4u.dto.GameVO;
import com.ddit.game4u.dto.LibraryVO;
import com.ddit.game4u.request.CartCommand;

public class CartServiceImpl implements CartService {

	private CardDAO cardDAO;
	public void setCardDAO(CardDAO cardDAO) {
		this.cardDAO = cardDAO;
	};
	
	private CartDAO cartDAO;
	public void setCartDAO(CartDAO cartDAO) {
		this.cartDAO = cartDAO;
	}
	
	//카드 회사 뿌리기
	private List<String> getCardComList(){
		List<String> cardComList = new ArrayList<>();
		try {
			cardComList = cardDAO.selectComList();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cardComList;
	}
	
	private List<CartCommand> getCartCommandList(String email){
		List<CartCommand> result = new ArrayList<CartCommand>();
		List<CartVO> cartList = new ArrayList<CartVO>();
		GameVO game = null; 
		try {
			CartCommand commands = new CartCommand();
			cartList = cartDAO.getCartList(email);			
			for(CartVO cartVO : cartList) {
				game = new GameVO();
				game = cartDAO.getCartGameInfo(cartVO.getGno());
				commands = new CartCommand(cartVO);
				commands.setGname(game.getGname());
				commands.setPrice(game.getPrice());
				commands.setSprice(game.getSprice());
				commands.setThumbnail(game.getThumbnail());
				//System.out.println("!!!!!!!!! "+ commands.getCartno());
				result.add(commands);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	private List<CardVO> getCardList(String email) {
		List<CardVO> result = null;
		try {
			result = cardDAO.selectCardList(email);
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private List<GameVO> getAdList(){
		List<GameVO> result = null;
		try {
			result = cartDAO.getAdGameList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	

	@Override
	public Map<String, Object> dataMap(String email) {
		Map<String, Object> dataMap = new HashMap<String,Object>();
		List<CardVO> cardList = new ArrayList<CardVO>();
		List<CartCommand> cartList = new ArrayList<CartCommand>();
		List<GameVO> adList = new ArrayList<GameVO>();
		try {
			cardList = getCardList(email);
			cartList = getCartCommandList(email);
			adList = getAdList();
			dataMap.put("cardList", cardList);
			dataMap.put("cartList", cartList);
			dataMap.put("adList", adList);
			dataMap.put("cardcomList", getCardComList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataMap;
	}
	
	// 결제할 game 정보 가져오기
	private GameVO getCartGame(int cartNo) {
		GameVO game = new GameVO();
		try {
			game = cartDAO.getInfoForPay(cartNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return game;
	}
	
	private LibraryVO gameToLib(GameVO value, String email, String cardNo) {
		int libno;
		LibraryVO result = new LibraryVO();
		try {
			libno = cartDAO.getLibraryNo();
			result.setGno(value.getGno());
			int price = value.getPrice() * (100 - value.getSprice()) / 100 ;
			System.out.println("price : " + price);
			result.setPrice(price);
			result.setEmail(email);
			result.setCardno(cardNo);
			result.setLibno(libno);
			System.out.println("libno : " + libno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	@Override
	public void purchase(int cartNo, String email, String cardNo){ 
		// 구매시 library에 추가, gu_game의 salerate + 1 , 카트에서 지우기
		GameVO value = null;
		LibraryVO lib = null;
		try {
			value = getCartGame(cartNo);
			lib = gameToLib(value, email, cardNo);
			cartDAO.addToLibrary(lib);
			cartDAO.increaseSalesRate(lib.getGno());
			cartDAO.deleteCart(cartNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("cartNo : " + cartNo);
		System.out.println("purchase");
	}

	@Override
	public void addCart(CartVO cartVO) {
		// 상세페이지에서 장바구니 추가 누르면 실행
		try {
			int cartNo = cartDAO.getCartNo();
			cartVO.setCartno(cartNo);
			cartDAO.addCart(cartVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("addCart");
	}

	@Override
	public void deleteCart(int cartNo) {
		try {
			cartDAO.deleteCart(cartNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("deleteCart");
	}
	
	@Override
	public boolean checkCart(String email, int gno) {
		try {
			List<CartVO> cartlist = cartDAO.getCartList(email);
			for(CartVO cart : cartlist) {
				if(cart.getGno() == gno) {
					return false;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
	
	@Override
	public CardVO getUserCard(String email, int cardNo) {
		CardVO cardVO = new CardVO();
		try {
			List<CardVO> cardList = cardDAO.selectCardList(email);
			for(CardVO card : cardList) {
				if(cardNo == card.getCardno()) {
					cardVO = card;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cardVO;
	}
	
	@Override
	public boolean checkLib(String email, int gno) {
		boolean result = true;
		int flag = 0;
		try {
			flag = cartDAO.checkLib(email, gno);
			if(flag >= 1) {
				result = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
