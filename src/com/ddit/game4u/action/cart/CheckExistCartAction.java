package com.ddit.game4u.action.cart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddit.game4u.action.Action;
import com.ddit.game4u.dto.MemberVO;
import com.ddit.game4u.service.CartService;

public class CheckExistCartAction implements Action {
	
	private CartService service;
	public void setCartService(CartService service) {
		this.service=service;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 이미 장바구니에 담긴 상품 장바구니에 담기 여러번 눌렀을 경우. 
		// + 라이브러리에 있는지 여부  확인
		String url = "";
		int gno = Integer.parseInt(request.getParameter("gno"));
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		String email = loginUser.getEmail();
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String returnUrl = "realAdd.do?gno=" + gno;
		String msg = "";
		//라이브러리에 있는지 확인
		// jsp 하나 만들어서 script 용
		
		if(!service.checkLib(email, gno)) { // 라이브러리에 이미 있음(이미 구입한 상품)
			msg = "이미 구입한 상품입니다. 라이브러리로 이동하시겠습니까?";
			returnUrl = request.getContextPath() + "/member/library.do?";
		}else {
			if(!service.checkCart(email, gno)) {
				msg = "이미 장바구니에 있습니다. 장바구니로 이동하시겠습니까?";
				returnUrl = "cartList.do";
			}else {
				msg = "장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?";				
			};
		}
		out.println("<script type='text/javascript'>");
		out.println("if(confirm('"+msg+"')){ "
				+ "window.parent.location.href='"+returnUrl+"';}else{"
				+ "history.go(-1);}");
		out.print("</script>");
		return url;
	}
	
}

