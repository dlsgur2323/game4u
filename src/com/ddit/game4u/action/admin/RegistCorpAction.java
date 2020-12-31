package com.ddit.game4u.action.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddit.game4u.action.Action;
import com.ddit.game4u.service.AdminService;

public class RegistCorpAction implements Action{
	private AdminService adminService;
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		
		String corp = request.getParameter("corp");
		
		try {
			adminService.registCorp(corp);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return url;
	}
}
