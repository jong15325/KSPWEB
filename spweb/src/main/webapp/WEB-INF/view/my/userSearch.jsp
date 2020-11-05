<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<%@ include file="../template/head.jsp"%>
<body>
	<div class="wrapper">
	<%@ include file="../template/left_column.jsp"%>
		<div id="page-wrapper" class="gray-bg">
			<%@ include file="../template/header.jsp"%>
						<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>내 정보</h2>
					<ol class="breadcrumb">
						<li class="breadcrumb-item">
                            <a href="index.do">메인</a>
                        </li>
                        <li class="breadcrumb-item">
                            <span>유저 정보</span>
                        </li>
                        <li class="breadcrumb-item">
                            <strong>유저 리스트</strong>
                        </li>
                    </ol>
                </div>
            	<div class="col-lg-2">
            	</div>
        	</div>
        	<div class="wrapper wrapper-content animated fadeInRight">
        		<div class="ibox-content m-b-sm border-bottom">
					<form action="userSearch.do">
						<div class="input-group m-b">
							<div class="input-group-prepend">
								<button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button" aria-expanded="false">
									<span id="search_concept">유저 이름</span>
								</button>
								<ul class="dropdown-menu" x-placement="bottom-start" style="position: absolute; top: 35px; left: 0px; will-change: top, left;">
									<li><a href="#userSearchName">유저 이름</a></li>
								</ul>
							</div>
							<input type="hidden" class="form-control" name="option" value="userSearchName" id="search_param">
							<input type="text" class="form-control" name="keyword" id="keyword" placeholder="    Search..." maxlength="30">
							<button type="submit" class="btn btn-white"><i class="fa fa-search"></i></button>
						</div>
					</form>
				</div>
				<div class="ibox-content">
					<c:choose>
        				<c:when test="${aList != null}">
        					<div class="row">
        						<c:forEach items="${aList}" var="UserDTO">
        							<c:url var="content" value="userMyPage.do">
            							<c:param name="currentPage" value="${userPageDto.currentPage}" />
										<c:param name="you_usr_name" value="${UserDTO.usr_name}" />
									</c:url>
            						<div class="col-lg-6">
                						<div class="contact-box">
                    						<a class="row" href="${content}">
                    							<div class="col-4">
                        							<div class="text-center">
                            							<img alt="image" class="rounded-circle m-t-xs img-fluid" src="${UserDTO.usr_profile_path}">
                            							<div class="m-t-xs font-bold">Online</div>
                            							<div class="m-t-xs font-bold"><strong>추천수 : </strong> 5</div>
                        							</div>
                    							</div>
                    							<div class="col-8">
                        							<h3><strong>${UserDTO.usr_name}</strong></h3>
                        								<p><strong>최근 접속일 : </strong> ${UserDTO.usr_last_login}</p>
                        								<!-- <address>
                            							<strong>Twitter, Inc.</strong><br>
                            								795 Folsom Ave, Suite 600<br>
                            								San Francisco, CA 94107<br>
                            							<abbr title="Phone">P:</abbr> (123) 456-7890
                        								</address> -->
                        								<div>아래 정보</div>
                    							</div>
                        					</a>
                						</div>
            						</div>
            					</c:forEach>
        					</div>
        				</c:when>
						<c:otherwise>
                  			<div style="text-align: center;">
                  				유저가 존재하지 않습니다.
                       		</div>
                 		</c:otherwise>
        			</c:choose>
        		</div>
        		<div class="ibox-content">
            	<div align="center">
            		<nav>
            			<ul class="pagination">
            				<c:if test="${userPageDto.startPage > 1}">
            					<li class="page_item">
            						<a class="page-link" aria-label="Previous" href="userSearch.do?currentPage=${userPageDto.startPage-userPageDto.blockPage}&option=${map.option}&keyword=${map.keyword}">
            							<span><i style="font-weight:bold" class="fa fa-angle-left"></i></span>
            						</a>
            					</li>
            				</c:if>
            				<c:forEach var="i" begin="${userPageDto.startPage}" end="${userPageDto.endPage}">
            					<c:url var="currPage" value="userSearch.do">
            						<c:param name="currentPage" value="${i}" />
            						<c:param name="option" value="${map.option}" />
									<c:param name="keyword" value="${map.keyword}" />
            					</c:url>
            					<c:choose>
            						<c:when test="${ i >=1 }">
            							<c:choose>
            								<c:when test="${i == userPageDto.currentPage}">
            									<li class="page_item active"><a class="page-link" style="background-color: #1ab394;border-color: #1ab394;color: white"href="${currPage} "> <c:out value="${i}" /></a></li>
            								</c:when>
            								<c:otherwise>
            									<li class="page_item"><a class="page-link" href="${currPage}"> <c:out value="${i}" /></a></li>
            								</c:otherwise>
										</c:choose>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${userPageDto.totalPage > userPageDto.endPage}">
								<li class="page_item">
									<a class="page-link" aria-label="Next" href="userSearch.do?currentPage=${userPageDto.startPage+userPageDto.blockPage}&option=${map.option}&keyword=${map.keyword}">
										<span><i style="font-weight:bold"class="fa fa-angle-right"></i></span>
									</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
			 </div>
        	</div>
		<%@ include file="../template/footer.jsp"%>
	 </div>
	  <%@ include file="../template/chatBox.jsp"%>
	  <%-- <%@ include file="../template/right_column.jsp"%> --%>
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
    
</body>
</html>