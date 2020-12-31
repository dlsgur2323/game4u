<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="game" value="${detailMap.game }" />
<c:set var="systemList" value="${detailMap.systemList }" />
<c:set var="tagList" value="${detailMap.tagList }" />
<c:set var="gamePictureList" value="${detailMap.gamePictureList }" />

<c:set var="cr" value="\n"/>
<c:set var="br" value="<br/>"/>
<style>
/* Make the image fully responsive */
.carousel-inner img {
  width: 100%;
}
</style>


<div class="page lanidng-page">

	<nav class="navbar navbar-light navbar-expand-md navigation-clean-search" style="padding: 12px; width: 100%; text-align: center;">
		<div class="container">
			<button style="outline: none;" data-toggle="collapse" class="ml-auto navbar-toggler" data-target="#navcol-1">
				<span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navcol-1" style="text-align: center;">
				<div style="margin: auto; display: flex;">
					<ul class="nav navbar-nav" style="">
						<li style="cursor: pointer;" class="nav-item"><a style="padding: 8px 8px;" class="nav-link active" href="#">Store</a></li>
						<li style="cursor: pointer;" class="nav-item"><a style="" class="nav-link active" href="#">Search</a></li>
					</ul>
					<form class="form-inline" target="_self" style="">
						<div class="form-group" style="margin: auto;">
							<input style="border-bottom: 1px solid #eee;" class="form-control search-field" type="search" id="search-field" name="search"> <label style="cursor: pointer;" for="search-field">
								<i class="fa fa-search"></i>
							</label>
						</div>
					</form>
				</div>

			</div>
		</div>
	</nav>

	<section id="" class="portfolio-block" style="padding: 0px 0px 0px 0px; borde:1px;">
      <div class="container">
      <br><br><br>
         <div class="row"><h1>${game.gname }</h1>
         <c:if test="${loginUser.admin eq 1 }">
   <div class="col-md-9" style="text-align: right;">
      <a style=" color: blue;" href="javascript:void(0);" onclick="window.parent.location.href='<%=request.getContextPath() %>/admin/gameModifyForm.do?gno=${game.gno }';" >게임수정</a>
   </div>
   </c:if>      
         </div>
   
         <div class="row">
				<div id="demo" class="carousel slide col-md-8" data-ride="carousel">
				
				  <!-- Indicators -->
				  <ul class="carousel-indicators">
				    <c:forEach items="${gamePictureList }" varStatus="status">
				    	<c:set value="" var="active"/>
					  	<c:if test="${status.first }" >
					  		<c:set value="active" var="active"/>
					    </c:if>
				        <li data-target="#demo" data-slide-to="${status.index }" class="${active }"></li>
				    </c:forEach>
				  </ul>
				  
				  <!-- The slideshow -->
				  <div class="carousel-inner">
					  <c:forEach items="${gamePictureList }" var="gamePicture" varStatus="status">
					  	<c:set value="" var="active"/>
					  	<c:if test="${status.first }" >
					  		<c:set value="active" var="active"/>
					    </c:if>
					    <div class="carousel-item ${active }">
					      <img src="<%=request.getContextPath()%>/common/getImage.do?picName=${gamePicture.picture}" width="700" height="500">
					    </div>
					  </c:forEach>
				  </div>
				  
				  <!-- Left and right controls -->
				  <a class="carousel-control-prev" href="#demo" data-slide="prev">
				    <span class="carousel-control-prev-icon"></span>
				  </a>
				  <a class="carousel-control-next" href="#demo" data-slide="next">
				    <span class="carousel-control-next-icon"></span>
				  </a>
				</div>
				<div class="col-md-4">
					<div style="height: 370px;">
						<div style="height: 300px;">
							<h3>게임 요약 설명</h3> 
							<div style="width:350px;">${game.simcontent}</div>
						</div>
						<table>
							<tr>
								<td style="width: 70px;">출시일 : </td>
								<td><fmt:formatDate value="${game.reldate }" pattern="yyyy-MM-dd"/></td>
							</tr>
							<tr>
								<td>개발사 : </td>
								<td>${game.developer }</td>
							</tr>
							<tr>
								<td>배급사 : </td>
								<td>${game.distributor }</td>
							</tr>
						</table>
					</div>
					<hr>
					<div class="row">
					 
						<div class="col-md-8">가  &nbsp;&nbsp;&nbsp;&nbsp;격 : <fmt:formatNumber value="${game.price }" pattern="#,###" /> 원</div>
						<div class="col-md-4">
							<button type="button" class="btn btn-secondary" 
								onclick="location.href='<%=request.getContextPath()%>/cart/addCart.do?gno=${game.gno}'">🛒</button>
						</div>
					</div>
					<div class="row">
						<c:if test="${game.sprice ne 0 }">		
							<div class="col-md-8">할인율 : ${game.sprice } %</div>														
						</c:if>
					</div>
					<div class="row">
						<c:if test="${game.sprice ne 0 }">		
							<div class="col-md-8" style="color:red;">할인가 : <fmt:formatNumber value="${game.price * ((100-game.sprice)/100) }" pattern="#,###" /> 원</div>														
						</c:if>
					</div>
				</div >
			</div>
			<br>
			<div class="row" style="height: 400;">
				<h3>게임 상세 설명</h3> <br><br>
				<div style="width:1000px;">${game.content}</div>
			</div>
		</div>
	</section>
	
	<!-- 시스템요구사항 -->
	<section id="newGameRow" class="portfolio-block" style="padding: 50px;">
		<div class="container">
			<h3 style="display: inline-block;">시스템 요구사항</h3>
			<div >
				<!-- 숨기기 -->
				<a style="height: 33px; font-weight: bold; padding: 3px 10px 0px 10px; margin: 0px 0px 8px; 
						display: inline-block; color: black;" class="btn btn-light" role="button" href="javascript:osChk('windows');">Windows</a>
				<a style="height: 33px; font-weight: bold; padding: 3px 10px 0px 10px; margin: 0px 0px 8px; 
						display: inline-block; color: black;" class="btn btn-light" role="button" href="javascript:osChk('mac');">Mac</a>
				<a style="height: 33px; font-weight: bold; padding: 3px 10px 0px 10px; margin: 0px 0px 8px; 
						display: inline-block; color: black;" class="btn btn-light" role="button" href="javascript:osChk('linux');">Linux</a>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="card border-0">
						<c:forEach items="${systemList }" var="system">
							<div class="card-body osdiv" id="${system.os}">
									<h6>프로세서1 |</h6><p>&nbsp;&nbsp;&nbsp;&nbsp;${system.processor1}, &nbsp;&nbsp;&nbsp;&nbsp;${system.processor2}</p>
									<h6>메모리 |</h6><p>&nbsp;&nbsp;&nbsp;&nbsp;${system.memory}GB</p>
									<h6>그래픽1 |</h6><p>&nbsp;&nbsp;&nbsp;&nbsp;${system.graphic1}, &nbsp;&nbsp;&nbsp;&nbsp;${system.graphic2}</p>
									<h6>DirectX |</h6><p>&nbsp;&nbsp;&nbsp;&nbsp;${system.directx}</p>
									<h6>저장공간 |</h6><p>&nbsp;&nbsp;&nbsp;&nbsp;${system.disk}GB</p>
								<br>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	



</div>
<%@ include file="detail_js.jsp"%>
