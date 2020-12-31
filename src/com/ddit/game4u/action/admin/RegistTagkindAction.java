package com.ddit.game4u.action.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddit.game4u.action.Action;
import com.ddit.game4u.dto.TagkindVO;
import com.ddit.game4u.service.AdminService;

public class RegistTagkindAction implements Action{
	
	private AdminService adminService;
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		
		String tagname = request.getParameter("tagname");
		String category = request.getParameter("tagkind");
		
		TagkindVO tagkindVO = new TagkindVO();
		
		tagkindVO.setCategory(category);
		tagkindVO.setTagname(tagname);
		
		try {
			adminService.registTagKind(tagkindVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return url;
	}
}
