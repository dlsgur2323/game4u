<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!-- The Modal -->
<div class="modal" id="signUpModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal body -->
			<div class="modal-body">
				<Button style="outline: none;" type="button" class="close" data-dismiss="modal">&times;</Button>

				<div style="padding: 20px 0px;">
					<div style="text-align: center; padding: 20px;">
						<h5 id=""
							style="margin: 0px; display: inline-block; font-weight: bold; background: -webkit-linear-gradient(#6091ef, #6091ef); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Sign
							Up</h5>
						<img id="logo" src="<%=request.getContextPath()%>/resources/img/logo.png" style="vertical-align: top; display: inline-block; margin: auto; width: 24px; height: 24px;">
						<h5 id=""
							style="margin: 0px; display: inline-block; font-weight: bold; background: -webkit-linear-gradient(#6091ef, #6091ef); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Game4U</h5>
					</div>


						<div style="margin-left:60px; padding: 5px 5px 5px 5px; display: inline-block;">
							<input type="email" class=" form-control" id="reg_email" name="email" placeholder=" 이메일" style="width: 280px; border-radius: 10px; margin: auto;">
						</div>

						
						<div style="display: inline-block;">
							<button type="button" class="btn btn-info" onclick="sendMail();" style="padding:5px; width: 60px; display: block; margin: auto; border-radius: 10px;">Check!</button>
						</div>
						<div id="signUp-email-error" style="font-size: 12px; width: 280px; margin: auto; display: none;">
							<span style="color:red;">이메일 형식에 맞지 않습니다.</span>
						</div>
						
						<div style="margin-left:60px; display: inline-block; padding: 5px 5px 5px 5px;">
							<input type="text" class=" form-control" id="emailCheckNum" name="emailCheckNum" placeholder="이메일 인증코드" style="width: 280px; border-radius: 10px; margin: auto;">
						</div>
						
						<div style="display: inline-block;">
							<button type="button" class="btn btn-info" onclick="checkAuth();"style="padding:5px; width: 60px; display: block; margin: auto; border-radius: 10px;">Check!</button>
						</div>


						<div style="padding: 5px;">
							<input type="text" class="form-control" id="nickName" name="name" placeholder="닉네임 입력" style="width: 280px; border-radius: 10px; margin-left:60px;">
						</div>
						
						<div style="padding: 5px;">
							<input type="password" class="form-control" id="reg_password" name="pwd" placeholder="비밀번호를 입력하세요" style="width: 280px; border-radius: 10px; margin-left:60px;">
						</div>

						<div id="signUp-password-error" style="font-size: 12px; width: 280px; margin: auto; display: none;">
							<span style="color:red;">특수문자, 영문자, 숫자 포함 형태의 8~15자리</span>
						</div>

						<div style="padding: 5px;">
							<input type="password" class="form-control" id="password2" name="password" placeholder="비밀번호 확인" style="width: 280px; border-radius: 10px; margin-left:60px;">
						</div>

						<div id="signUp-password-check-error" style="font-size: 12px; width: 280px; height: 30px; margin: auto; display: none;">
							<a> <input type="text" class="form-control form-control-sm" name="text1" readonly
								style="border: 0; outline: 0; background: none; cursor: pointer; text-align: left; color: #e60023; font-size: 12px; padding: 0px;" value="비밀번호가 일치하지 않습니다.">
							</a>
						</div>

						<div style="padding: 15px 5px 5px 5px;">
							<button type="button" onclick="regist();" class="btn btn-info" style="width: 280px; display: block; margin: auto; border-radius: 10px;">가입하기</button>
						</div>

				</div>
			</div>
		</div>
	</div>
</div>
</div>
<script>	
	var emailCheck = 0;
	var pwdCheck = 0;
	
	
	function registLoad(){
		
		$('#reg_password').on("input", function(){
			var regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			
			pwdCheck = 0;
			if(!regex.test($(this).val())){
				$('#signUp-password-error').css("display","block");
			} else {
				$('#signUp-password-error').css("display","none");
				pwdCheck = 1;
			}
		});
		$('#reg_email').on("input", function(){
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			emailCheck = 0;
			if(!regExp.test($(this).val())){
				$('#signUp-email-error').css("display","block");
			} else {
				$('#signUp-email-error').css("display","none");
			}
		});
	}
	
	function regist(){
		
		var email = $('#reg_email').val();
		var pwd = $('#reg_password').val();
		var name = $('#nickName').val();
		
		if(emailCheck == 0){
			alert("이메일 인증을 해주세요.");
			return;
		}
		if(pwdCheck == $('#password2').val()){
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		if(pwd == ""){
			alert("비밀번호를 입력해주세요.");
			return;
		}
		if(name == ""){
			alert("닉네임을 입력해주세요.");
			return;
		}
		
		regist_go();
		
	}
	function checkAuth(){
		$.ajax({
			url : "<%=request.getContextPath()%>/common/authCheck.do",
			data : { "checkNum" : $('#emailCheckNum').val() },
			type : "post",
			success : function(data){
				if(data == "ok"){
					alert("이메일 인증 완료!");
					emailCheck = 1;
				}
				if(data == "no"){
					alert("인증번호가 일치하지 않습니다.");
				}
				
			},
			error : function(){
				
			}
		})
		
	}
	
	function sendMail(){
		alert("인증번호를 전송합니다.");
		$.ajax({
			url : "<%=request.getContextPath()%>/common/emailCheck.do",
			data : { "email" : $('#reg_email').val() },
			type : "post",
			success : function(data){
				if(data == "ok"){
					alert("이메일로 인증번호가 전송되었습니다.");
				}
				if(data == "no"){
					alert("이미 가입된 이메일입니다.");
				}
				
			},
			error : function(){
				
			}
		})
	}
	
	function regist_go(){
		var email = $('#reg_email').val();
		var pwd = $('#reg_password').val();
		var name = $('#nickName').val();
		$.ajax({
			url : "<%=request.getContextPath()%>/common/regist.do",
			type : "post",
			data : {
					 "email" : email ,
					 "pwd" : pwd,
					 "name" : name
					},
			success : function(data){
				var res = data;
				if(res == "ok"){
					location.href="<%=request.getContextPath()%>/";
				};
				if(res == "no"){
					alert("로그인 정보가 일치하지 않습니다.");
				};
			},
			error : function(){
				
			}
		})
	}

</script>


