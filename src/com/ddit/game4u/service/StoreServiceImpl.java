package com.ddit.game4u.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.ddit.game4u.dao.StoreDAO;
import com.ddit.game4u.request.GameAndTagsRequest;

public class StoreServiceImpl implements StoreService{
	
	private StoreDAO storeDAO;
	public void setStoreDAO(StoreDAO storeDAO) {
		this.storeDAO = storeDAO;
	}
	
	@Override
	public List<GameAndTagsRequest> getResultList(HttpServletRequest request) throws SQLException {
		Map<String, Object> searchMap = new HashMap<String, Object>();
		String keyword = request.getParameter("keyword");
		String orderBy = request.getParameter("orderBy");
		String[] tagnames = request.getParameterValues("tagnames");
		String page = request.getParameter("page");
		String[] os = request.getParameterValues("os"); 
		
		String order = "relDate";
		String by = "asc";
		
		if(keyword == null) keyword = "";
		
		if(orderBy.equals("regDate")) {
			order = "relDate";
			by = "desc";
		} else if(orderBy.equals("priceDESC")) {
			order = "price";
			by = "desc";
		} else if(orderBy.equals("priceASC")) {
			order = "price";
			by = "asc";
		} else if(orderBy.equals("saleRate")) {
			order = "saleRate";
			by = "desc";
		}
		
		if(page.equals("0")) {
			page = "<=";
		} else {
			page = ">=";
		}
		
		System.out.println(tagnames);
		System.out.println(os);
		if(tagnames == null || tagnames.length == 0) {
			tagnames = new String[1];
			tagnames[0] = "";
		}
		if(os == null || os.length == 0) {
			os = new String[1];
			os[0] = "";
		}
		
		
		searchMap.put("keyword", keyword);
		searchMap.put("order", order);
		searchMap.put("by", by);
		searchMap.put("tagnames", tagnames);
		searchMap.put("os", os);
		searchMap.put("page", page);
		
		List<GameAndTagsRequest> resultList = storeDAO.selectResultList(searchMap);
		
		for(GameAndTagsRequest gvo : resultList) {
			gvo.getSprice();
		}
		
		return resultList;
	}
}













