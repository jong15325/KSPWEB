<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<%@ include file="../../template/head.jsp"%>
<link href="css/magic-check.css" rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function() {
		
		$('.input-group-prepend .dropdown-menu').find('a').click(function(e) {
			e.preventDefault();
			var param = $(this).attr("href").replace("#","");
			var concept = $(this).text();
			$('.input-group-prepend span#search_concept').text(concept);
			$('.input-group #search_param').val(param);
		});
		
		$('#freeBoardInsert').on("click", function(){
			$.ajax({
				success : function(){
					location.href = "freeBoardInsert.do";
				},
				error : function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		
		$('#freeBoardCheckDelete').bind('click', function() {
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
								article_no : check_article_no,
						};
						$.ajax({
							method : "post",
							dataType : "json",
							url : "freeBoardCheckDelete.do",
							data : form_data,
							success : function(){
								location.href = "freeBoardMain.do";
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
		    							text: "오류 코드 63",
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
				swal("삭제할 게시글을 선택해주세요");
			}
			
		});
	});
</script>
<style type="text/css">
#moreBtn{
	margin: auto;
	width: 50%;
}

#moreDiv{
	text-align: center;
}

#fa-eye, #fa-comments-o, #fa-calendar, #fa-pencil{
	font-size: 10px;
}

#writer-area{
	float: left;
	width: 55%;
}

#day-area{
	float: left;
	width: 45%;
}

#reply-area{
	text-align: center;
}

.boardWarp:hover{
	background-color: #D3F3ED;
}
#freeBoardInsert:hover, #freeBoardCheckDelete:hover{
	background-color: aliceblue;
}

</style>
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
                            <span>자유</span>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>
            <div class="wrapper wrapper-content animated fadeInRight ecommerce">
       			<div class="ibox-content m-b-sm border-bottom">
					<form action="freeBoardSearch.do">
						<div class="input-group m-b">
							<div class="input-group-prepend">
								<button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button" aria-expanded="false">
								<span id="search_concept">제목</span>
								</button>
									<ul class="dropdown-menu" x-placement="bottom-start" style="position: absolute; top: 35px; left: 0px; will-change: top, left;">
										<li><a href="#freeBoardSearchTitle">제목</a></li>
										<li><a href="#freeBoardSearchWriter">글쓴이</a></li>
										<li><a href="#freeBoardSearchContent">내용</a></li>
									</ul>
							</div>
							<input type="hidden" class="form-control" name="option" value="freeBoardSearchTitle" id="search_param">
							<input type="text" class="form-control" name="keyword" id="keyword" placeholder="    Search..."  maxlength="30">
							<button type="submit" class="btn btn-white"><i class="fa fa-search"></i></button>
						</div>
					</form>
				</div>
				<div class="row">
                	<div class="col-lg-12">
						<div class="ibox">
						<c:if test="${sessionScope.userInfoSession.usr_name != null}">
							<div class="ibox-content" style="padding-bottom: 0px;">
								<div style="text-align: end;">
									<c:if test="${sessionScope.userInfoSession.usr_admin >= 6}">
                            			<button class="btn btn-default dim" type="submit" id="freeBoardCheckDelete" value="글삭제">
                            				<i class="fa fa-times"></i>
                            			</button>
                            		</c:if>
                            		<button class="btn btn-default dim" id="freeBoardInsert" value="글쓰기">
                            			<i class="fa fa-pencil-square-o"></i>
                            		</button>
                            	</div>
							</div>
						</c:if>
                        <div class="ibox-content">
                        	<c:choose>
                        		<c:when test="${aList != null}">
                        			<table class="footable table table-stripped toggle-arrow-tiny" data-page-size="15">
                                		<thead>
                                		<tr>
                                			<c:if test="${sessionScope.userInfoSession.usr_admin >= 6}">
                                				<th style="width:5%;"></th>
                                			</c:if>
                                    		<th style="width:75%; padding-bottom:0px; padding-top:16px; border-bottom-width:0px;">제목</th>
                                    		<th style="width: 20%" class="text-center">
                                    			<p style="margin-bottom: 0px;">댓글</p>
                                    			<p style="margin-bottom: 0px;">조회</p>
                                    		</th>
                                		</tr>
                                		</thead>
                                		<tbody>
                                		<c:forEach items="${aList}" var="FreeBoardDTO">
                                			<c:url var="content" value="freeBoardContentRead.do">
												<c:param name="currentPage" value="${freeBoardPageDto.currentPage}" />
												<c:param name="article_no" value="${FreeBoardDTO.article_no}" />
												<c:if test="${sessionScope.userInfoSession.usr_name != null}">
													<c:param name="usr_name" value="${sessionScope.userInfoSession.usr_name}" />
												</c:if>
											</c:url>
											
                                			<tr class="boardWarp" onclick="document.location.href='${content}'" style="cursor:pointer;">
												<jsp:useBean id="now" class="java.util.Date" />
												<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
												<fmt:formatDate value="${FreeBoardDTO.article_regdate}" pattern="yyyy-MM-dd" var="reg_date" />
                                    			<c:if test="${sessionScope.userInfoSession.usr_admin >= 6}">
                                    				<td style="vertical-align: middle;" onclick='event.cancelBubble=true;'>
                                    						<input id="check-${FreeBoardDTO.article_no}" class="magic-checkbox" type="checkbox" name="listCheckBox" value="${FreeBoardDTO.article_no}"/>
                                    				<label for="check-${FreeBoardDTO.article_no}"></label>                     				
                                    				</td>
                                    			</c:if>
                                    			<td>
                                    				<div>
                                      					<div style="width:100%;font-size:16px;display:block;color:black;">${FreeBoardDTO.article_title}</div>
                                   						<div>
                                   							<div id="writer-area">
                                   								<i id= "fa-pencil" class="fa fa-pencil"> </i>
                                   									<span>${FreeBoardDTO.article_writer}</span>
                                   							</div>
                                   							<div id="day-area">
																<c:choose>
																	<c:when test="${reg_date == today}">
																		<i id= "fa-calendar" class="fa fa-clock-o"> </i>
																		<span><fmt:formatDate value="${FreeBoardDTO.article_regdate}" pattern="HH:mm" /></span>
																	</c:when>
																	<c:otherwise>
																		<i id= "fa-calendar" class="fa fa-calendar"> </i>
																		<span><fmt:formatDate value="${FreeBoardDTO.article_regdate}" pattern="MM-dd" /></span>
																	</c:otherwise>
																</c:choose>
                                   							</div>
														</div>
													</div>
                                   				</td>
                                    			<td class="text-right" style="vertical-align:middle">
                                    			<div id="reply-area">
                                    				<i id ="fa-comments-o" class="fa fa-comments-o"></i>
                                    				${FreeBoardDTO.reply_count}
                                    			</div>
                                    			<div id="reply-area">
                                    				<i id="fa-eye" class="fa fa-eye"></i>
                                    				${FreeBoardDTO.article_viewcnt}
                                    			</div>
                                    			</td>
                                			</tr>
                                		</c:forEach>
                                	</tbody>
                            	</table>
                        		</c:when>
                        		<c:otherwise>
                        			<div style="text-align: center;">
                        				글이 존재하지 않습니다.
                        			</div>
                        		</c:otherwise>
                        	</c:choose>
						</div>
						<div class="ibox-content">
                            <div align="center">
                            	<nav>
									<ul class="pagination">
										<c:if test="${freeBoardPageDto.startPage > 1}">
											<li class="page_item">
												<a class="page-link" aria-label="Previous" href="freeBoardMain.do?currentPage=${freeBoardPageDto.startPage-freeBoardPageDto.blockPage}">
													<span><i style="font-weight:bold" class="fa fa-angle-left"></i></span>
												</a>
											</li>
										</c:if>
										<c:forEach var="i" begin="${freeBoardPageDto.startPage}" end="${freeBoardPageDto.endPage}">
											<c:url var="currPage" value="freeBoardMain.do">
												<c:param name="currentPage" value="${i}" />
											</c:url>
											<c:choose>
												<c:when test="${ i >=1 }">
													<c:choose>
														<c:when test="${i == freeBoardPageDto.currentPage}">
															<li class="page_item active"><a class="page-link" style="background-color: #1ab394;border-color: #1ab394;color: white"href="${currPage} "> <c:out value="${i}" /></a></li>
														</c:when>
														<c:otherwise>
				    										<li class="page_item"><a class="page-link" href="${currPage}"> <c:out value="${i}" /></a></li>
														</c:otherwise>
													</c:choose>
												</c:when>
											</c:choose>
										</c:forEach>
											<c:if test="${freeBoardPageDto.totalPage > freeBoardPageDto.endPage}">
												<li class="page_item">
													<a class="page-link" aria-label="Next" href="freeBoardMain.do?currentPage=${freeBoardPageDto.startPage+freeBoardPageDto.blockPage}">
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
		 	<%@ include file="../../template/footer.jsp"%>
	 	</div>
	  	<%@ include file="../../template/chatBox.jsp"%>
	  	<%-- <%@ include file="../../template/right_column.jsp"%> --%>
	</div>
	<%@ include file="../../template/plugin_js.jsp"%>
</body>
</html>