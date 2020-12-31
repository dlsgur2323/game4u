<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="categoList" value="${dataMap.categoList }" />
<c:set var="funcList" value="${dataMap.funcList }" />
<c:set var="osList" value="${dataMap.osList }" />
<body>
	<style>
		.taglabel:hover{
			background : #bfbfbf;
		}
		.taglabel{
			margin-bottom:0px;
			line-height: 35px;
			padding-left: 15px;
			padding-right : 15px;
		}
	</style>

	<nav class="navbar navbar-light navbar-expand-md navigation-clean-search" style="padding: 10px; width: 100%; text-align: center; background-color: white; z-index: 1; position: fixed;">
		<div class="container" style="padding: 0px;">
			<div class="collapse navbar-collapse row" id="navcol-1" style="">

				<ul class="nav navbar-nav mr-auto" style="">
					<li style="cursor: pointer;" class="nav-item"><a style="padding: 8px 8px 0px 5px; color: gray;" class="nav-link" href="store.do">Store</a></li>
					<li style="cursor: pointer;" class="nav-item"><a style="color: black;" class="nav-link" href="#">List</a></li>
				</ul>

				<div class="form-inline" style="">
					<div class="form-group" style="margin: auto;">
						<input style="width: 215px; border-bottom: 1px solid #eee;" value="${keyword }" class="form-control search-field" type="search" id="search-field" name="search" placeholder="Search">
						 <label style="cursor: pointer;" for="search-field">
						  <button onclick="getPageKeyword();" style="margin-right: 15px;background:none;border:0;" ><i class="fa fa-search"></i></button>
						</label>
						<input type="hidden" id="keyword" name="keyword" value="${keyword }">
					</div>
				</div>

			</div>
		</div>
	</nav>

	<div class="container" style="height:auto;">
		<div class="row" style="padding: 70px 0px;">
			<div id="leftt" class="" style="width: 760px; display: inline-block; margin: 0px 15px 0px 0px;">
				<nav class="navbar navbar-light navbar-expand-md navigation-clean-search" style="padding: 5px; height: 30px; width: 100%; text-align: center; background-color: white; z-index: 999;">
					<div class="container" style="padding: 0px;">
						<div class="row">
								<label for="cars" style="margin:0px;">정렬 기준 :</label> 
								<select onchange="getPage(0)" name="" id="order" style="border: 0; outline: 0; text-align: center;">
									<option value="regDate">출시일</option>
									<option value="saleRate">판매량</option>
									<option value="priceASC">가격:오름차순</option>
									<option value="priceDESC">가격:내림차순</option>
								</select>
						</div>
						<c:if test="${loginUser.admin eq 1 }">
						<div class="col-md-4" style="text-align: right;">
							<a href="javascript:void(0);" onclick="window.parent.location.href='<%=request.getContextPath() %>/admin/gameRegistForm.do';" >게임등록</a>
						</div>
						</c:if>
					</div>
				</nav>


						
				<!-- <HotFreeGame> -->
				<section id="HotFreeGame" class="portfolio-block" style="padding: 5px">
					<div class="container" style="padding: 0px;">

						<div class="row" id="gameListCard" style="height:auto;">
							<div id="tempDiv"></div>
							<!-- card -->
							
							<!-- /card -->
							
						</div>
						<!-- /row -->
					</div>
				</section>
			</div>

			<div class="aside ml-auto" style="">
				<div style="height: 30px; margin: 5px 0px;">필터</div>
				<div id="rightt" style="display: inline-block; width: 230px; height: 300px;">
					<div class="col-md-12" style="padding:0;">
					
							<p style="margin-top: 10px;margin-bottom:5px; padding-left:15px;">카테고리</p>
							<ul style="list-style:none; padding-left : 0px;">
						<c:forEach items="${categoList}" var="tag">
								<li class="tagli" style="display:block;height:35px;">
									<label for="${tag.tagname}" class="taglabel" style="cursor:pointer; display: block;">
										<input type="checkbox" value="${tag.tagname}" name="tag" id="${tag.tagname}">
										&nbsp;&nbsp;&nbsp;&nbsp;${tag.tagname}
									</label>
								</li>
						</c:forEach>
							</ul>
							<hr/>
						
							<p style="margin-top: 10px;margin-bottom:5px; padding-left:15px;">기능</p>
							<ul style="list-style:none; padding-left : 0px;">
						<c:forEach items="${funcList}" var="tag">
								<li class="tagli" style="display:block;height:35px;">
									<label for="${tag.tagname}" class="taglabel" style="cursor:pointer; display: block;">
										<input type="checkbox" value="${tag.tagname}" name="tag" id="${tag.tagname}">
										&nbsp;&nbsp;&nbsp;&nbsp;${tag.tagname}
									</label>
								</li>
						</c:forEach>
						<c:forEach items="${osList}" var="os">
								<li class="tagli" style="display:block;height:35px;">
									<label for="${os}" class="taglabel" style="cursor:pointer; display: block;">
										<input type="checkbox" value="${os}" name="os" id="${os}">
										&nbsp;&nbsp;&nbsp;&nbsp;${os}
									</label>
								</li>
						</c:forEach>
							</ul>
						<hr/>
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container" style="padding: 10px;">
		<div class="row" style="padding: 0px; margin-bottom: 30px; width: 770px;">
			<button type="button" id="moreBtn" onclick="getPage(1);" class="btn" style="font-size:12px; color:#332a2a; padding:0px; background-color: #EAEAEB; border-radius: 5px; width: 780px; display: block; margin: auto; border-radius: 10px;">더 불러오기</button>
		</div>
	</div>
	
	<%@ include file="list_js.jsp" %>