<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<%@ include file="../template/head.jsp"%>
<style>
/* body{
	background-img:url();
} */
video#bgvid {
	position : absolute;
	top : 0; 
	left : 0;
	min-width : 100 %;
	min-height : 100 %;
	width : auto;
	height : auto;
	z-index : -1000;
	overflow: hidden;
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
							swal({
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
												title : "오류가 발생하였습니다",
												text: "오류 코드 2",
												icon: "warning",
												confirm : "OK",
											}).then((willDelete) => {
												location.href = "userLogin.do"
											});
										}
									});	
								}
							});
						}
					},
					error : function(request, status, error){
						swal({
							title : "오류가 발생하였습니다",
							text: "오류 코드 3",
							  icon: "warning",
							})
					}
				});	
			}
		});
		
		
	});
	
	function registerCallFunction(){
		swal({
			text: "카카오 계정 인증 후 회원가입을 하시겠습니까?",
			icon: "info",
			buttons: true,
		})
		.then((willDelete) => {
			if (willDelete) {
				var serverip = '<spring:eval expression="@serverProperties['server.ip']"/>'
				alert(serverip);
				location.href="https://kauth.kakao.com/oauth/authorize?client_id=54956a942e84cb336582d1eb95702d4b&redirect_uri=http://"+serverip+"/oauth.do&response_type=code";
			}else{
				swal({
					text: "회원가입을 취소하였습니다",
					confirm : "OK",
				})
			}
		});
	}
</script>
<body class="gray-bg">
	<video autoplay loop poster = "img/background/1.webm" id="bgvid" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
		<!-- <source src = "./img/background/animated-yi-project.webm"type = "video / mp4"> -->
		<source src = "img/background/1.webm"type = "video/webm">
	</video>
    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>
                <h1 class="logo-name">SP</h1>
            </div>
            <h3>Welcome to SP.korea</h3>
            <p>
                <!--Continually expanded and constantly improved Inspinia Admin Them (IN+)-->
            </p>
            <p id="userLoginCheckMessage" class="text-danger">&nbsp;</p>
             <div class="form-group">
                    <input autocomplete="off" type="text" id="usr_name" class="form-control" placeholder="아이디" required="">
                </div>
                <div class="form-group">
                    <input type="password" id="usr_pw" class="form-control" placeholder="비밀번호" required="">
                </div>
                <button id="loginBtn" type="submit" class="btn btn-primary block full-width m-b">로그인</button>

                <a href="javascript:void(0);"><small>비밀번호 찾기</small></a>
                <a class="btn btn-sm btn-white btn-block" href="javascript:void(0);" onclick="registerCallFunction();">회원가입</a>
            
            <p class="m-t"><small>Survival Project 2019 &copy; 게임 저작권은 위메이드에 있습니다.</small></p>
        </div>
    </div>
    <%@ include file="../template/plugin_js.jsp"%>
</body>
</html>