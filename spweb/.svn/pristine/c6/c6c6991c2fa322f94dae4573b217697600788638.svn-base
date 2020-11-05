<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<%@ include file="../template/head.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('#changePassword').bind("propertychange change keyup paste input", function checkLength() {
			var checkValue = 0;
			var pwChecker = /^[a-z|A-Z|0-9|\!\@\#\$\%\^\&\*]+$/;
			var objstr = $('#changePassword').val(); // 입력된 문자열을 담을 변수 
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
					$('#changePassword').val("");
				}
			}
			
			// 총바이트수가 허용된 문자열의 최대값을 초과하면
			if (bytesize > maxlen) {
				checkValue = 2;
				objstr2 = objstr.substr(0, strlen);
				$('#changePassword').val(objstr2);
			}
			
			if(checkValue == 1){
				swal("영어, 숫자, 특수문자[!@#$%^&*]만 가능합니다");
			}else if(checkValue == 2){
				swal("영어/숫자/특수문자[!@#$%^&*] 1~12자만 가능합니다");
			}else if(checkValue == 3){
				swal("[!@#$%^&*]외 특수문자, 한자, 공백은 불가능합니다");
			}
			
			$('#changePassword').focus();
		});
		
		$('#myChangeBtn').on("click", function(){
			var changePassword = $('#changePassword').val();
			var changeusr_name = $('#changeusr_name').val();
			var form_data = {
					changePassword : changePassword,
					changeusr_name : changeusr_name,
			};
			$.ajax({
				method : "post",
				dataType : "json",
				url : "myInfoPasswordCheck.do",
				data : form_data,
				success : function(data){
					if(data == 0){
						location.href = "userLogin.do";
					}else if(data == 1){
						location.href = "myInformationChange.do";
					}else if(data == 2){
						$("#userPasswordCheckMessage").empty();
						$("#userPasswordCheckMessage").html("비밀번호가 일치하지 않습니다");
					}else if(data == 3){
						$("#userPasswordCheckMessage").empty();
						$("#userPasswordCheckMessage").html("비밀번호를 입력해주세요");
					}
				},
				error : function(request, status, error){
					if('${sessionScope.userInfoSession == null}'){
						swal({
							text: "세션이 만료되었습니다.",
							icon: "warning",
							confirm : "OK",
						}).then((willDelete) => {
							location.href = "userLogin.do"
						});
					}else{
						swal({
							title : "오류가 발생하였습니다",
							text: "오류 코드 19",
						  	icon: "warning",
						})
					}
				}
			});
		});
	});
</script>
<style>

</style>
<body class="gray-bg">

<div class="lock-word animated fadeInDown">
    <span class="first-word">LOCKED</span><span>SCREEN</span>
</div>
    <div class="middle-box text-center lockscreen animated fadeInDown">
        <div>
            <div class="m-b-md">
            	<!-- <img alt="image" class="rounded-circle circle-border" src="f"> -->
            	<img style="max-width: 130px;" alt="image" class="rounded-left" src="${myInfoCharImg}"/>
            </div>
            <h3>${userDTO.usr_name}</h3>
            <input id ="changeusr_name" name = "changeusr_name" type="hidden" class="form-control" value="${userDTO.usr_name}">
            <p id="userPasswordCheckMessage" class="text-danger">&nbsp;</p>
                <div class="form-group">
                    <input id ="changePassword" name = "changePassword" type="password" class="form-control" placeholder="비밀번호" required="">
                </div>
                <button id="myChangeBtn" type="submit" class="btn btn-success block full-width">확인</button>
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</body>
</html>