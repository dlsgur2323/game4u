<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="padding-top: 120px;">
<section class="portfolio-block photography">
<div class="container" style="padding: 0px;">
				<div class="row">
					<div style="display: block;">
						<h3 class="mr-auto" style="display: inline-block;">카트 페이지</h3>
					</div>
				</div>
				<div class="row">
					<button type="button" class="btn btn-outline-info btn-sm" id="selectAllBtn" onclick="selectAll()">전체선택</button>
				</div>
					<div class="col-md-8" style="padding: 0px;">
					<form method="post">
				<%-- <c:forEach items="cartList" var="cart"> --%>				
						<div class="row">					
							
							<div class="row cart-list">
								<div class="cart check-box">
									<input type="checkbox" class="checkcart" name="cartNo" value="1">
								</div>
								<div class="cart thumbnail">
									<img src="" alt="게임썸네일이미지">
								</div>
								<div class="cart price-info">
									<div class="price">
										<span class="price-span">50,000원</span>
									</div>
									<div class="sprice">
										<span class="sprice-span">30%</span>
									</div>
								</div>
							</div>
						</form>			
					</div>					
					<div class="col-md-3" style="margin-left: 30px; padding: 0px; border-radius: 10px; background-color: gray; height: 150px;">
						<img src="" alt="게임썸네일이미지">
					</div>
<%-- 				</c:forEach> --%>
				</div>
				
				<div class="col-md-4" style="padding: 0px;">
				</form>
<%-- 				<c:forEach> --%>
					<div class="row">
							
							<div class="row cart-list">
								<div class="cart check-box">
									<input type="checkbox" class="checkcart" name="cartNo" value="1">
								</div>
								<div class="cart thumbnail">
									<img src="" alt="게임썸네일이미지">
								</div>
								<div class="cart price-info">
									<div class="price">
										<span class="price-span">50,000원</span>
									</div>
									<div class="sprice">
										<span class="sprice-span">30%</span>
									</div>
								</div>
							</div>
									
					</div>					
					<div class="col-md-3" style="margin-left: 30px; padding: 0px; border-radius: 10px; background-color: gray; height: 150px; background-image: url(../resources/img/staduTest.jpg); background-size:cover;">
						<%-- <img src="<%=request.getContextPath() %>/resources/img/staduTest.jpg" alt="게임썸네일이미지"> --%>
						<span>스타듀밸리</span><br>
						<span>50,000원 -> 40,000원</span>
					</div>
<%-- 					</c:forEach> --%>
				</div>

</div>	

</section>
</div>
	
<%@ include file="cart_js.jsp" %>
