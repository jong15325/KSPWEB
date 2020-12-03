<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<%@ include file="../template/head.jsp"%>
<script type="text/javascript">

	$(document).ready(function() {
		//회원 가입 페이지 접속 시 세션에 카카오 아이디가 없다면 userLogin으로 리턴
		var kakao_id = "${sessionScope.kakao.kakao_id}";
		if(kakao_id == ""){
			$.ajax({
				success : function(){
					swal({
						text: "카카오 세션이 종료되었습니다. 다시 진행해주세요",
						icon: "warning",
						confirm : "OK",
					}).then((willDelete) => {
						location.href = "userLogin.do"
					});
				},
				error : function(request, status, error){
					swal({
						text: "카카오 세션이 종료되었습니다. 다시 진행해주세요",
						icon: "warning",
						confirm : "OK",
					}).then((willDelete) => {
						location.href = "userLogin.do"
					});
				}
			});
		}
		
		var agreeValue = 0;
		var nameCheckValue = 3;
		var nameCheck = "";
		
		$('#agreeLink').bind("click", function(){
			$.ajax({
				success : function(){
					swal({
						title: "이용 규칙 준수",
						text: "동의하십니까?",
						icon: "info",
						buttons: true,
						//dangerMode: true,
					})
					.then((willDelete) => {
						if (willDelete) {
							swal({
								icon: "success",
								text: "동의하였습니다.",
							})
							agreeValue = 1;
							$('#agreeLink').remove();
						} else {
							swal("동의없이 회원가입은 불가능합니다");
						}
					});
				},
				error : function(request, status, error){
					swal({
						title : "오류가 발생하였습니다",
						text: "오류 코드 4",
						  icon: "warning",
						})
				}
			});
		});
		
		$('#registerBtn').on("click", function(){
			var checkValue = 1;
			var kakao_id = ${sessionScope.kakao.kakao_id}9;
			var usr_name = $("#usr_name").val();
			var usr_pw = $("#usr_pw").val();
			var re_usr_pw = $("#re_usr_pw").val();
			var usr_gender = $("#usr_gender").val();
			var kakao_str = kakao_id.toString().slice(0,-1);
			
			var form_data = {
					kakao_id : 0,
					usr_name : usr_name,
					usr_pw : usr_pw,
					usr_gender : usr_gender,
			};
			
			if(usr_name == ""){
				checkValue = 2;
				$.ajax({
					success : function(){
						$("#userRegisterCheckMessage").empty();
						$("#userRegisterCheckMessage").html("아이디를 입력하지 않았습니다");
					},
					error : function(request, status, error){
						swal({
							title : "오류가 발생하였습니다",
							text: "오류 코드 5",
							  icon: "warning",
							})
					}
				});
			}else if(usr_pw == ""){
				checkValue = 3;
				$.ajax({
					success : function(){
						$("#userRegisterCheckMessage").empty();
						$("#userRegisterCheckMessage").html("비밀번호를 입력하지 않았습니다");
					},
					error : function(request, status, error){
						swal({
							title : "오류가 발생하였습니다",
							text: "오류 코드 6",
							  icon: "warning",
							})
					}
				});
			}else if(re_usr_pw == ""){
				checkValue = 4;
				$.ajax({
					success : function(){
						$("#userRegisterCheckMessage").empty();
						$("#userRegisterCheckMessage").html("확인 비밀번호를 입력하지 않았습니다");
					},
					error : function(request, status, error){
						swal({
							title : "오류가 발생하였습니다",
							text: "오류 코드 7",
							  icon: "warning",
							})
					}
				});
			}else if(re_usr_pw != usr_pw){
				checkValue = 5;
				$.ajax({
					success : function(){
						$("#userRegisterCheckMessage").empty();
						$("#userRegisterCheckMessage").html("입력한 비밀번호가 다릅니다");
						$("#re_usr_pw").css("border","2px solid #ed5565");
						$("#usr_pw").css("border","2px solid #ed5565");
					},
					error : function(request, status, error){
						swal({
							title : "오류가 발생하였습니다",
							text: "오류 코드 8",
							  icon: "warning",
							})
					}
				});
			}
			
			if(re_usr_pw == usr_pw){
				$.ajax({
					success : function(){
						$("#re_usr_pw").css("border","");
						$("#usr_pw").css("border","");
					},
					error : function(request, status, error){
						swal({
							title : "오류가 발생하였습니다",
							text: "오류 코드 9",
							  icon: "warning",
							})
					}
				});
			}
			
			if(nameCheckValue == 3){
				checkValue = 7;
				$.ajax({
					success : function(){
						$("#userRegisterCheckMessage").empty();
						$("#userRegisterCheckMessage").html("아이디를 체크해주세요");
					},
					error : function(request, status, error){
						swal({
							title : "오류가 발생하였습니다",
							text: "오류 코드 10",
							  icon: "warning",
							})
					}
				});
			}else{
				if(nameCheck != usr_name){
					checkValue = 6;
					$.ajax({
						success : function(){
							$("#userRegisterCheckMessage").empty();
							$("#userRegisterCheckMessage").html("체크한 아이디와 입력된 아이디가 다릅니다");
						},
						error : function(request, status, error){
							swal({
								title : "오류가 발생하였습니다",
								text: "오류 코드 11",
								  icon: "warning",
								})
						}
					});
				}
			}
			
			/* 문자체크 들어가야함. */
			if(checkValue == 1 ){
				if(agreeValue == 1){
					if(kakao_id != 9){
						$.ajax({
							method : "post",
							dataType : "json",
							url : "userRegisterProcess.do",
							data : form_data,
							success : function(data){
								if(data.registerFlag == 1){
									var usr_name = data.usr_name;
									var usr_pw = data.usr_pw;
									var form_data = {
										usr_name : usr_name,
										usr_pw : usr_pw,
									};
									$.ajax({
										method : "post",
										dataType : "json",
										url : "userLoginProcess.do",
										data : form_data,
										success : function(data){
											location.href = "index.do";
										},
										error : function(request, status, error){
											swal({
												title : "오류가 발생하였습니다",
												text: "오류 코드 12",
												  icon: "warning",
												})
										}
									});
								}else if(data.registerFlag == 2){
									$("#userRegisterCheckMessage").empty();
									$("#userRegisterCheckMessage").html("로그인한 카카오 아이디는 이미 등록되어있습니다");
								}else if(data.registerFlag == 3){
									$("#userRegisterCheckMessage").empty();
									$("#userRegisterCheckMessage").html("입력한 게임아이디는 이미 존재합니다");
								}
							},
							error : function(request, status, error){
								swal({
									title : "오류가 발생하였습니다",
									text: "오류 코드 13",
									  icon: "warning",
									})
							}
						});	
					}else{
						$.ajax({
							success : function(){
								swal({
									text: "카카오 세션이 종료되었습니다. 다시 진행해주세요",
									icon: "warning",
									confirm : "OK",
								}).then((willDelete) => {
									location.href = "userLogin.do"
								});
							},
							error : function(request, status, error){
								swal({
									text: "카카오 세션이 종료되었습니다. 다시 진행해주세요",
									icon: "warning",
									confirm : "OK",
								}).then((willDelete) => {
									location.href = "userLogin.do"
								});
							}
						});
					}
				}else{
					$.ajax({
						success : function(){
							$("#userRegisterCheckMessage").empty();
							$("#userRegisterCheckMessage").html("약관에 동의하지 않았습니다");
						},
						error : function(request, status, error){
							swal({
								title : "오류가 발생하였습니다",
								text: "오류 코드 14",
								  icon: "warning",
								})
						}
					});
				}
			}
		});
		
		$('#usr_name_check').on("click", function() {
			var checkValue = 0;
			var idChecker = /^[가-힣|a-z|A-Z|0-9|\-]+$/;
			var objstr = $('#usr_name').val(); // 입력된 문자열을 담을 변수
			var objstrlen = objstr.length; // 전체길이
			// 변수초기화 
			var minlen = 2;
			var maxlen = 12; // 제한할 글자수 최대크기
			var i = 0; // for문에 사용 
			var bytesize = 0; // 바이트크기 
			var strlen = 0; // 입력된 문자열의 크기
			var onechar = ""; // char단위로 추출시 필요한 변수 
			var objstr2 = ""; // 허용된 글자수까지만 포함한 최종문자열
			
			// 입력된 문자열의 총바이트수 구하기
			for (i = 0; i < objstrlen; i++) {
				// 한글자추출 
				onechar = objstr.charAt(i);
				if (escape(onechar).length > 4) {
					bytesize += 2; // 한글이면 2를 더한다.
				} else {
					bytesize++; // 그밗의 경우는 1을 더한다.
				}
				
				if (bytesize <= maxlen) { // 전체 크기가 maxlen를 넘지않으면
					strlen = i + 1; // 1씩 증가
				}
			}
			
			if(objstr != ""){
				if(!idChecker.test(objstr)){
					checkValue = 3;
					$('#usr_name').val("");
				}
			}
			
			// 총바이트수가 허용된 문자열의 최대값을 초과하면
			if (bytesize > maxlen || bytesize < minlen) {
				checkValue = 2;
				objstr2 = objstr.substr(0, strlen);
				$('#usr_name').val(objstr2);
			}
			
			if(objstr == ""){
				checkValue = 3;
			}
			
			if(checkValue == 1){
				swal("한글, 영어, 숫자, 특수문자 '-'만 가능합니다");
			}else if(checkValue == 2){
				swal("한글 1~6자, 영어/숫자 2~12자, 특수문자 '-'만 가능합니다");
			}else if(checkValue == 3){
				swal("'-'외 특수문자, 한자, 공백은 불가능합니다");
			}else{
				var form_data = {
						usr_name : objstr,
				};
				$.ajax({
					method : "post",
					dataType : "json",
					url : "userRegisterNameCheck.do",
					data : form_data,
					success : function(data){
						if(data == 0){
							nameCheckValue = 0;
							nameCheck = objstr;
							$("#usr_name_check").empty();
							$("#usr_name_check").html("<i class='fa fa-check'></i>");
							$("#usr_name_check").prop("disabled", true);
							$("#usr_name_check").css("border","2px solid #17a2b8");
							$("#usr_name_check").css("background-color","#17a2b8");
						}else{
							swal("이미 가입된 아이디입니다");
						}
					},
					error : function(request, status, error){
						swal({
							title : "오류가 발생하였습니다",
							text: "오류 코드 15",
							  icon: "warning",
							})
					}
				});
				
			}
			
			$('#usr_name').focus();
		});
		
		$('#usr_name').on("propertychange change keyup paste input", function() {
			nameCheckValue = 3;
			$("#usr_name_check").empty();
			$("#usr_name_check").html("체크");
			$("#usr_name_check").prop("disabled", false);
			$("#usr_name_check").css("border","2px solid #ed5565");
			$("#usr_name_check").css("background-color","#ed5565");
		});
		
		$('#usr_pw').bind("propertychange change keyup paste input", function checkLength() {
			var checkValue = 0;
			var pwChecker = /^[a-z|A-Z|0-9|\!\@\#\$\%\^\&\*]+$/;
			var objstr = $('#usr_pw').val(); // 입력된 문자열을 담을 변수 
			var objstrlen = objstr.length; // 전체길이
			// 변수초기화 
			var maxlen = 12; // 제한할 글자수 최대크기
			var i = 0; // for문에 사용 
			var bytesize = 0; // 바이트크기 
			var strlen = 0; // 입력된 문자열의 크기
			var onechar = ""; // char단위로 추출시 필요한 변수 
			var objstr2 = ""; // 허용된 글자수까지만 포함한 최종문자열
			
			// 입력된 문자열의 총바이트수 구하기
			for (i = 0; i < objstrlen; i++) {
				// 한글자추출 
				onechar = objstr.charAt(i);
				if (escape(onechar).length > 4) {
					bytesize += 2; // 한글이면 2를 더한다.
				} else {
					bytesize++; // 그밗의 경우는 1을 더한다.
				}
				
				if (bytesize <= maxlen) { // 전체 크기가 maxlen를 넘지않으면
					strlen = i + 1; // 1씩 증가
				}
				
			}
			
			if(objstr != ""){
				if(!pwChecker.test(objstr)){
					checkValue = 3;
					$('#usr_pw').val("");
				}
			}
			
			// 총바이트수가 허용된 문자열의 최대값을 초과하면
			if (bytesize > maxlen) {
				checkValue = 2;
				objstr2 = objstr.substr(0, strlen);
				$('#usr_pw').val(objstr2);
			}
			
			if(checkValue == 1){
				swal("영어, 숫자, 특수문자[!@#$%^&*]만 가능합니다");
			}else if(checkValue == 2){
				swal("영어/숫자/특수문자[!@#$%^&*] 1~12자만 가능합니다");
			}else if(checkValue == 3){
				swal("[!@#$%^&*]외 특수문자, 한자, 공백은 불가능합니다");
			}
			
			$('#usr_pw').focus();
		});
	});
</script>
<body class="gray-bg">

    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <h3>회원가입</h3>
            <p id="userRegisterCheckMessage" class="text-danger">&nbsp;</p>
            	<div class="form-group">
            		<div class="input-group">
                		<input id="usr_name" type="text" class="form-control" name="usr_name" placeholder="생성할 닉네임">
                  		<span class="input-group-append">
                  			<button id="usr_name_check" class="btn btn-primary" name="usr_name" style="background-color:#ed5565; border:2px solid #ed5565;">체크</button>
                  		</span>
                	</div>
            	</div>
                <div class="form-group">
                    <input style="ime-mode:disabled;" id="usr_pw" type="password" class="form-control" name="usr_pw" placeholder="생성할 비밀번호">
                </div>
                <div class="form-group">
                    <input style="ime-mode:disabled;" id="re_usr_pw" type="password" class="form-control" name="re_usr_pw" placeholder="생성할 비밀번호 확인">
                </div>
                <div class="form-group">
					<select id="usr_gender" name= "usr_gender" class="select2_demo_1 form-control select2-hidden-accessible" tabindex="-1" aria-hidden="true">
						<option value="0">남자</option>
						<option value="1">여자</option>
					</select>
                </div>
                <div class="form-group">
                    <button id="agreeLink" class="btn btn-w-m btn-link"> 이용약관 보기 </button>
                	<!-- <div class="modal inmodal show" id="myModal2" tabindex="-1" role="dialog" style="display: none; padding-right: 17px;">
						<div class="modal-dialog">
							<div class="modal-content animated flipInY">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
									<h4 class="modal-title">이용약관</h4>
									<small class="font-bold"></small>
								</div>
								<div class="modal-body">
									<p><strong>1. 규칙 2. 규칙</strong></p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-white" data-dismiss="modal">동의안함</button>
									<button id="agreeBtn" type="button" class="btn btn-primary" data-dismiss="modal">동의</button>
								</div>
							</div>
						</div>
                	</div> -->
                </div>
                <button id="registerBtn" class="btn btn-primary block full-width m-b">등록</button>
                <a class="btn btn-sm btn-white btn-block" href="userLogin.do">로그인으로</a>
            <p class="m-t"> <small>This page was created by Jung Jong-han</small> </p>
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/inspinia.js"></script>
    
    <!-- iCheck -->
    <script src="js/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>
</body>
</html>