<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="popularList" value="${storeMap.popularList}" />
<c:set var="newList" value="${storeMap.newList}" />
<c:set var="saleList" value="${storeMap.saleList}" />
<c:set var="freeList" value="${storeMap.freeList}" />

<body>
	<nav class="navbar navbar-light navbar-expand-md navigation-clean-search" style="padding: 10px; width: 100%; text-align: center; background-color: white; z-index: 999; position: fixed;">
		<div class="container">
			<button style="outline: none;" data-toggle="collapse" class="ml-auto navbar-toggler" data-target="#navcol-1">
				<span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navcol-1" style="text-align: center;">
				<div style="margin: auto; display: flex;">
					<ul class="nav navbar-nav" style="">
						<li style="cursor: pointer;" class="nav-item"><a style="padding: 8px 8px; color: black;" class="nav-link" href="javascript:goPage('${menu.murl}','${menu.mcode }');">Store</a></li>
						<li style="cursor: pointer;" class="nav-item"><a style="color: gray;" class="nav-link" href="list.do">List</a></li>
					</ul>
					<div class="form-inline" target="_self" style="">
						<div class="form-group" style="margin: auto;">
							<form id="searchForm" action="list.do" method="post" >
								<input style="border-bottom: 1px solid #eee;" class="form-control search-field" type="search" id="search-field" name="keyword" placeholder="Search"> 
							</form>
							<button style="outline:0; border:0; background-color:white; cursor: pointer;" onclick="$('#searchForm').submit();"> 
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<div style="padding-top: 60px;">
		<!-- <GoodGame> -->
		<section id="GoodGame" class="portfolio-block" style="padding: 0px 0px 0px 0px; height: 445px;">
			<div class="container" style="padding: 0px; height: 395px;">

				<div class="row">
					<div style="display: block; height: 35px; margin: 0px 5px;">
						<h3 class="mr-auto" style="display: inline-block; margin: 0px 0px 3px;">인기 게임</h3>
<!-- 						<a style="height: 33px; font-weight: bold; padding: 3px 10px 0px 10px; margin: 0px 0px 8px; display: inline-block;" class="ml-auto btn btn-light" role="button" href="#">MORE</a> -->
					</div>
				</div>
				
				<div class="row" style="">
					<div class="col-md-12 text row" style="padding: 0px; border-radius: 20px; background-color: white-space; height: 400px;">
						<!-- slide -->
						<div style="display: inline-block;" class="carousel slide col-md-12" data-ride="carousel" id="carousel-1">
							<div class="carousel-inner" style="margin: 0px 5px;">
								<c:forEach items="${popularList}" var="popular" varStatus="status">
									<c:set var="first" value=""/>
									<c:if test="${status.first}">
										<c:set var="first" value="active"/>
									</c:if>
									<div class="carousel-item ${first} }">
										<a href="javascript:window.parent.location.href='detail.do?gno=${popular.gno}'">
											<div class="row">
												<div class="col-md-8">
													<img style="border-radius:5px; height: 400px;" class="w-100 d-block" src="<%=request.getContextPath()%>/common/getImage.do?picName=${popular.thumbnail}" alt="Slide Image">
													<a class="carousel-control-prev" href="#carousel-1" role="button" data-slide="prev"> 
														<i style="color:white;font-size:70px;" class="fas fa-angle-left"></i>
														<span class="sr-only">Previous</span>
													</a> 
													<a class="carousel-control-next" href="#carousel-1" role="button" data-slide="next"> 
														<i style="color:white;font-size:70px;" class="fas fa-angle-right"></i>
														<span class="sr-only">Next</span>
													</a>
												</div>
												<div class="col-md-4">${popular.simcontent }</div>
											</div>
										</a>
									</div>
								</c:forEach>
							</div>
							
							<div class="col-md-8">
								<ol class="carousel-indicators">
									<c:if test="${fn:length(popularList) > 0 }">
									<c:forEach begin="0" step="1" end="${fn:length(popularList)-1 }" varStatus="status">
										<c:set var="active" value=""/>
										<c:if test="${status.first}">
											<c:set var="active" value="active"/>
										</c:if>
										<li data-target="#carousel-1" data-slide-to="${status.index}" class="${active}"></li>
									</c:forEach>
									</c:if>
								</ol>
							</div>
						</div>
						<!-- /slide -->
					</div><!-- /text -->
				</div>
				<!-- /row -->
			</div>
		</section>
		<!-- /#GoodGame -->
		
		<!-- <newGameRow> -->
		<section id="newGameRow" class="portfolio-block" style="padding: 12px;">
			<div class="container" style="padding: 0px;">
				<div class="row" style="">
					<div style="height: 35px; margin: 0px 5px;">
						<h3 style="display: inline-block; margin: 0px 0px 3px; ">신규 게임</h3>
<!-- 						<a style="height: 33px; font-weight: bold; padding: 3px 10px 0px 10px; margin: 0px 0px 8px; display: inline-block;" class="btn btn-light" role="button" href="#">MORE</a> -->
					</div>
				</div>
				<div class="row" style="height: 390px;">
				
					<c:forEach items="${newList}" var="newList">
						<div class="col-md-3" style="padding: 0px 5px; height: 390px; cursor: pointer;" onclick="window.parent.location.href='detail.do?gno=${newList.gno}'">
							<div class="card special-skill-item border-0" style="text-align: left;">
								<div class="card-header bg-transparent border-0" style="padding: 0px;">
									<div data-id="picture" style="height: 300px; background-color: white; border-radius: 5px;">
										<img style="border-radius:5px; height: 100%; width: 100%;" src="<%=request.getContextPath() %>/common/getImage.do?picName=${newList.thumbnail}">
									</div>
								</div>
								
								<div class="card-body" style="padding: 0px;">
									<div>
										<!-- title subtitle -->
										<span style="height: 22px; margin: 5px 0px; display: block; background-color: white; border-radius: 5px;">${newList.gname}</span> 
										<span style="color:gray; height: 23px; display: block; background-color: white; border-radius: 5px;">${newList.developer}</span>
	
										<div style="height: 23px; margin-top: 5px; background-color: white; border-radius: 5px;">
											<div style="display: inline-block;">
												<!-- sale price -->   
												<span class="" style="margin: 0px 0px 0px 0px;">₩ <fmt:formatNumber value="${newList.price}" type="number" /></span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
		<!-- /#newGameRow -->

		<section class="portfolio-block" style="padding: 0px;">
			<div class="container" style="padding: 0px;">
				<div class="row" style="height: 35px;">
					<h3 style="display: inline-block; margin: 0px 0px 3px 5px;">특별 할인</h3>
<!-- 					<a style="height: 33px; font-weight: bold; padding: 3px 10px 0px 10px; margin: 0px 0px 8px; display: inline-block;" class="btn btn-light" role="button" href="#">MORE</a> -->
				</div>

				<div class="row">
				
					<c:forEach items="${saleList}" var="saleList">
						<div class="col-lg-4 item" style="padding: 0px 5px; cursor: pointer;" onclick="window.parent.location.href='detail.do?gno=${saleList.gno}'">
							<div data-id="picture" style="height: 250px; border-radius: 5px; background-color: white;">
								<img style="border-radius:5px; height: 100%; width: 100%;" src="<%=request.getContextPath()%>/common/getImage.do?picName=${saleList.thumbnail}">
							</div>
							<div>
								<span style="margin-top:5px; height: 23px; display: block; background-color: white; border-radius: 5px;">
									<fmt:formatDate value="${saleList.startdate}" pattern="yyyy.MM.dd" /> ~ <fmt:formatDate value="${saleList.enddate}" pattern="yyyy.MM.dd" />
								</span>
								
								<!-- title sale time -->
								<span style="height: 23px; margin: 5px 0px; display: block; background-color: white; border-radius: 5px;">${saleList.gname }</span> 
								<span style="color:gray; height: 23px; display: block; background-color: white; border-radius: 5px;">${saleList.developer}</span>
								
								<div style="height: 23px; margin-top: 5px; background-color: white; border-radius: 5px;">
									<div style="display: inline-block;">
										<!-- sale price -->   
										<span class="" style="color:#5589F9; margin: 0px 8px 0px 0px;">${saleList.sprice}%</span>
										<span class="" style="color:gray; text-decoration:line-through; margin: 0px 0px 0px 0px;">₩ <fmt:formatNumber value="${saleList.price}" type="number" /></span>
										<span class="" style="margin: 0px 0px 0px 8px;">₩ <fmt:formatNumber value="${(1-(saleList.sprice / 100)) * saleList.price}" type="number" /></span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					
				</div>
			</div>
		</section>

		<!-- <HotFreeGame> -->
		<section id="HotFreeGame" class="portfolio-block" style="padding: 25px 25px 30px 25px;">
			<div class="container" style="padding: 0px;">
				<div class="row">
					<div style="height: 35px;">
						<h3 style="display: inline-block; margin: 0px 0px 3px 5px; ">무료 게임</h3>
<!-- 						<a style="height: 33px; font-weight: bold; padding: 3px 10px 0px 10px; margin: 0px 0px 8px; display: inline-block;" class="btn btn-light" role="button" href="#">MORE</a> -->
					</div>
				</div>
				<div class="row" style="height: 390px;">
					<c:forEach items="${freeList}" var="freeList">
						<div class="col-md-3" style="padding: 0px 5px; cursor: pointer;" onclick="window.parent.location.href='detail.do?gno=${freeList.gno}'">
							<div class="card special-skill-item border-0" style="text-align: left;">
								<div class="card-header bg-transparent border-0" style="padding: 0px;">
									<div data-id="picture" style="height: 300px; background-color: white; border-radius: 5px;">
										<img style="border-radius:5px; height: 100%; width: 100%;" src="<%=request.getContextPath() %>/common/getImage.do?picName=${freeList.thumbnail}">
									</div>
								</div>
								<div class="card-body" style="padding: 0px;">
									<div>
										<!-- title subtitle -->
										<span style="height: 23px; margin: 5px 0px; display: block; background-color: white; border-radius: 5px;">${freeList.gname }</span> 
										<span style="color:gray; height: 23px; display: block; background-color: white; border-radius: 5px;">${freeList.developer }</span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
		<!-- /#HotFreeGame -->

	</div>