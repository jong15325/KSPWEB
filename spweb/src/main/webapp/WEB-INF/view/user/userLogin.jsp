<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Survival Project</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!--===============================================================================================-->
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="loginPage/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="loginPage/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="loginPage/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="loginPage/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="loginPage/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="loginPage/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="loginPage/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="loginPage/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="loginPage/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="loginPage/css/util.css">
	<link rel="stylesheet" type="text/css" href="loginPage/css/main.css">
<!--===============================================================================================-->
</head>
<style>
/* body{
	background-img:url();
} */
video#bgvid {
	content: "";
    display: block;
    position: absolute;
    z-index: 0;
    width: 100%;
    height: 100%;
    min-width: 100%;
    min-height: 100%;
    top: 0;
    left: 0;
}

@media (max-width: 768px) {
  video#bgvid {
    width: 100%;
  }

  video#bgvid {
    display: none;
  }
  
  .login100-form {
  background-color: rgba( 255, 255, 255, 1 );
  }
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	$('#loginBtn').on("click", function(){
		var usr_name = $("#usr_name").val();
		var usr_pw = $("#usr_pw").val();
		var form_data = {
			usr_name : usr_name,
			usr_pw : usr_pw,
		};
		
		if(usr_name == "" || usr_pw == ""){
			$.ajax({
				success : function(){
					$("#userLoginCheckMessage").empty();
					$("#userLoginCheckMessage").html("아이디 또는 비밀번호를 입력하지 않았습니다");
				},
				error : function(request, status, error){
					swal({
						  title : "오류가 발생하였습니다",
						  text: "오류 코드 1",
						  icon: "warning",
						})
				}
			});
			/* 문자체크 들어가야함 */
		}else{
			$.ajax({
				method : "post",
				dataType : "json",
				url : "userLoginProcess.do",
				data : form_data,
				success : function(data){
					if(data.loginFlag == 0){ // 정보 불일치
						$("#userLoginCheckMessage").empty();
						$("#userLoginCheckMessage").html("아이디 또는 비밀번호가 일치하지 않습니다");
					}else if(data.loginFlag == 1){ // 로그인
						location.href = "index.do";
					}else if(data.loginFlag == 2){
						$.ajax({
							method : "post",
							dataType : "json",
							url : "alReadyConnected.do",
							data : form_data,
							success : function(data){
								location.href = "index.do";
							},
							error : function(request, status, error){
								swal({
									text: "로그인을 다시 해주세요",
									icon: "warning",
									confirm : "OK",
								}).then((willDelete) => {
									location.href = "userLogin.do"
								});
							}
						});	
						/*swal({
							text: usr_name+" 님이 이미 접속 중입니다. 기존 접속을 종료할까요?	",
							icon: "warning",
							buttons: true,
						})
						.then((willDelete) => {
							if (willDelete) {
								$.ajax({
									method : "post",
									dataType : "json",
									url : "alReadyConnected.do",
									data : form_data,
									success : function(data){
										location.href = "index.do";
									},
									error : function(request, status, error){
										swal({
											text: "로그인을 다시 해주세요",
											icon: "warning",
											confirm : "OK",
										}).then((willDelete) => {
											location.href = "userLogin.do"
										});
									}
								});	
							}
						});*/
					}
				},
				error : function(request, status, error){
					swal({
						title : "오류가 발생하였습니다",
						text: "서버가 점검 중이거나 오류로 인해 접속할 수 없습니다",
						  icon: "warning",
						})
				}
			});	
		}
	});
	
	/* https://zero-gravity.tistory.com/245 참고 -> 후에 분석 후 페이지에 맞게 수정 예정*/
	
	var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
    $("input[name='id']").val(userInputId); 
     
    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
                                           // 아이디 저장하기 체크되어있을 시,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 발생시
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });  
    
});

$(window).load(function(){
	var usr_name = $("#usr_name").val();
	if($("#idSaveCheck").is(":checked")){
		if(usr_name != ""){
			$("#usr_name").attr('class','input100 has-val');
			$("#usr_pw").focus();
		}
	}
});

function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

function registerCallFunction(){
	swal({
		text: "카카오 계정 인증 후 회원가입을 하시겠습니까?",
		icon: "info",
		buttons: true,
	})
	.then((willDelete) => {
		if (willDelete) {
			/* config에서 설정하게끔 수정해야함 */
			var serverip = '121.143.130.115';
			location.href="https://kauth.kakao.com/oauth/authorize?client_id=89a2eedb9149fcf10961b9b07f166dc9&redirect_uri=http://"+serverip+"/oauth.do&response_type=code";
		}else{
			swal({
				text: "회원가입을 취소하였습니다",
				confirm : "OK",
			})
		}
	});
}

</script>
<body style="background-color: #666666;">
	<video autoplay loop poster = "img/background/main.png" id="bgvid" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
		<source src = "img/background/1.webm"type = "video/webm">
		<source src = "img/background/1.mp4"type = "video/mp4">
	</video>
	<div class="limiter">
		 <div class="container-login100">
			 <div class="wrap-login100" style="background-color: black;">
				<div class="login100-form validate-form">
					<span class="login100-form-title p-b-43">
						LOGIN
					</span>
					<p id="userLoginCheckMessage" class="text-danger" style="text-align: center;">&nbsp;</p>
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input id="usr_name" class="input100" type="text" name="id">
						<span class="focus-input100"></span>
						<span class="label-input100">아이디</span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input id="usr_pw" class="input100" type="password" name="pass">
						<span class="focus-input100"></span>
						<span class="label-input100">비밀번호</span>
					</div>

					<div class="flex-sb-m w-full p-t-3 p-b-32">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="idSaveCheck" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="idSaveCheck">
								아이디 기억
							</label>
						</div>
					</div>
			

					<div class="container-login100-form-btn">
						<button id="loginBtn" type="submit" class="login100-form-btn">
							접속
						</button>
					</div>
					
					<div class="text-center p-t-46 p-b-20">
						<a class="btn btn-sm btn-white btn-block" href="javascript:void(0);" onclick="registerCallFunction();">회원가입</a>
					</div>

					<div class="login100-form-social flex-c-m">
					</div>
				</div>
			</div>
		 </div> 
	</div>
	
	

	
	
<!--===============================================================================================-->
	<script src="loginPage/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="loginPage/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="loginPage/vendor/bootstrap/js/popper.js"></script>
	<script src="loginPage/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="loginPage/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="loginPage/vendor/daterangepicker/moment.min.js"></script>
	<script src="loginPage/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="loginPage/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="loginPage/js/main.js"></script>
<!--===============================================================================================-->
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!--===============================================================================================-->
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<!--===============================================================================================-->
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<%@ include file="../template/plugin_js.jsp"%>
</body>
</html>