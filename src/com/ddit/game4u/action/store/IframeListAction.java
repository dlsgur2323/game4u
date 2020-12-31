package com.ddit.game4u.action.store;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddit.game4u.action.Action;
import com.ddit.game4u.service.TagkindService;
import com.fasterxml.jackson.databind.ser.SerializerCache;

public class IframeListAction implements Action{
	
	private TagkindService tagkindService;
	public void setTagkindService(TagkindService tagkindService) {
		this.tagkindService = tagkindService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url =  "/store/list";
		
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		String keyword = request.getParameter("keyword");
		
		try {
			Map<String, Object> dataMap = tagkindService.getTagList();
			request.setAttribute("dataMap", dataMap);
			request.setAttribute("keyword", keyword);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return url;
	}
}
