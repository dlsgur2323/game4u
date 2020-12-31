package com.ddit.game4u.action.member;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddit.game4u.action.Action;
import com.ddit.game4u.dto.GameVO;
import com.ddit.game4u.dto.LibraryVO;
import com.ddit.game4u.dto.MemberVO;
import com.ddit.game4u.service.LibraryService;

public class LibraryAction implements Action{
	
	private LibraryService libraryService;
	public void setLibraryService(LibraryService libraryService) {
		this.libraryService = libraryService;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "/member/lib";
		String email = ((MemberVO) request.getSession().getAttribute("loginUser")).getEmail();
		String sort = request.getParameter("sort");
		//System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>"+sort);
		
		try {
			List<GameVO> libraryGameList = libraryService.getLibraryGameList(email, sort);
			request.setAttribute("libraryGameList", libraryGameList);
			request.setAttribute("sort", sort);
			
		} catch (SQLException e) {
			url = "";
			e.printStackTrace();
		}
		
		return url;
	}

}
