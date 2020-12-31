package com.ddit.game4u.action.admin;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddit.game4u.action.Action;
import com.ddit.game4u.service.AdminService;

public class GameModifyFormAction implements Action{

	private AdminService amdinService;
	public void setAdminService(AdminService amdinService) {
		this.amdinService = amdinService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "/admin/gameModify";
		int gno = Integer.parseInt(request.getParameter("gno"));
		
		try {
			Map<String, Object> detailMap = amdinService.selectDetailByGno(gno);
			Map<String, Object> adminMap = amdinService.selectGameInfor();
			
			request.setAttribute("detailMap", detailMap);
			request.setAttribute("adminMap", adminMap);
			
		} catch (Exception e) {
			e.printStackTrace();
			url=null;
		}
		System.out.println(url);
		return url;
	}
	
	

}
