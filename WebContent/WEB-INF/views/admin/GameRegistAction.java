package com.ddit.game4u.action.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddit.game4u.action.Action;
import com.ddit.game4u.dto.GameVO;
import com.ddit.game4u.dto.SystemVO;
import com.ddit.game4u.service.GameService;

public class GameRegistAction implements Action {

	private GameService gameService;
	public void setGameService(GameService gameService) {
		this.gameService = gameService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "";
		//game
		String gname  = request.getParameter("gname");
		String thumbnail = request.getParameter("thumbnail");
		String simContent = request.getParameter("simContent");
		String content = request.getParameter("content");
		String developer = request.getParameter("developer");
		String distributor = request.getParameter("distributor");
		int price = Integer.parseInt(request.getParameter("price"));
		int sprice = Integer.parseInt(request.getParameter("sprice"));
		String relDateStr = request.getParameter("relDate");
		String startDateStr = request.getParameter("startDate");
		String endDateStr = request.getParameter("endDate");
//		String picture = request.getParameter("picture");
		
		//system
		String os = request.getParameter("os");
		String processor1 = request.getParameter("processor1");
		String processor2 = request.getParameter("processor2");
		String graphic1 = request.getParameter("graphic1");
		String graphic2 = request.getParameter("graphic2");
		int memory = Integer.parseInt(request.getParameter("memory"));
		int disk = Integer.parseInt(request.getParameter("disk"));
		int directx = Integer.parseInt(request.getParameter("directx"));
		
		//picture list
		
		//tag
		
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			Date relDate = dateFormat.parse(relDateStr);
			Date startDate = dateFormat.parse(startDateStr);
			Date endDate = dateFormat.parse(endDateStr);
			
			GameVO game = new GameVO();
			game.setGname(gname);
			game.setThumbnail(thumbnail);
			game.setSimcontent(simContent);
			game.setContent(content);
			game.setReldate(relDate);
			game.setDeveloper(developer);
			game.setDistributor(distributor);
			game.setPrice(price);
			game.setSprice(sprice);
			game.setStartdate(startDate);
			game.setEnddate(endDate);
			
			SystemVO system = new SystemVO();
			system.setOs(os);
			system.setProcessor1(processor1);
			system.setProcessor2(processor2);
			system.setGraphic1(graphic1);
			system.setGraphic2(graphic2);
			system.setMemory(memory);
			system.setDisk(disk);
			system.setDirectx(directx);
			
			
		} catch (Exception e) {
			
			url=null;
			e.printStackTrace();
		}
		return url;
	}

}
