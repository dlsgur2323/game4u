<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

	<footer class="page-footer">
		<div class="container">
			<div class="links">
				<a href="#">About me</a><a href="#">Contact me</a><a href="#">Projects</a>
			</div>
			<div class="social-icons">
				<a href="#"><i class="icon ion-social-facebook"></i></a><a href="#"><i class="icon ion-social-instagram-outline"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a>
			</div>
		</div>
	</footer>
	
	<%@ include file="../common/login.jsp"%>
	<%@ include file="../common/regist.jsp"%>

	<script src="<%=request.getContextPath()%>/resources/assets/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.6.1/pikaday.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/assets/js/theme.js"></script>
	
	
	
</body>
</html>
