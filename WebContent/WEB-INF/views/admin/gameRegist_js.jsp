<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form role="imageForm1" action="upload/picture.do" method="post" enctype="multipart/form-data">
	<input type="file" id="inputPic_1" name="picture1" style="display: none;" onchange="uploadPicture(this,'1');">
</form>
<form role="imageForm2" action="upload/picture.do" method="post" enctype="multipart/form-data">
	<input type="file" id="inputPic_2" name="picture2" style="display: none;" onchange="uploadPicture(this,'2');">
</form>
<form role="imageForm3" action="upload/picture.do" method="post" enctype="multipart/form-data">
	<input type="file" id="inputPic_3" name="picture3" style="display: none;" onchange="uploadPicture(this,'3');">
</form>
<form role="imageForm4" action="upload/picture.do" method="post" enctype="multipart/form-data">
	<input type="file" id="inputPic_4" name="picture4" style="display: none;" onchange="uploadPicture(this,'4');">
</form>
<form role="imageForm5" action="upload/picture.do" method="post" enctype="multipart/form-data">
	<input type="file" id="inputPic_5" name="picture5" style="display: none;" onchange="uploadPicture(this,'5');">
</form>
<form role="imageForm6" action="upload/picture.do" method="post" enctype="multipart/form-data">
	<input type="file" id="inputPic_6" name="picture6" style="display: none;" onchange="uploadPicture(this,'6');">
</form>
<form role="imageForm7" action="upload/picture.do" method="post" enctype="multipart/form-data">
	<input type="file" id="inputPic_7" name="thumbnail" style="display: none;" onchange="uploadPicture(this,'7');">
</form>

<input type="hidden" name="pictures" id="picname_1">
<input type="hidden" name="pictures" id="picname_2">
<input type="hidden" name="pictures" id="picname_3">
<input type="hidden" name="pictures" id="picname_4">
<input type="hidden" name="pictures" id="picname_5">
<input type="hidden" name="pictures" id="picname_6">
<input type="hidden"  id="picname_7">

<script>

window.onload = function(){
	
	$('input[name="os"]').on('click',function(){
		if($(this).prop("checked")){
			$('#tableSYS'+this.value).css("display","block");
		}else {
			$('#tableSYS'+this.value).css("display","none");
		}
	})
}

function preViewPicture(inputImage,target){

	//미리보기
	if (inputImage.files && inputImage.files[0] ) {
		 
        var reader = new FileReader();
        
        reader.onload = function (e) {
        	//이미지 미리보기	        	
        	target.css({'background-image':'url('+e.target.result+')',
				  		'background-position':'center',
				  		'background-size':'cover',
				  		'background-repeat':'no-repeat'
        	});
        }
        reader.readAsDataURL(inputImage.files[0]);
	}
}


function uploadPicture(obj,num){

	var inputImage = obj;
	console.log(inputImage)

	var fileFormat = inputImage.value.substr(inputImage.value.lastIndexOf(".")+1).toUpperCase();
	//이미지 확장자 jpg 확인
	if(fileFormat!="JPG"){
		alert("이미지는 jpg 형식만 가능합니다.");
		return;
	} 
	//이미지 파일 용량 체크
	if(inputImage.files[0].size>1024*1024*1){
		alert("사진 용량은 1MB 이하만 가능합니다.");
		return;
	};
	
	var form = new FormData($('form[role="imageForm'+num+'"]')[0]);
	
	$.ajax({
		url:"<%=request.getContextPath()%>/admin/pictureUpload.do",
		data:form,
		type:'post',
		processData:false,
		contentType:false,
		success:function(data){
			//저장된 파일명 저장.
			console.log("에이잭스 성공 후 " + data);
			$('input#picname_' + num).val(data); // 변경시 삭제될 파일명
			preViewPicture(inputImage,$('div#gamePic_'+num));
		},
		error:function(error){
			alert("현재 사진 업로드가 불가합니다.");
		}
	});
	
	

};


</script>