package com.ddit.game4u.action.store;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddit.game4u.action.Action;
import com.ddit.game4u.request.GameAndTagsRequest;
import com.ddit.game4u.service.StoreService;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ResultListAction implements Action{
	
	private StoreService storeService;
	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		
		List<GameAndTagsRequest> resultList;
		try {
			resultList = storeService.getResultList(request);
			Map<String, List<GameAndTagsRequest>> dataMap = new HashMap<String, List<GameAndTagsRequest>>();
			dataMap.put("resultList", resultList);
			
			ObjectMapper mapper = new ObjectMapper();

			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();

			out.println(mapper.writeValueAsString(dataMap));
			out.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return url;
	}
}
