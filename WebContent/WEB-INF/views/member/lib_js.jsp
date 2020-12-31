<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
	function getLibraryList(e){
		location.href = "<%=request.getContextPath()%>/member/library.do?sort=" + e.value;	
	}
</script>
<script src="<%=request.getContextPath()%>/resources/js/lib.js"></script>

