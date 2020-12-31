<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="cardList" value="${dataMap.cardList }"/>
<c:set var="cartList" value="${dataMap.cartList }"/>
<c:set var="adList" value="${dataMap.adList }"/>
<c:set var="comList" value="${dataMap.cardcomList }"/>

<div style="padding-top: 120px;">
<section class="portfolio-block photography">
<div class="container" style="padding: 0px;">
	<div class="row">
		<div style="display: block; position: relative; left: 5%; margin: 0px 0px 20px 0px">
			<h3 class="mr-auto" style="display: inline-block;">내 카트</h3>
		</div>
	</div>
	<div class="col-md-8 usercarts" style="padding: 0px;">					
		<form method="post">
			<c:if test="${empty cartList}">
				<div class="row no-cart-list">
					<p>앗! 카트가 비었네요😲 <br> GAME4U에는 새 게임들이 가득합니다😉 <br> 스토어 가기 클릭클릭👉👉👉 </p>
					<button type="button" class="btn btn-warning btn-sm" id="libraryBtn2" onclick="javascript:window.parent.location.href='<%=request.getContextPath()%>/store/iframe.do'">스토어</button>
				</div>
			</c:if>
			<c:if test="${!empty cartList }">
				<div class="row">
					<button type="button" class="btn btn-outline-info btn-sm" id="selectAllBtn">전체선택</button>
				</div>
			</c:if>
			<c:forEach items="${cartList}" var="cart">
				<div class="row cart-list">
					<div class="cart check-box">
						<input type="checkbox" class="checkcart" name="cartNo" value="${cart.cartno }">
						<input type="hidden" class="checkflag" value="0">
						<input type="hidden" class="gnos" name="gno" value="${cart.gno }">
					</div>
					<div class="cart">
						<img src="<%=request.getContextPath()%>/common/getImage.do?picName=${cart.thumbnail }" alt="게임썸네일이미지" class="thumbnail">
					</div>
					<div class="cart game-name">
						<span class="gname-span">${cart.gname }</span>
					</div>
					<div class="cart price-info">
						<div class="price">
							<span class="price-span">￦<fmt:formatNumber value="${cart.price }" type="number"/></span>
							<%-- <a href="javascript:removeCart(${cart.cartno });" onclick="return false;"  class="badge badge-danger" >Remove</a> --%>
							<span class="badge badge-danger removeBtn">Remove</span>
						</div>
						<div class="sprice">
							<span class="spercent-span">${cart.sprice }%</span>
							<span class="sprice-span"> &nbsp;&nbsp;&nbsp;￦<fmt:formatNumber value="${!empty cart.sprice ? cart.price * (100-cart.sprice) * 0.01 : cart.price }" type="number"/></span>
							<input class="finprice" type="hidden" value="${!empty cart.sprice ? cart.price * (100-cart.sprice) * 0.01 : cart.price}">
						</div>
					</div>
				</div>
					<hr>
			</c:forEach>
		</form>
	</div><!-- 카트리스트 끝 -->					
	<div class="col-md-3 adlists" style="margin-left: 30px; padding: 0px; border-radius: 10px; height: 150px;">
		<c:forEach items="${adList}" var="advertise" begin="0" end="1">
			<div class="row ad-games" style="cursor:pointer;" onclick="javascript:window.parent.location.href='<%=request.getContextPath()%>/store/detail.do?gno=${advertise.gno}'" >
				<img src="<%=request.getContextPath()%>/common/getImage.do?picName=${advertise.thumbnail }" alt="게임썸네일이미지" class="ad-thumbnail">
			</div>							
			<div class="card-body" style="padding: 0px; margin-left: -15px; padding-left:20px;">				
				<span  style="height: 22px; margin: 5px 0px; display: block; background-color: white; border-radius: 5px;">${advertise.gname}<span class="" style="padding-left:5px; padding-right:5px;margin: 0px 8px 0px 0px;"><span style="text-decoration: line-through;color:gray"> ₩ ${advertise.price}</span> / ￦<fmt:formatNumber value="${!empty advertise.sprice ? advertise.price * (100-advertise.sprice) * 0.01 : advertise.price }" type="number"/></span></span> 
			</div>						
			
		</c:forEach>
	</div><!-- 광고리스트 끝 -->
	<br>
	<div class="row totprice">
		<!-- <span id="totalprice"></span> -->
  		<div class="input-group-append currencydiv"><span class="input-group-text curspan">￦</span></div>
  		<input type="text" class="form-control" id="totalprice" readonly>
  	</div>
  	<div class="row buttons">
		<button type="button" class="btn btn-warning btn-sm" id="libraryBtn" onclick="javascript:window.parent.location.href='<%=request.getContextPath()%>/store/iframe.do'">더 둘러보기</button>
		<button type="button" class="btn btn-info btn-sm" id="purchaseBtn" disabled="disabled">결제하기</button>
	</div>	
</div>	

</section>
</div>
<!-- 결제 modal -->	
<div class="modal" tabindex="-1" id="paymodal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content paymodal">
      <div class="modal-header">
        <h5 class="modal-title">GAME4U PAYMENT</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<div class="container-fluid">
			<div class="row modaltitlerow">
		      	<p class="modaltitle"><strong>결제 방법</strong></p><!-- 카드 있으면 select나오게 -->
		    </div>
			<form id="cardforms">
		    <div class="row modaltitlerow">
		    	<div id="mycards">
			    	<select class="custom-select" id="cardselect">
						<option value="0" selected>직접 입력</option>
						<c:forEach items="${cardList}" var="mycards">
							<option value="${mycards.cardno }">${mycards.coName }</option>
						</c:forEach>					
					</select>
				</div>
				<div id="cardcompanies">
				    <select class="form-control" id="comselect" name="coName">
						<option value="1" selected>카드회사선택</option>
						<c:forEach items="${comList}" var="comList">
							<option value="${comList }">${comList }</option>
						</c:forEach>					
					</select>
				</div>
			</div>
			<div class="form-row mcardinfo">
				<div class="form-group col-5 mcardno">
					<label for="usercardno">카드번호</label>
					<input type="hidden" name="email" id="card_flag" value="none">
					<input type="text" class="form-control cardcontrol" placeholder="카드 번호" id="usercardno" name="cardNum" required oninvalid="this.setCustomValidity('카드번호는 필수입니다.')" oninput="this.setCustomValidity('')">
				</div>
				<div class="form-group col-4 mcardno">
					<label for="valiyrmonth">유효년월</label>
					<input type="month" class="form-control cardcontrol" placeholder="유효년월" id="valiyrmonth" name="valDate" required>
				</div>
				<div class="form-group col-2 mcardno">
					<label for="usercvc">CVC</label>
					<input type="text" class="form-control cardcontrol" placeholder="CVC" id="usercvc" name="cvc"  min="3" max="3" required>
				</div>				
			</div>
			<hr>
			<div class="row modaltitlerow">
		      	<p class="modaltitle"><strong>지불 정보</strong></p><!-- 카드 있으면 select나오게 -->
		    </div>
		    
		    <div class="form-row mnamerow">
		    	<div class="form-group col-5 mcardno">
		    		<label for="bname">이름</label>
					<input type="text" class="form-control cardcontrol" placeholder="이름" id="bname" name="name">
				</div>
		    </div>
		    <div class="form-row">
		    	<div class="form-group col-6 mcardno">
		    		<label for="baddress1">주소(시,군,구)</label>
					<input type="text" class="form-control cardcontrol" placeholder="주소 1(시,군,구)" id="baddress1" name="addr1"> 
				</div>
		    	<div class="form-group col-5 mcardno">
		    		<label for="bzipcode">우편번호</label>
					<input type="text" class="form-control cardcontrol" placeholder="우편번호" id="bzipcode" name="zip">
				</div>
		    </div>
		    <div class="form-row">
		    	<div class="form-group col-6 mcardno">
		    		<label for="baddress2">상세주소</label>
					<input type="text" class="form-control cardcontrol" placeholder="상세주소" id="baddress2" name="addr2" value="none">
				</div>
		    	<div class="form-group col-5 mcardno">
		    		<label for="bphone">전화번호</label>
					<input type="text" class="form-control cardcontrol" placeholder="전화번호" id="bphone" name="phone">
				</div>
		    </div>
		    </form>
			<div class="row input-group mb-3"><!-- 가격 -->
			  <input type="text" class="form-control" id="bfinprice">			  
			</div><!-- 가격끝 -->
		</div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" id="mpaybtn">결제하기</button>
      	</div>      	
      </div>
    </div><!-- modal 끝 -->
  </div>
</div>
	
<%@ include file="cart_js.jsp"%>
