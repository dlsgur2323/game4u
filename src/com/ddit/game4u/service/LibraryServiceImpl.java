package com.ddit.game4u.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ddit.game4u.dao.LibraryDAO;
import com.ddit.game4u.dto.GameVO;
import com.ddit.game4u.dto.LibraryVO;

public class LibraryServiceImpl implements LibraryService{
	
	private LibraryDAO libraryDAO;
	public void setLibraryDAO(LibraryDAO libraryDAO) {
		this.libraryDAO = libraryDAO;
	}

	@Override
	public List<GameVO> getLibraryGameList(String email, String sort) throws SQLException {
		
		List<GameVO> libraryGameList = libraryDAO.selectLibraryByEmail(email, sort);
		
		return libraryGameList;
	}

}
