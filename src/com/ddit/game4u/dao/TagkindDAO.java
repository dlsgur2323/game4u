package com.ddit.game4u.dao;

import java.sql.SQLException;
import java.util.List;

import com.ddit.game4u.dto.TagkindVO;

public interface TagkindDAO {
	
	List<TagkindVO> selectCategoList() throws SQLException;
	
	List<TagkindVO> selectFuncList() throws SQLException;
	
	List<String> selectOSList() throws SQLException;
	
	

}
