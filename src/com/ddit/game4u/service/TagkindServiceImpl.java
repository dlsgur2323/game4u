package com.ddit.game4u.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ddit.game4u.dao.TagkindDAO;
import com.ddit.game4u.dto.TagkindVO;

public class TagkindServiceImpl implements TagkindService{
	
	private TagkindDAO tagkindDAO;
	public void setTagkindDAO(TagkindDAO tagkindDAO) {
		this.tagkindDAO = tagkindDAO;
	}
	

	@Override
	public Map<String, Object> getTagList() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<TagkindVO> categoList = tagkindDAO.selectCategoList();
		List<TagkindVO> funcList = tagkindDAO.selectFuncList();
		List<String> osList = tagkindDAO.selectOSList();
		
		dataMap.put("categoList" , categoList);
		dataMap.put("funcList" , funcList);
		dataMap.put("osList" , osList);
		
		return dataMap;
	}

	

}
