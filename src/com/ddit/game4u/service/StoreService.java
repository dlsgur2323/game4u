package com.ddit.game4u.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ddit.game4u.request.GameAndTagsRequest;

public interface StoreService {

	List<GameAndTagsRequest> getResultList(HttpServletRequest request) throws SQLException;

}
