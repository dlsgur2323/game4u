<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title><decorator:title default="Game4U" /></title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/fonts/ionicons.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/untitled.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/cart.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/fonts/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/Navigation-with-Search.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/styles.css">

<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.6.1/css/pikaday.min.css">

<decorator:head />

<style type="text/css">
 a.nav-link:link { color:white; text-decoration: none;}
 a.nav-link:visited { color:white; text-decoration: none;}
 a.nav-link:hover { color:white; text-decoration: underline;}
 li{
 	list-style: none;
 }

</style>
</head>



<c:set var="logoutVisible" value="inline-block"/>
<c:set var="loginVisible" value="none"/>


<c:if test="${loginUser ne null }">
	<c:set var="logoutVisible" value="none"/>
	<c:set var="loginVisible" value="inline-block"/>
</c:if>	


<body>
	<nav class="navbar navbar-dark navbar-expand-lg fixed-top bg-white portfolio-navbar gradient">
		<div class="container" style="padding: 0px;">
			<a style="margin: 0px 0px 0px -10px; padding: 0px 32px 0px 0px;" class="navbar-brand logo" href="<%=request.getContextPath()%>/store/iframe.do">Game4U</a>
			<button style="outline: none;" data-toggle="collapse" class="navbar-toggler" data-target="#navbarNav">
				<span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="nav navbar-nav">
					<li class="nav-item"><a class="nav-link active" href="<%=request.getContextPath()%>/store/iframe.do">Store</a></li>
					<li class="nav-item"><a class="nav-link" href="projects-grid-cards.jsp">News</a></li>
					<li class="nav-item"><a class="nav-link" href="cv.jsp">Support</a></li>
					
					<!-- 로그인 성공 후 -->
					<li style="display: ${loginVisible};" class="nav-item">
						<a class="nav-link" href="<%=request.getContextPath()%>/member/library.do">Library</a>
					</li>
				</ul>
			</div>

			<div class="collapse navbar-collapse" id="navbarNav" >
				<!-- 로그인 전 유효 -->
				<ul class="nav navbar-nav ml-auto" >
					<li style="display: ${logoutVisible};" class="nav-item"><button style="background: none; border: 0px; outline: 0;" class="btn nav-link" id="btn-logIn" data-toggle="modal" data-target="#logInModal">Log in</button></li>
					<li style="display: ${logoutVisible};" class="nav-item"><button style="background: none; border: 0px; outline: 0;" class="btn nav-link" onclick="registLoad();" id="btn-signUp" data-toggle="modal" data-target="#signUpModal">Sign up</button></li>
					
					<!-- 로그인 성공 후 유효 -->
					<li class="nav-item" style="display: ${loginVisible}; padding-left: 15px;">
						<a class="nav-link" href="<%=request.getContextPath()%>/member/myPage.do">
							<i style="color: white;" class="fas fa-user"></i>
							${loginUser.name }
						</a>
					</li>
					<li class="nav-item" style="display: ${loginVisible};">
						<a class="nav-link" href="<%=request.getContextPath()%>/cart/cartList.do">
							<i style="margin-right:3px; color: white;" class="fas fa-shopping-basket"></i>
							장바구니
						</a>
					</li>
					<li class="nav-item" style="padding:0px; display: ${loginVisible};">
						<a style="padding: 8px 0px 8px 8px" class="nav-link" href="<%=request.getContextPath()%>/common/logout.do">
							<i style="margin-right:3px; color: white;" class="fas fa-sign-out-alt"></i>
							로그아웃
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>