package com.ddit.game4u.action.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddit.game4u.action.Action;
import com.ddit.game4u.dto.HardwareVO;
import com.ddit.game4u.dto.TagkindVO;
import com.ddit.game4u.service.AdminService;

public class RegistHardWareAction implements Action{
	private AdminService adminService;
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		
		String name = request.getParameter("name");
		String kind = request.getParameter("kind");
		
		HardwareVO hardWareVO = new HardwareVO();
		
		hardWareVO.setName(name);
		hardWareVO.setKind(kind);
		
		try {
			adminService.registHardWare(hardWareVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return url;
	}
}
