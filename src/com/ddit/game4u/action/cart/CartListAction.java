package com.ddit.game4u.action.cart;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddit.game4u.action.Action;
import com.ddit.game4u.dto.MemberVO;
import com.ddit.game4u.service.CartService;

//장바구니 누르면 나오는 페이지위한 Action
public class CartListAction implements Action{
	
	private CartService service;
	public void setCartService(CartService service) {
		this.service = service;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 보내야 할 것 : dataMap
		String url = "/cart/cart";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String email = loginUser.getEmail();
		
		Map<String, Object> dataMap = service.dataMap(email); //card, cart리스트 담긴 맵
		request.setAttribute("dataMap", dataMap);
		System.out.println(dataMap);
		return url;
	}
}
