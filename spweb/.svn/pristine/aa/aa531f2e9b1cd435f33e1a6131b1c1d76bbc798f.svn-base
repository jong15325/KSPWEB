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
		$('#messageBoxRefresh').bind('click', function() {
			location.reload(true);
		});
		
		$('#myMessageBoxCheckDelete').bind('click', function() {
			var check_article_no = "";
			var checked = false;
			var count = 0;
			var article_chk = document.getElementsByName("listCheckBox");
			for(i = 0; i < article_chk.length; i++){
				if(article_chk[i].checked){
					count++;
					if(check_article_no != ""){
						check_article_no = article_chk[i].value + ',' + check_article_no;
					}else{
						check_article_no = article_chk[i].value;
					}
				}
			}
			
			if(count > 0){
				swal({
					title: "정말 삭제하시겠습니까?",
					text: "삭제 후 복구는 불가능합니다",
					icon: "warning",
					buttons: true,
					dangerMode: true,
				})
				.then((willDelete) => {
					if (willDelete) {
						var form_data = {
								num : check_article_no,
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
										text: "오류 코드 30",
									  	icon: "warning",
									})
								}
							}
						});
					} else {
						swal("삭제를 취소하였습니다");
					}
				});
			}else{
				swal("삭제할 쪽지를 선택해주세요");
			}
		});
		
	});
	
	function messageViewParam(value){
		var messageId = value;
		$('#messageValue').val(messageId);
		$('#messageBoxFrm').attr('action', 'mySendMessageView.do');
		$('#messageBoxFrm').submit();
	}
	
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
                            		<strong>보낸 쪽지함</strong>
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
            			<div class="mail-box-header">
							<form action="mySendMessageSearch.do">
								<div class="input-group m-b">
									<div class="input-group-prepend">
										<button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button" aria-expanded="false">
											<span id="search_concept">받은 유저</span>
										</button>
										<ul class="dropdown-menu" x-placement="bottom-start" style="position: absolute; top: 35px; left: 0px; will-change: top, left;">
											<li><a href="#userSearchName">받은 유저</a></li>
										</ul>
									</div>
									<input type="hidden" class="form-control" name="option" value="userSearchName" id="search_param">
									<input type="text" class="form-control" name="keyword" id="keyword" placeholder="    Search..." maxlength="30">
									<button type="submit" class="btn btn-white"><i class="fa fa-search"></i></button>
								</div>
							</form>
                			<div class="mail-tools tooltip-demo m-t-md">
                    			<button id="messageBoxRefresh" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" title="Refresh inbox"><i class="fa fa-refresh"></i> 새로고침</button>
                    			<!-- <button type="submit" id="myMessageBoxCheckDelete" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Move to trash"><i class="fa fa-trash-o"></i> </button> -->
                    		</div>
            			</div>
                		<div class="mail-box">
                			<form name="messageBoxFrm" id="messageBoxFrm"  method="post">
                		    	<input type="hidden" id="messageValue" name="messageValue" value=""/>
                			</form>
                			<c:choose>
                				<c:when test="${aList != null}">
                					<table class="table table-hover table-mail">
               							<tbody>
               							<c:forEach items="${aList}" var="MessageDTO">
               								<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
											<fmt:formatDate value="${MessageDTO.send_date}" pattern="yyyy-MM-dd" var="reg_date" />
               								<c:choose>
               									<c:when test="${MessageDTO.sent == 1}">
               										<tr class="read" id="messageBox-${MessageDTO.num}" onclick="messageViewParam(${MessageDTO.num})" style="cursor:pointer;">
               											<td class="check-mail" style="vertical-align: middle;width: 1%;" onclick='event.cancelBubble=true;'>
               												<%-- <input id="check-${MessageDTO.num}" class="magic-checkbox" type="checkbox" name="listCheckBox" value="${MessageDTO.num}"/>
                                    						<label for="check-${MessageDTO.num}"></label> --%>
                    									</td>
                    									<td class="mail-ontact">
                    										<div style="padding-bottom:10px;">
                    											${MessageDTO.msg}
                    										</div>
                    										<div>
		                    									<span style="padding-right:10px">
		                    										<i id= "senderName" class="fa fa-send-o"> </i> ${MessageDTO.sender}
		                    									</span>
		                    									<span>
		                    										<i id= "userName" class="fa fa-envelope-o "> </i> ${MessageDTO.username}
		                    									</span>
                    											<c:choose>
																	<c:when test="${reg_date == today}">
																		<span style="float:right;"><i id= "fa-calendar" class="fa fa-clock-o"> </i>
																		<fmt:formatDate value="${MessageDTO.send_date}" pattern="HH:mm" /></span>
																	</c:when>
																	<c:otherwise>
																		<span style="float:right;"><i id= "fa-calendar" class="fa fa-calendar"> </i>
																		<fmt:formatDate value="${MessageDTO.send_date}" pattern="MM-dd" /></span>
																	</c:otherwise>
																</c:choose>
                    										</div>
                    									</td>
                									</tr>
               									</c:when>
		               							<c:otherwise>
		               								<tr class="read" id="messageBox-${MessageDTO.num}" onclick="messageViewParam(${MessageDTO.num})" style="cursor:pointer;">
														<td class="check-mail" style="vertical-align: middle;width: 1%;" onclick='event.cancelBubble=true;'>
		                    								<%-- <input id="check-${MessageDTO.num}" class="magic-checkbox" type="checkbox" name="listCheckBox" value="${MessageDTO.num}"/>
		                                    				<label for="check-${MessageDTO.num}"></label>  --%>
		                    							</td>
		                    							<td class="mail-ontact">
		                    								<div style="padding-bottom:10px;">
		                    									${MessageDTO.msg}
		                    								</div>
		                    								<div>
		                    									<span style="padding-right:10px">
		                    										<i id= "senderName" class="fa fa-send-o"> </i> ${MessageDTO.sender}
		                    									</span>
		                    									<span>
		                    										<i id= "userName" class="fa fa-envelope-o "> </i> ${MessageDTO.username}
		                    									</span>
		                    									<c:choose>
																	<c:when test="${reg_date == today}">
																		<span style="float:right;"><i id= "fa-calendar" class="fa fa-clock-o"> </i>
																		<fmt:formatDate value="${MessageDTO.send_date}" pattern="HH:mm" /></span>
																	</c:when>
																	<c:otherwise>
																		<span style="float:right;"><i id= "fa-calendar" class="fa fa-calendar"> </i>
																		<fmt:formatDate value="${MessageDTO.send_date}" pattern="MM-dd" /></span>
																	</c:otherwise>
																</c:choose>
		                    								</div>
		                    							</td>
		                							</tr>
		               							</c:otherwise>
		               						</c:choose>
		               					</c:forEach>
		                				</tbody>
		                			</table>
                				</c:when>
                				<c:otherwise>
                					<div class="ibox-content">
                						<div style="text-align: center;">
                        					쪽지가 존재하지 않습니다.
                        				</div>
                					</div>
                				</c:otherwise>
                			</c:choose>
							<div class="ibox-content">
                            	<div align="center">
                            		<nav>
										<ul class="pagination">
											<c:if test="${messagePageDto.startPage > 1}">
												<li class="page_item">
													<a class="page-link" aria-label="Previous" href="mySendMessageBox.do?currentPage=${messagePageDto.startPage-messagePageDto.blockPage}">
														<span><i style="font-weight:bold" class="fa fa-angle-left"></i></span>
													</a>
												</li>
											</c:if>
											<c:forEach var="i" begin="${messagePageDto.startPage}" end="${messagePageDto.endPage}">
												<c:url var="currPage" value="mySendMessageBox.do">
													<c:param name="currentPage" value="${i}" />
												</c:url>
												<c:choose>
													<c:when test="${ i >=1 }">
														<c:choose>
															<c:when test="${i == messagePageDto.currentPage}">
																<li class="page_item active"><a class="page-link" style="background-color: #1ab394;border-color: #1ab394;color: white"href="${currPage} "> <c:out value="${i}" /></a></li>
															</c:when>
															<c:otherwise>
				    											<li class="page_item"><a class="page-link" href="${currPage}"> <c:out value="${i}" /></a></li>
															</c:otherwise>
														</c:choose>
													</c:when>
												</c:choose>
											</c:forEach>
											<c:if test="${messagePageDto.totalPage > messagePageDto.endPage}">
												<li class="page_item">
													<a class="page-link" aria-label="Next" href="mySendMessageBox.do?currentPage=${messagePageDto.startPage+messagePageDto.blockPage}">
														<span><i style="font-weight:bold"class="fa fa-angle-right"></i></span>
													</a>
												</li>
											</c:if>
										</ul>
									</nav>
								</div>
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