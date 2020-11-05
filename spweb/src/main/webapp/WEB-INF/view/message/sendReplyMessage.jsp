<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<%@ include file="../template/head.jsp"%>
<link href="css/magic-check.css" rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function() {
		var nameCheckValue = 0;
		
		$('#send1').bind("propertychange change keyup paste input", function checkLength() {
			var checkValue = 0;
			var objstr = $('#send1').val(); // 입력된 문자열을 담을 변수
			var objstrlen = objstr.length; // 전체길이
			// 변수초기화 
			var maxlen = 28; // 제한할 글자수 최대크기
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
				
				$('#length').val(bytesize); // 입력된 문자열을 담을 변수 
			}
			
			// 총바이트수가 허용된 문자열의 최대값을 초과하면
			if (bytesize > maxlen) {
				objstr2 = objstr.substr(0, strlen);
				$('#send1').val(objstr2);
			}
		});
		
		$('#send2').bind("propertychange change keyup paste input", function checkLength() {
			var checkValue = 0;
			var objstr = $('#send2').val(); // 입력된 문자열을 담을 변수
			var objstrlen = objstr.length; // 전체길이
			// 변수초기화 
			var maxlen = 28; // 제한할 글자수 최대크기
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
				
				$('#length').val(bytesize); // 입력된 문자열을 담을 변수 
			}
			
			// 총바이트수가 허용된 문자열의 최대값을 초과하면
			if (bytesize > maxlen) {
				objstr2 = objstr.substr(0, strlen);
				$('#send2').val(objstr2);
			}
		});
		
		$('#send3').bind("propertychange change keyup paste input", function checkLength() {
			var checkValue = 0;
			var objstr = $('#send3').val(); // 입력된 문자열을 담을 변수
			var objstrlen = objstr.length; // 전체길이
			// 변수초기화 
			var maxlen = 28; // 제한할 글자수 최대크기
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
				
				$('#length').val(bytesize); // 입력된 문자열을 담을 변수 
			}
			
			// 총바이트수가 허용된 문자열의 최대값을 초과하면
			if (bytesize > maxlen) {
				objstr2 = objstr.substr(0, strlen);
				$('#send3').val(objstr2);
			}
		});
		
		$('#send4').bind("propertychange change keyup paste input", function checkLength() {
			var checkValue = 0;
			var objstr = $('#send4').val(); // 입력된 문자열을 담을 변수
			var objstrlen = objstr.length; // 전체길이
			// 변수초기화 
			var maxlen = 28; // 제한할 글자수 최대크기
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
				
				$('#length').val(bytesize); // 입력된 문자열을 담을 변수 
			}
			
			// 총바이트수가 허용된 문자열의 최대값을 초과하면
			if (bytesize > maxlen) {
				objstr2 = objstr.substr(0, strlen);
				$('#send4').val(objstr2);
			}
		});
		
		$('#rcv_usr_name').on("propertychange change keyup paste input", function() {
			nameCheckValue = 0;
			$("#usr_name_check").empty();
			$("#usr_name_check").html("체크");
			$("#usr_name_check").prop("disabled", false);
			$("#usr_name_check").css("border","2px solid #f8ac59");
			$("#usr_name_check").css("background-color","#f8ac59");
		});
		
		 $('#usr_name_check').on("click", function() {
			var checkValue = 0;
			var idChecker = /^[가-힣|a-z|A-Z|0-9|\-]+$/;
			var objstr = $('#rcv_usr_name').val(); // 입력된 문자열을 담을 변수
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
					$('#rcv_usr_name').val("");
				}
			}
			
			// 총바이트수가 허용된 문자열의 최대값을 초과하면
			if (bytesize > maxlen || bytesize < minlen) {
				checkValue = 2;
				objstr2 = objstr.substr(0, strlen);
				$('#rcv_usr_name').val(objstr2);
			}
			
			if(objstr == ""){
				checkValue = 3;
			}
			
			if(checkValue == 1){
				swal("한글, 영어, 숫자, 특수문자 '-'만 가능합니다");
			}else if(checkValue == 2){
				swal("한글 1~6자, 영어/숫자 2~12자, 특수문자 '-'만 가능합니다");
			}else if(checkValue == 3){
				swal("'-'외 특수문자, 한자, 공백, 자음, 모음은 불가능합니다");
			}else{
				var form_data = {
						usr_name : objstr,
				};
				$.ajax({
					method : "post",
					dataType : "json",
					url : "userNameCheck.do",
					data : form_data,
					success : function(data){
						if(data == 0){
							nameCheckValue = 0;
							swal("존재하지 않는 아이디 입니다");
						}else if (data == 1){
							nameCheckValue = 1;
							nameCheck = objstr;
							$("#usr_name_check").empty();
							$("#usr_name_check").html("<i class='fa fa-check'></i>");
							$("#usr_name_check").prop("disabled", true);
							$("#usr_name_check").css("border","2px solid #17a2b8");
							$("#usr_name_check").css("background-color","#17a2b8");
						}else if(data == 2){
							nameCheckValue = 0;
							swal("자신에게는 쪽지를 보낼 수 없습니다");
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
								text: "오류 코드 32",
							  	icon: "warning",
							})
						}
					}
				});
				
			}
			
			$('#rcv_usr_name').focus();
		});
		 
		$('#sendMessageBtn').on("click", function() {
			if(nameCheckValue == 1){
				var send1Length = $('#send1').val().length;
				var send2Length = $('#send2').val().length;
				var send3Length = $('#send3').val().length;
				var send4Length = $('#send4').val().length;
				if( send1Length < 1 &&  send2Length < 1 && send3Length < 1 && send4Length < 1){
					swal("내용이 없는 쪽지는 발송할 수 없습니다");
				}else{
					var send1 = $('#send1').val();
					var send2 = $('#send2').val();
					var send3 = $('#send3').val();
					var send4 = $('#send4').val();
					var username= $('#rcv_usr_name').val();
					var messageType = 5;
					var form_data = {
							usr_name : username,
							send1 : send1,
							send2 : send2,
							send3 : send3,
							send4 : send4,
							messageType : messageType,
					};
					$.ajax({
						method : "post",
						dataType : "json",
						url : "sendMessageProcess.do",
						data : form_data,
						success : function(data){
							if(data == 0){
								location.href="myMessageBox.do";
							}else if(data == 1){
								swal("같은 유저에게 3분간 쪽지를 보낼 수 없습니다.");
							}
						},
						error : function(request, status, error){
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				}
			}else{
				swal("아이디 체크를 진행해주세요.");
			}
		});
		
	});
	
	function onKeyDown(value)
	{
		if(value == 1){
			if(event.keyCode == 13)
			{
				$('#send2').focus();
			}
		} else if(value == 2){
			if(event.keyCode == 13)
			{
				$('#send3').focus();
			}
		} else if(value == 3){
			if(event.keyCode == 13)
			{
				$('#send4').focus();
			}
		}
	}
	
</script>
<style>
.sendMessageInput{
	border-right : none;
	border-left : none;
	width : 190px;
	outline: none;
}
</style>
<body>
	<div class="wrapper">
	<%@ include file="../template/left_column.jsp"%>
		<div id="page-wrapper" class="gray-bg">
			<%@ include file="../template/header.jsp"%>
				<div class="row wrapper border-bottom white-bg page-heading">
					<div class="col-lg-10">
						<h2>쪽지함</h2>
							<ol class="breadcrumb">
								<li class="breadcrumb-item">
                            		<a href="index.do">메인</a>
                        		</li>
                       			<li class="breadcrumb-item">
                            		<strong>쪽지 보내기</strong>
                        		</li>
                    		</ol>
               		</div>
            		<div class="col-lg-2">
            		</div>
        		</div>
        		<div class="wrapper wrapper-content">
					<div class="row">
						<div class="col-lg-3">
                			<div class="ibox ">
                    			<div class="ibox-content mailbox-content">
                        			<div class="file-manager">
                            			<a class="btn btn-block btn-primary compose-mail" href="sendMessage.do">쪽지 작성</a>
                            			<div class="space-25">
                            			</div>
                           				<ul class="folder-list m-b-md" style="padding: 0">
                            				<li>
                            					<a href="myMessageBox.do">
                            						<i class="fa fa-envelope-o "></i> 받은 쪽지함
                            						<c:if test="${inboxUnreadCount > 0}">
                            							<span class="label label-warning float-right">${inboxUnreadCount}</span>
                            						</c:if>
                            					</a>
                            				</li>
                                			<li>
                                				<a href="mySendMessageBox.do">
                                					<i class="fa fa-send-o"></i> 보낸 쪽지함
                                					<c:if test="${inboxSendCount > 0}">
                                						<span class="label label-info float-right">${inboxSendCount}</span>
                                					</c:if>
                                				</a>
                                			</li>
                            			</ul>
                            			<div class="clearfix">
                            			</div>
                        			</div>
                    			</div>
                			</div>
            			</div>
            			<div class="col-lg-9 animated fadeInRight">
            				<div class="mail-box-header">
               		 			<h2>
                    				쪽지 작성
                				</h2>
            				</div>
                			<div class="mail-box">
                					<div class="mail-body">
                        				<div class="form-group row">
                            				<div class="input-group">
                            					<label class="col-sm-2 col-form-label">To :</label>
                           	 					<input id="rcv_usr_name" name="rcv_usr_name" placeholder="받을 사람을 입력하세요" type="text" class="form-control" value="${reply_usr_name}">
                            					<span class="input-group-append">
                  									<button id="usr_name_check" class="btn btn-primary" name="rcv_usr_name" style="background-color:#f8ac59; border:2px solid #f8ac59;">체크</button>
                  								</span>
                            				</div>
                        				</div>
                					</div>
                					<div class="mail-text h-200">
                        				<div style="width:100%; text-align: center; padding-top:35px;">
                        					<div>
                        						<input style="border-top:none;" onKeyDown="onKeyDown(1);" id="send1" class="sendMessageInput" type="text" value="">
                        					</div>
                        					<div>
                        						<input style="border-top:none;" onKeyDown="onKeyDown(2);" id="send2" class="sendMessageInput" type="text" value=""/>
                        					</div>
                        					<div>
                        						<input style="border-top:none;" onKeyDown="onKeyDown(3);" id="send3" class="sendMessageInput" type="text" value=""/>
                        					</div>
                        					<div>
                        						<input style="border-top:none;" onKeyDown="onKeyDown(4);" id="send4" class="sendMessageInput" type="text" value=""/>
                        					</div>
                        				</div>
                   		 			</div>
                    			<div class="mail-body text-right tooltip-demo">
                        			<button id="sendMessageBtn" class="btn btn-sm btn-success" data-toggle="tooltip" data-placement="top" title="Send"><i class="fa fa-reply"></i> 보내기</button>
                        			<a href="myMessageBox.do" class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="top" title="Discard email"><i class="fa fa-times"></i> 취소</a>
                    			</div>
                    			<div class="clearfix">
                    			</div>
                    		</div>
            			</div>
					</div>
	 			</div>
	 		<%@ include file="../template/footer.jsp"%>
		</div>
	</div>
	
    <!-- Mainly scripts -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>

    <!-- alert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>