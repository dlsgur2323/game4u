package com.ddit.game4u.action.cart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddit.game4u.action.Action;
import com.ddit.game4u.dto.CardVO;
import com.ddit.game4u.dto.MemberVO;
import com.ddit.game4u.service.CartService;
import com.fasterxml.jackson.databind.ObjectMapper;

public class GetUserCardAction implements Action {
	
	private CartService service;
	public void setCartService(CartService service) {
		this.service = service;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		//AJAX로 넘어올 애들 : 카드번호, 이메일(세션)
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		String email = loginUser.getEmail();
		int cardNo = Integer.parseInt(request.getParameter("cardNo"));
		
		CardVO userCard = service.getUserCard(email, cardNo);
		ObjectMapper dataToJson = new ObjectMapper();
		String data = dataToJson.writeValueAsString(userCard);
		
		response.setContentType("application/json;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();		
		out.print(data);
		
		return url;
	}

}
