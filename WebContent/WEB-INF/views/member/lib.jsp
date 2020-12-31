<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/lib.css">
	<!-- margin -->
	<div style="margin: 100px 0px 0px 0px;" ></div>
	
	<div class="container" style="padding: 0px 0px;">
		<!-- 정렬 기준 -->
		<div class="col-md-12" style="padding: 0px 0px 0px 5px; margin: 0px 0px 10px 0px;">
			<label for="cars" style="margin:0px;">정렬 기준 :</label> 
			<select onchange="getLibraryList(this);" name="" id="order" style="background-color:#F9F9FB; border: 0; outline: 0; text-align: center;">
				<option value="buydateDESC" <c:if test="${sort eq 'buydateDESC'}">selected</c:if>>구매일/내림차순</option>
				<option value="buydateASC" <c:if test="${sort eq 'buydateASC'}">selected</c:if>>구매일/오름차순</option>
				<option value="gnameASC" <c:if test="${sort eq 'gnameASC'}">selected</c:if>>이름순</option>
			</select>
		</div>
		
		<!-- item -->
		<div class="col-md-12">
			<div class="row">
				<c:forEach items="${libraryGameList}" var="library">
					<div class="col-md-3">
						<div class="card hover" style="padding: 0px; margin: 0px;">
							<div class="card-img" style="background-image: url(<%=request.getContextPath()%>/common/getImage.do?picName=${library.thumbnail})">
								<div class="overlay">
									<div class="overlay-content">
										<a style="" class="hover" href="gameDownload.do?gno=${library.gno}">Download</a>
									</div>
								</div>
							</div>
							<div class="card-content">
								<a href="">
									<p style="color: black; margin: 0px; font-size: 16px; text-align: center;">${library.gname}</p>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		
		
	</div>
	<!-- container -->
	
	<!-- margin -->
	<div style="margin-bottom: 50px;"></div>
	
	<%@ include file="lib_js.jsp" %>
	
