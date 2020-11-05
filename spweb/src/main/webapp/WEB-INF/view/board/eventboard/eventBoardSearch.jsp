<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<%@ include file="../../template/head.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('#more').on("click", function(){

		});
		
		 $('.input-group-prepend .dropdown-menu').find('a').click(function(e) {
				e.preventDefault();
				var param = $(this).attr("href").replace("#","");
				var concept = $(this).text();
				$('.input-group-prepend span#search_concept').text(concept);
				$('.input-group #search_param').val(param);
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
	width: 70%;
}

#day-area{
	float: left;
	width: 30%;
}

#reply-area{
	text-align: center;
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
                            <span>뉴스</span>
                        </li>
                        <li class="breadcrumb-item">
                            <Strong>이벤트</Strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>
            <div class="wrapper wrapper-content animated fadeInRight ecommerce">
       			<div class="ibox-content m-b-sm border-bottom">
					<form action="eventBoardSearch.do">
						<div class="input-group m-b">
							<div class="input-group-prepend">
								<button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button" aria-expanded="false">
								<span id="search_concept">제목</span>
								</button>
									<ul class="dropdown-menu" x-placement="bottom-start" style="position: absolute; top: 35px; left: 0px; will-change: top, left;">
										<li><a href="#eventBoardSearchTitle">제목</a></li>
										<li><a href="#eventBoardSearchWriter">글쓴이</a></li>
										<li><a href="#eventBoardSearchContent">내용</a></li>
									</ul>
							</div>
							<input type="hidden" class="form-control" name="option" value="eventBoardSearchTitle" id="search_param">
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
                            		<form id="searchFrm" name="searchFrm" method="get" action="eventBoardInsert.do">
                            			<button class="btn btn-default dim" type="submit" id="eventBoardInsert" value="글쓰기">
                            				<i class="fa fa-pencil-square-o"></i>
                            			</button>
                            		</form>
                            	</div>
							</div>
						</c:if>
                        <div class="ibox-content">
                        	<c:choose>
                        		<c:when test="${aList != null}">
                        			<table class="footable table table-stripped toggle-arrow-tiny" data-page-size="15">
                                		<thead>
                                		<tr>
                                    		<th style="width:80%; padding-bottom:0px; padding-top:16px; border-bottom-width:0px;">제목</th>
                                    		<th style="width: 20%" class="text-center">
                                    			<p style="margin-bottom: 0px;">댓글</p>
                                    			<p style="margin-bottom: 0px;">조회</p>
                                    		</th>
                                		</tr>
                                		</thead>
                                		<tbody>
                                		<c:forEach items="${aList}" var="EventBoardDTO">
                                			<tr>
                              					<c:url var="content" value="eventBoardContentRead.do">
													<c:param name="currentPage" value="${eventBoardPageDto.currentPage}" />
													<c:param name="article_no" value="${EventBoardDTO.article_no}" />
												</c:url>
												<jsp:useBean id="now" class="java.util.Date" />
												<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
												<fmt:formatDate value="${EventBoardDTO.article_regdate}" pattern="yyyy-MM-dd" var="reg_date" />
                                    			<td>
                                    				<div>
                                      					<a style="width:100%;font-size:16px;display:block;color:black;" href="${content}">${EventBoardDTO.article_title}</a>
                                   						<div>
                                   							<div id="writer-area">
                                   								<i id= "fa-pencil" class="fa fa-pencil"> </i>
                                   									<span>${EventBoardDTO.article_writer}</span>
                                   							</div>
                                   							<div id="day-area">
                                   								<i id= "fa-calendar" class="fa fa-calendar"> </i>
																<c:choose>
																	<c:when test="${reg_date == today}">
																		<span><fmt:formatDate value="${EventBoardDTO.article_regdate}" pattern="HH:mm" /></span>
																	</c:when>
																	<c:otherwise>
																		<span><fmt:formatDate value="${EventBoardDTO.article_regdate}" pattern="MM-dd" /></span>
																	</c:otherwise>
																</c:choose>
                                   							</div>
														</div>
													</div>
                                   				</td>
                                    			<td class="text-right">
                                    			<div id="reply-area">
                                    				<i id ="fa-comments-o" class="fa fa-comments-o"></i>
                                    				${EventBoardDTO.reply_count}
                                    			</div>
                                    			<div id="reply-area">
                                    				<i id="fa-eye" class="fa fa-eye"></i>
                                    				${EventBoardDTO.article_viewcnt}
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
										<c:if test="${eventBoardPageDto.startPage > 1}">
											<li class="page_item">
												<a class="page-link" aria-label="Previous" href="eventBoardSearch.do?currentPage=${eventBoardPageDto.startPage-eventBoardPageDto.blockPage}&option=${map.option}&keyword=${map.keyword}">
													<span><i style="font-weight:bold" class="fa fa-angle-left"></i></span>
												</a>
											</li>
										</c:if>
										<c:forEach var="i" begin="${eventBoardPageDto.startPage}" end="${eventBoardPageDto.endPage}">
											<c:url var="currPage" value="eventBoardSearch.do">
												<c:param name="currentPage" value="${i}" />
												<c:param name="option" value="${map.option}" />
												<c:param name="keyword" value="${map.keyword}" />
											</c:url>
											<c:choose>
												<c:when test="${ i >=1 }">
													<c:choose>
														<c:when test="${i == eventBoardPageDto.currentPage}">
															<li class="page_item active"><a class="page-link" style="background-color: #1ab394;border-color: #1ab394;color: white"href="${currPage} "> <c:out value="${i}" /></a></li>
														</c:when>
														<c:otherwise>
				    										<li class="page_item"><a class="page-link" href="${currPage}"> <c:out value="${i}" /></a></li>
														</c:otherwise>
													</c:choose>
												</c:when>
											</c:choose>
										</c:forEach>
											<c:if test="${eventBoardPageDto.totalPage > eventBoardPageDto.endPage}">
												<li class="page_item">
													<a class="page-link" aria-label="Next" href="eventBoardSearch.do?currentPage=${eventBoardPageDto.startPage+eventBoardPageDto.blockPage}&option=${map.option}&keyword=${map.keyword}">
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