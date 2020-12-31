package com.ddit.game4u.action.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddit.game4u.action.Action;
import com.ddit.game4u.dto.GameVO;
import com.ddit.game4u.dto.GamepictureVO;
import com.ddit.game4u.dto.SystemVO;
import com.ddit.game4u.dto.TagVO;
import com.ddit.game4u.request.GameRegistRequest;
import com.ddit.game4u.service.AdminService;
import com.ddit.game4u.service.GameService;
import com.fasterxml.jackson.databind.ObjectMapper;

public class GameRegistAction implements Action {

	private AdminService adminService;
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "";
		
		ObjectMapper mapper = new ObjectMapper();

		GameRegistRequest req = mapper.readValue(request.getReader(), GameRegistRequest.class);
		
		try {
			int gno = adminService.registGame(req);
			response.setContentType("text/plain;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(gno);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return url;
	}

}

