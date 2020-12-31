package com.ddit.game4u.action.member;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddit.game4u.action.Action;
import com.ddit.game4u.dao.GameDAO;
import com.ddit.game4u.dto.GameVO;
import com.ddit.game4u.utils.GetUploadPath;
import com.ddit.game4u.utils.MakeFileName;

public class GameDownloadAction implements Action {
	
	private GameDAO gameDAO;
	public void setGameDAO(GameDAO gameDAO) {
		this.gameDAO = gameDAO;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = "";

		int gno = Integer.parseInt(request.getParameter("gno"));

		try {
			
			GameVO game = gameDAO.selectGameByGno(gno);
			
			String uploadPath = GetUploadPath.getUploadPath("game.picture.upload");
			sendFile(request, response, game.getThumbnail(), uploadPath, game.getGname());

		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}

		return url;
	}

	private void sendFile(HttpServletRequest request, HttpServletResponse response, String fileName, String filePath, String gname)
			throws Exception {

		filePath = filePath + File.separator + fileName;

		// 	보낼 파일 설정.
		File downloadFile = new File(filePath);
		FileInputStream inStream = new FileInputStream(downloadFile);

		ServletContext context = request.getServletContext();
		// 파일 포맷으로 MIME를 결정한다.
		String mimeType = context.getMimeType(filePath);
		if (mimeType == null) {
			mimeType = "application/octet-stream";
		}

		// response 수정.
		response.setContentType(mimeType);
		response.setContentLength((int) downloadFile.length());

		// 파일명 한글깨짐 방지 : utf-8
		String downloadFileName = new String(downloadFile.getName().getBytes("utf-8"), "ISO-8859-1");
		downloadFileName = gname + MakeFileName.parseFileNameFromUUID(downloadFileName, "\\$\\$");

		// response header setting
		String headerKey = "Content-Disposition";
		String headerValue = String.format("attachment; filename=\"%s\"", downloadFileName);
		response.setHeader(headerKey, headerValue);

		// 파일 내보내기
		OutputStream outStream = null;
		try {
			outStream = response.getOutputStream();
			byte[] buffer = new byte[4096];
			int bytesRead = -1;

			while ((bytesRead = inStream.read(buffer)) != -1) {
				outStream.write(buffer, 0, bytesRead);
			}
		} finally {
			if (inStream != null)
				inStream.close();
			if (outStream != null)
				outStream.close();
		}
	}

}
