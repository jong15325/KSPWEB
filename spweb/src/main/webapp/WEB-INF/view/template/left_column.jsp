<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><nav class="navbar-default navbar-static-side" role="navigation">
<div class="sidebar-collapse">
	<ul class="nav metismenu" id="side-menu">
		<c:if test="${sessionScope.userInfoSession == null}">
			<li class="nav-header">
				<div class="dropdown profile-element">
					<a href="userLogin.do">
						<span class="block m-t-xs font-bold">로그인 후 이용해주세요.</span>
        			</a>
        		</div>
      			<div class="logo-element">
            		SP
          		</div>
       		</li>
	 	</c:if>
   		<c:if test="${sessionScope.userInfoSession != null}">
			<li class="nav-header">
     			<div class="dropdown profile-element">
     				<c:choose>
         				<c:when test="${sessionScope.userInfoSession.usr_char == 10}">
                			<img alt="image" class="rounded-left" src="img/character/Xyrho_reg.jpg"/>
                   		</c:when>
                       	<c:when test="${sessionScope.userInfoSession.usr_char == 20}">
                       		<img alt="image" class="rounded-left" src="img/character/Shamoo_reg.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 30}">
                       		<img alt="image" class="rounded-left" src="img/character/Sven_reg.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 40}">
                       		<img alt="image" class="rounded-left" src="img/character/Cream_reg.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 50}">
                       		<img alt="image" class="rounded-left" src="img/character/Roland_reg.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 60}">
                       		<img alt="image" class="rounded-left" src="img/character/Aurelli_reg.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 70}">
                       		<img alt="image" class="rounded-left" src="img/character/Hawk_reg.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 80}">
                       		<img alt="image" class="rounded-left" src="img/character/Hazel_reg.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 90}">
                       		<img alt="image" class="rounded-left" src="img/character/Cara_reg.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 100}">
                       		<img alt="image" class="rounded-left" src="img/character/Warren_reg.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 110}">
                       		<img alt="image" class="rounded-left" src="img/character/Lucy_reg.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 120}">
                       		<img alt="image" class="rounded-left" src="img/character/Will_reg.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 130}">
                       		<img alt="image" class="rounded-left" src="img/character/Xyrho_prem.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 140}">
                       		<img alt="image" class="rounded-left" src="img/character/Shamoo_Prem.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 150}">
                       		<img alt="image" class="rounded-left" src="img/character/Sven_Prem.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 160}">
                       		<img alt="image" class="rounded-left" src="img/character/Cream_Prem.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 170}">
                       		<img alt="image" class="rounded-left" src="img/character/Roland_Prem.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 180}">
                       		<img alt="image" class="rounded-left" src="img/character/Aurelli_Prem.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 190}">
                       		<img alt="image" class="rounded-left" src="img/character/Hawk_Prem.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 200}">
                       		<img alt="image" class="rounded-left" src="img/character/Hazel_Prem.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 210}">
                       		<img alt="image" class="rounded-left" src="img/character/Cara_Prem.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 220}">
                       		<img alt="image" class="rounded-left" src="img/character/Warren_Prem.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 230}">
                       		<img alt="image" class="rounded-left" src="img/character/Lucy_Prem.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 240}">
                       		<img alt="image" class="rounded-left" src="img/character/Will_Prem.jpg"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 250}">
                       		<img alt="image" class="rounded-left" src="img/character/WaterAvatar_icon.png"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 260}">
                       		<img alt="image" class="rounded-left" src="img/character/FireAvatar_icon.png"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 270}">
                       		<img alt="image" class="rounded-left" src="img/character/EarthAvatar_icon.png"/>
                        </c:when>
                        <c:when test="${sessionScope.userInfoSession.usr_char == 280}">
                       		<img alt="image" class="rounded-left" src="img/character/WindAvatar_icon.png"/>
                        </c:when>
					</c:choose>
					<a data-toggle="dropdown" class="dropdown-toggle" href="#">
						<span class="block m-t-xs font-bold">${sessionScope.userInfoSession.usr_name}</span>
                        <span class="text-muted text-xs block">My <b class="caret"></b></span>
                    </a>
         			<ul class="dropdown-menu animated fadeInRight m-t-xs">
           				<c:if test="${sessionScope.userInfoSession != null}">
                          	<form name="leftColumleftColumFrm" id="leftColumFrm" method="post">
                            	<input id = "myNameHidden" name="form_usr_name" type="hidden" value="${sessionScope.userInfoSession.usr_name}">
                            </form>
                            <li><a id="myMessageBox" class="dropdown-item">쪽지함</a></li>
                        	<li><a id="myInfoView" class="dropdown-item">내 정보</a></li>
                        	<c:if test="${sessionScope.userGuildInfoSession != null || sessionScope.userInfoSession != null}">
								<c:if test="${sessionScope.userGuildInfoSession.guild_name == sessionScope.userInfoSession.usr_guildname}">
                        			<c:url var="content" value="guildHome.do">
										<c:param name="guild_id" value="${sessionScope.userGuildInfoSession.guild_id}" />
										<c:param name="usr_id" value="${sessionScope.userInfoSession.usr_id}" />
									</c:url>
                        			<li><a href="${content}" id="myGuildView" class="dropdown-item">내 길드</a></li>
                        			<c:if test="${sessionScope.userGuildInfoSession.guild_leader == sessionScope.userInfoSession.usr_name}">
                        				<li><a id="myGuildManagerView" class="dropdown-item" href="guildChangeCheck.do">내 길드 관리</a></li>
                        			</c:if>
                        		</c:if>
                        	</c:if>
                        	<li><a id="myInfoChange" class="dropdown-item" href="myInformationChangeCheck.do">내 정보 변경</a></li>
                        </c:if>
                        <li class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="userLogout.do">로그아웃</a></li>
                  	</ul>
                  </div>
                  <div class="logo-element">
                  	SP
      				</div>
      			</li>
      		</c:if>
      		<li>
     			<a href="index.do" class="active"><i class="fa fa-home"></i> <span class="nav-label">메인</span></a>
         	</li>
			<c:if test="${sessionScope.userInfoSession != null}">
				<li>
            		<a href="javascript:void(0);"><i class="fa fa-address-card"></i> <span class="nav-label">유저 정보</span><span class="fa arrow"></span></a>
            		<ul class="nav nav-second-level collapse">
            			<c:if test="${sessionScope.userInfoSession != null}">
            				<li><a id="myInfoView2" href="javascript:void(0);">내 정보 보기</a></li>
            			</c:if>
                		<li><a id="userMyInfoview" href="javascript:void(0);">유저 정보 보기</a></li>
            		</ul>
        		</li>
			</c:if>
			<li>
        		<a href="#"><i class="fa fa-star"></i> <span class="nav-label">뉴스</span><span class="fa arrow"></span></a>
       				<ul class="nav nav-second-level collapse">
              			<li><a href="noticeBoardMain.do">공지사항</a></li>
              			<li><a href="eventBoardMain.do">이벤트</a></li>
              			<li><a href="updateBoardMain.do">업데이트</a></li>
          			</ul>
         	</li>
                    <!-- <li>
                        <a href="#"><i class="fa fa-trophy"></i> <span class="nav-label">랭킹</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a href="graph_flot.html">유저랭킹</a></li>
                            <li><a href="graph_morris.html">길드랭킹</a></li>
                        </ul>
                    </li> -->
                    <li>
                        <a href="#"><i class="fa fa-flag"></i> <span class="nav-label">길드</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                        <c:if test="${sessionScope.userGuildInfoSession != null || sessionScope.userInfoSession != null}">
							<c:if test="${sessionScope.userGuildInfoSession.guild_name == sessionScope.userInfoSession.usr_guildname}">
                        		<c:url var="content" value="guildHome.do">
									<c:param name="guild_id" value="${sessionScope.userGuildInfoSession.guild_id}" />
									<c:param name="usr_id" value="${sessionScope.userInfoSession.usr_id}" />
								</c:url>
                        		<li><a href="${content}">내 길드</a></li>
                        	</c:if>
                        </c:if>
                            <li><a href="guildList.do">길드 정보</a></li>
                        </ul>
                    </li>
                    <li>
                        <!-- <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">커뮤니티</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a href="freeBoardMain.do">자유</a></li>
                            <li><a href="graph_morris.html">갤러리</a></li>
                        </ul> -->
                        <a href="freeBoardMain.do" class="active"><i class="fa fa-edit"></i> <span class="nav-label">자유게시판</span></a>
                    </li>
            		<li>
						<a href="#"><i class="fa fa-shopping-cart"></i> <span class="nav-label">상점</span><span class="fa arrow"></span></a>
            			<ul class="nav nav-second-level collapse">
      						<li><a href="userShopMain.do">유저 상점</a></li>
           				</ul>
           			</li>
                </ul>
            </div>
        </nav>
        <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
        <script type="text/javascript">
        $(document).ready(function() {/* 
        	$("sidebar-collapse a").on("click touchend", function(e) {
        	    var el = $(this);
        	    var link = el.attr("href");
        	    window.location = link;
        	  });
        	 */
        	$('#myInfoView').bind('click', function() {
				$('#leftColumFrm').attr('action', 'myPage.do');
				$('#leftColumFrm').submit();
			});
        	 
        	$('#myInfoView2').bind('click', function() {
				$('#leftColumFrm').attr('action', 'myPage.do');
				$('#leftColumFrm').submit();
			});
        	
        	$('#userMyInfoview').bind('click', function() {
				/* $('#leftColumFrm').attr('action', 'userMyPage.do'); */
				$('#leftColumFrm').attr('action', 'userList.do');
				$('#leftColumFrm').submit();
			});
        	
        	$('#myGuildview').bind('click', function() {
				/* $('#leftColumFrm').attr('action', 'userMyPage.do'); */
				$('#leftColumFrm').attr('action', 'userList.do');
				$('#leftColumFrm').submit();
			});
        	
        	$('#myMessageBox').bind('click', function() {
				/* $('#leftColumFrm').attr('action', 'userMyPage.do'); */
				$('#leftColumFrm').attr('action', 'myMessageBox.do');
				$('#leftColumFrm').submit();
			});
        });
        </script>