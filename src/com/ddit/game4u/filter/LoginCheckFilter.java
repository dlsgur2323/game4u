package com.ddit.game4u.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddit.game4u.dto.MemberVO;


public class LoginCheckFilter implements Filter {
		
	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//ServletRequest는 세션이 없다. > 강제 캐스팅
		// exURLs에 포함되어있으면 filter 실행X
		// 제외할 URL 확인
		
		HttpServletRequest httpReq = (HttpServletRequest)request;
		HttpServletResponse httpResp = (HttpServletResponse)response;
		
		String reqUrl = httpReq.getRequestURI().substring(httpReq.getContextPath().length());
		System.out.println("request URI : " + reqUrl);
		// url check
		if(excludeCheck(reqUrl)) {
			chain.doFilter(request, response);
			return;
		}
		
		//login check
		HttpSession session = httpReq.getSession();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		//login 확인
		if(loginUser == null) { // 비로그인 상태
			
			httpResp.setContentType("text/html;charset=utf-8");
			PrintWriter out = httpResp.getWriter();
			out.println("<script>");
			out.println("alert('로그인은 필수입니다.');");
			out.println("if(window.opener){window.close();window.opener.parent.location.href='"
					+httpReq.getContextPath()
					+"/';}else{");
			out.println("window.parent.location.href='"+httpReq.getContextPath()+"/';");
			out.println("}");
			out.println("</script>");
			out.close();			
		}else {  //로그인 상태
			chain.doFilter(request, response);
		}
		
	}
	
	//init, doFilter에서 쓸 filter적용 제외될 url List
	private List<String> exURLs = new ArrayList<String>();

	public void init(FilterConfig fConfig) throws ServletException {
		// login check를 안하는 것이 더 적기 때문에, exclude할 url만 받는다.
		
		String excludeURLNames = fConfig.getInitParameter("exclude");
		StringTokenizer st = new StringTokenizer(excludeURLNames,",");
		while(st.hasMoreTokens()) {
			exURLs.add(st.nextToken());			
		}
		System.out.println(exURLs);
	}
	
	
	// url : 사용자가 요청한 url
	private boolean excludeCheck(String url) {
		
		boolean result = false;
		if(url.length()<=1) result = result || true; //index.jsp 때문에(로그인체크 안하고 index.jsp 열기 위해서)
		for(String exURL:exURLs) {
			if(url.indexOf(exURL)==1) {
				result = result || true;
			}
		}
		return result;		
	}
	
}



