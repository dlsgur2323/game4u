<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page trimDirectiveWhitespaces="true"%>

<script>
window.onload = function(){
	osChk('windows');

}


function osChk(os){
	
	var div = $('.osdiv');
	
	for(var i = 0; i < div.length; i++){
		if($(div[i]).attr("id") == os){
			$(div[i]).css("display","block");
		} else {
			$(div[i]).css("display","none");
		}
	}
}


	
</script>
