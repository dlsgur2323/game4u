package com.ddit.game4u.action.store;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddit.game4u.action.Action;
import com.ddit.game4u.dto.GameVO;
import com.ddit.game4u.dto.SystemVO;
import com.ddit.game4u.dto.TagVO;
import com.ddit.game4u.service.GameService;

public class DetailPageAction implements Action{

	private GameService gameService;
	public void setGameService(GameService gameService) {
		this.gameService = gameService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "/store/detail";
		
		int gno = Integer.parseInt(request.getParameter("gno"));
		
		try {
			Map<String, Object> detailMap = gameService.selectDetailByGno(gno);
			request.setAttribute("detailMap", detailMap);
			
		} catch (Exception e) {
			e.printStackTrace();
			url=null;
		}
		return url;
	}
	
	

}
