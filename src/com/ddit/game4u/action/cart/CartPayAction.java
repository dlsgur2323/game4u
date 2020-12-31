package com.ddit.game4u.action.cart;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddit.game4u.action.Action;
import com.ddit.game4u.dto.CardVO;
import com.ddit.game4u.dto.MemberVO;
import com.ddit.game4u.service.CardService;
import com.ddit.game4u.service.CartService;
import com.fasterxml.jackson.databind.ObjectMapper;

import jdk.internal.org.objectweb.asm.TypeReference;

public class CartPayAction implements Action {
	
	private CartService service;
	public void setCartService(CartService service) {
		this.service = service;
	}
	
	private CardService cardService;
	public void setCardService(CardService cardService) {
		this.cardService = cardService;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");		 
		Map<String, String[]> resultmap = request.getParameterMap();
		ObjectMapper jsonmapper = new ObjectMapper();
		CardVO cardvo = new CardVO();
		cardvo = jsonmapper.readValue(resultmap.get("cardinfo")[0], CardVO.class);
		if(cardvo.getEmail().equals("none")) {
			try {
				cardService.registCard(cardvo);		// 카드에 등록하기 추가 
			} catch (SQLException e) {				// 직접 입력한 경우에만 card등록. email은 none으로 표시됨
				e.printStackTrace();
			}
		};
		
		String[] para_cartNos = resultmap.get("cartNo");		
		String email = loginUser.getEmail();				
		for(String snos : para_cartNos){
			int cartNo = Integer.parseInt(snos);
			service.purchase(cartNo,email,cardvo.getCardNum());			
		}
		

		return url;
	}

}
