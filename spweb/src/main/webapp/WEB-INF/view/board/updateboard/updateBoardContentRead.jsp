<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var replyAddBtn = 0;
		var urno = "";
			
		$('#updateBoardMain').bind('click', listRun);
		$('#updateBoardUpdate').bind('click', updateRun);
		$('#updateBoardDelete').bind('click', deleteRun);
		
		$("p img").css("width","100%");
		
		$('#replyAddSuccess').on("click", function(){
			var reply_writer = '${sessionScope.userInfoSession.usr_name}';
			var contentTrans = $("#reply_content").val().replace(/ /g, '&nbsp;');
			var reply_content = contentTrans.replace(/\n/gi, '<br/>');
			var reply_category = 0;
			var article_no = $("#article_no").val();
			var form_data = {
					reply_writer : reply_writer,
					reply_content : reply_content,
					reply_category : reply_category,
					article_no : article_no,
			};
			
			$.ajax({
				method : "post",
				dataType : "json",
				url : "updateReplyInsertProcess.do",
				data : form_data,
				success : function(data){
					/* alert('등록 성공'); */
					location.reload(true);
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
							text: "오류 코드 69",
						  	icon: "warning",
						})
					}
				}
			});	
		});
		
		$(document).on("click",".replyBtnDiv button", function() {
			switch($(this).text())	{
				case "삭제":
					$.ajax({
						method : "post",
						dataType : "json",
						url : "updateReplyDeleteProcess.do",
						data : "article_no=${contentView.article_no}&reply_no="+ $(this).prop("id"),
						success : function(data){
							/* alert('등록 성공'); */
							location.reload(true);
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
	    							text: "오류 코드 70",
	    						  	icon: "warning",
	    						})
	    					}
						}
					});	
				break;
				case "수정":
					var contentTrans = "";
					var update_reply = "";
					urno = $(this).prop("id");
					var form_data = {
							reply_no : urno,
					};
					$.ajax({
						method : "post",
						url : "updateReplyUpdateContentView.do",
						data : form_data,
						success : function(data){
							contentTrans = data.replace('&nbsp', '/ /g');
							update_reply = contentTrans.replace('<br/>', '/\n/gi');
							$("#reply_update_content").empty();
							$("#reply_update_content").html(update_reply);
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
	    							text: "오류 코드 71",
	    						  	icon: "warning",
	    						})
	    					}
						}
					});
				break;
					
			}
		});
		
		$('#replyUpdate').on('click', function(){
			var reply_no = urno;
			var contentTrans = $("#reply_update_content").val().replace(/ /g, '&nbsp;');
			var reply_content = contentTrans.replace(/\n/gi, '<br/>');
			var form_data = {
					reply_no : reply_no,
					reply_content : reply_content,
			};
			$.ajax({
				method : "post",
				dataType : "json",
				url : "updateReplyUpdateProcess.do",
				data : form_data,
				success : function(data){
					location.reload(true);
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
							text: "오류 코드 71",
						  	icon: "warning",
						})
					}
				}
			});	
		});
		
		function listRun() {
			$('#readFrm').attr('action', "updateBoardMain.do").submit();
		}

		function updateRun() {
			$('#readFrm').attr('action', "updateBoardUpdate.do").submit();
		}

		function deleteRun() {
			swal({
				title: "정말 삭제하시겠습니까?",
				text: "삭제 후 복구는 불가능합니다",
				icon: "warning",
				buttons: true,
				dangerMode: true,
			})
			.then((willDelete) => {
				if (willDelete) {
					$('#readFrm').attr('action', "updateBoardDeleteProcess.do").submit();
				} else {
					swal("삭제를 취소하였습니다");
				}
			});
		}
		
		function updateModalGetcontent(){
			var form_data = {
					reply_no : urno,
			};
			$.ajax({
				method : "get",
				dataType : "json",
				url : "updateReplyUpdateContentView.do",
				data : form_data,
				success : function(data){
					$("#reply_update_content").empty();
					$("#reply_update_content").html(data);
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
							text: "오류 코드 72",
						  	icon: "warning",
						})
					}
				}
			});
		}
	});
</script>
<%@ include file="../../template/head.jsp"%>
<body>
	<div class="wrapper">
	<%@ include file="../../template/left_column.jsp"%>
	<div id="page-wrapper" class="gray-bg">
	<%@ include file="../../template/header.jsp"%>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>게시판</h2>
					<ol class="breadcrumb">
						<li class="breadcrumb-item">
                            <a href="index.do">메인</a>
                        </li>
                        <li class="breadcrumb-item">
                            <span>커뮤니티</span>
                        </li>
                        <li class="breadcrumb-item active">
                            <strong>자유</strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>
            
			<div class="wrapper wrapper-content  animated fadeInRight article">
				<div class="row justify-content-md-center">
					<div class="col-lg-10">
                    	<div class="ibox">
							<div class="ibox-content">
                            <div class="text-center article-title">
                            <span class="text-muted"><i class="fa fa-clock-o"></i><fmt:formatDate value="${contentView.article_regdate}" pattern="yyyy-MM-dd HH:mm"/></span>
                                <h1 style="font-size:20px;">${contentView.article_title}</h1>
                            </div>
                            <div class="contentDiv">
                            	<p style="font-size:13px;">${contentView.article_content}</p>
                            </div>
                           
                           
                            <hr>
                            <div class="row">
                                <div class="col-md-6">
                                        <h5>Tags:</h5>
                                        <form name="readFrm" id="readFrm" method="get">
											<input type="hidden" name="currentPage" value="${currentPage}" />
											<input id="article_no" type="hidden" name="article_no" value="${contentView.article_no}" />
                                        	<button id = "updateBoardMain" class="btn btn-primary btn-xs" type="button">목록</button>
											<c:if test="${sessionScope.userInfoSession.usr_name == contentView.article_writer}">
                                       			<button id = "updateBoardUpdate" class="btn btn-white btn-xs" type="button">수정</button>
												<button id = "updateBoardDelete" class="btn btn-white btn-xs" type="button">삭제</button>
                                       		</c:if>
										</form>
                                </div>
                                <div class="col-md-6">
                                    <div class="small text-right">
                                        <h5>Stats:</h5>
                                        <div> <i class="fa fa-comments-o"> </i> ${replyCount} comments </div>
                                        <i class="fa fa-eye"> </i> ${contentView.article_viewcnt} views
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-12">
                                    <h2>Comments:</h2>
                                    <c:forEach items="${contentViewReply}" var="replyList">
                                    <div class="social-feed-box">
                                        <div class="social-avatar">
                                            <div class="media-body">
                                                <a href="javascript:void(0);">
                                                    ${replyList.reply_writer}
                                                </a>
                                                <jsp:useBean id="now" class="java.util.Date" />
												<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
												<fmt:formatDate value="${replyList.reply_reg_date}" pattern="yyyy-MM-dd" var="reg_date" />
                                                <c:choose>
                                                	<c:when test="${reg_date == today}">
                                                		<i id= "fa-calendar" class="fa fa-clock-o"> </i>
                                                		<small class="text-muted"><fmt:formatDate value="${replyList.reply_reg_date}" pattern="HH:mm" /></small>
                                                	</c:when>
                                                	<c:otherwise>
                                                		<i id= "fa-calendar" class="fa fa-calendar"> </i>
                                                		<small class="text-muted"><fmt:formatDate value="${replyList.reply_reg_date}" pattern="MM-dd" /></small>
                                                	</c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <div id ="" class="social-body">
                                            <p>
                                                 ${replyList.reply_content}
                                            </p>
                                            <c:if test="${sessionScope.userInfoSession.usr_name == replyList.reply_writer || sessionScope.userInfoSession.usr_admin >= 6}">
                                            <div class="modal inmodal show" id="myModal" tabindex="-1" role="dialog" style="display: none; padding-right: 17px;">
                                				<div class="modal-dialog">
                                					<div class="modal-content animated bounceInRight">
                                       					<div class="modal-header">
                                            				<button type="button" class="close" data-dismiss="modal"><span class="sr-only">Close</span></button>
                                            				<!-- <i class="fa fa-laptop modal-icon"></i> -->
                                           					<h4 class="modal-title">댓글 수정</h4>
                                            				<!-- <small class="font-bold">ㅈㅈ</small> -->
                                        				</div>
                                        				<div class="modal-body">
                                                    		<div class="form-group">
                                                    			<textarea id="reply_update_content" class="form-control" style="resize: none;"></textarea>
                                                    		</div>
                                        				</div>
                                        				<div class="modal-footer">
                                            				<button id="replyClose" type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
                                            				<button id="replyUpdate" type="button" class="btn btn-primary">수정</button>
                                        				</div>
                                    				</div>
                                				</div>
                            				</div>
                            				<div class="replyBtnDiv">
                            					<button id = "${replyList.reply_no}" class="btn btn-white btn-xs" type="button" data-toggle="modal" data-target="#myModal">수정</button>
												<button id = "${replyList.reply_no}" class="btn btn-white btn-xs" type="button">삭제</button>
                            				</div>
											</c:if>
                                        </div>
                                    </div>
                                    </c:forEach>
                                	<div class="input-group m-b">
                                		<textarea id = "reply_content"class="form-control" style="width:80%;resize: none;"></textarea>
                                		<button id = "replyAddSuccess" class="btn btn-white btn-xs" type="button" style="background:#1c84c6; color:white; width:20%"><i class="fa fa-reply"></i></button>
                                	</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<%@ include file="../../template/footer.jsp"%>
	 </div>
	  <%@ include file="../../template/chatBox.jsp"%>
	  <%-- <%@ include file="../../template/right_column.jsp"%> --%>
	</div>
	<%@ include file="../../template/plugin_js.jsp"%>
</body>
</html>