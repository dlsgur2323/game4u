package com.ddit.game4u.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ddit.game4u.request.GameAndTagsRequest;

public interface StoreDAO {
	List<GameAndTagsRequest> selectResultList(Map<String, Object> searchMap) throws SQLException;
}
