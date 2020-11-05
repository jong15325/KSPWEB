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
		$('#messageSendList').bind('click', function() {
			location.href="myMessageBox.do";
		});
		
		$('#sendReplyBtn').bind('click', function() {
			$('#messageBoxFrm').attr('action', 'sendReplyMessage.do');
			$('#messageBoxFrm').submit();
		});
		
		$('#messageDelete').bind('click', function() {
			swal({
				title: "정말 삭제하시겠습니까?",
				text: "삭제 후 복구는 불가능합니다",
				icon: "warning",
				buttons: true,
				dangerMode: true,
			}).then((willDelete) => {
				if (willDelete) {
					var messageId = $('#messageValue').val();
					var form_data = {
						num : messageId,
					};
					$.ajax({
						method : "post",
						dataType : "json",
						url : "myMessageBoxCheckDelete.do",
						data : form_data,
						success : function(){
							location.href = "myMessageBox.do";
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
									text: "오류 코드 22",
								  	icon: "warning",
								})
							}
						}
					});
				} else {
					swal("삭제를 취소하였습니다");
				}
			});
		});
	});
</script>
<style>

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
                            		<strong>쪽지함</strong>
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
                                		<%-- <li>
                                			<a href="mailbox.html">
                                				<i class="fa fa-trash-o"></i> 휴지통
                                				<c:if test="${inboxDeleteCount > 0}">
                                					<span class="label label-success float-right">${inboxDeleteCount}</span>
                                				</c:if>
                                			</a>
                                		</li> --%>
                            		</ul>
                            		<div class="clearfix">
                            		</div>
                        		</div>
                    		</div>
                		</div>
            		</div>
     				<div class="col-lg-9 animated fadeInRight">
     					<form name="messageBoxFrm" id="messageBoxFrm"  method="post">
                		    <input type="hidden" id="messageValue" name="messageValue" value="${messageBoxDto.num}"/>
                		    <input type="hidden" id="messageSender" name="messageSender" value="${messageBoxDto.sender}"/>
                		</form>
            			<div class="mail-box-header">
                			<div class="mail-tools tooltip-demo m-t-md">
                				<h4>
                        			<span class="font-normal"><img alt="image" src="${myInfoLevelImg}" style="width:12px"/></span>  ${messageBoxDto.sender}
                   				 </h4>
                    			<h5>
                    				<fmt:formatDate value="${messageBoxDto.send_date}" pattern="yyyy-MM-dd HH:mm:ss" var="reg_date" />
                        			<span class="font-normal">${reg_date}</span>
                    			</h5>
                			</div>
            			</div>
                		<div class="mail-box">
                			<div class="mail-body">
                    			<p>
                        			${messageBoxDto.msg}
                      			</p>
                			</div>
                        	<div class="mail-body text-right tooltip-demo">
                        		<button id="messageSendList" title="" class="btn btn-sm btn-white"><i class="fa fa-list"></i> 리스트</button>
                           		<button id="sendReplyBtn" href="sendReplyMessage.do" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Reply"><i class="fa fa-reply"></i> 답장</button>
                                <button id="messageDelete" title="" data-placement="top" data-toggle="tooltip" data-original-title="Trash" class="btn btn-sm btn-white"><i class="fa fa-trash-o"></i> 삭제</button>
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