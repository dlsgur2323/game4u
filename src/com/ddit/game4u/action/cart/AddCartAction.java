package com.ddit.game4u.action.cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddit.game4u.action.Action;
import com.ddit.game4u.dto.CartVO;
import com.ddit.game4u.dto.MemberVO;
import com.ddit.game4u.service.CartService;

public class AddCartAction implements Action {

	private CartService service;
	public void setCartService(CartService service) {
		this.service = service;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 없을 경우 넘어오는 url
		System.out.println("hi");
		String url = "redirect:/cart/cartList.do";
		int gno = Integer.parseInt(request.getParameter("gno"));
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String email = loginUser.getEmail();
		CartVO cartVO = new CartVO();
		cartVO.setEmail(email);
		cartVO.setGno(gno);
		try {
			service.addCart(cartVO);	
		} catch (Exception e) {
			e.printStackTrace();
			url = ""; //error page, advice 있나?
		}
		return url;
	}

}
