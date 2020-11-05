<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<%@ include file="../template/head.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		var areaId = "";
		var lastNum = 0;
		var limitNum = 5;
		var viewState = 0;
		$('#replyBox').hide();
		
		$('#guildlikeBtn').on("click", function(){
			var like_type = 1;
			var usr_id = $("#usr_id").val();
			var usr_name = $("#usr_name").val();
			var guild_id = $("#guild_id").val();
			var guild_name = $("#guild_name").val();
			var form_data = {
					usr_id : usr_id,
					usr_name : usr_name,
					guild_id : guild_id,
					guild_name : guild_name,
					like_type : like_type,
			};
			
			$.ajax({
				method : "post",
				dataType : "json",
				url : "guildLike.do",
				data : form_data,
				success : function(data){
					if(data == 1){
						$("#guildlikeBtn").css("color","white");
						$("#guildlikeBtn").css("background-color","#ed5565");
						$("#guildlikeBtn").css("border","#ed5565");
						$("#guildlikeBtn").empty();
						$("#guildlikeBtn").append("<i class='fa fa-thumbs-up'></i>"+" 취소");
					}else if(data == 2){
						$("#guildlikeBtn").css("color","black");
						$("#guildlikeBtn").css("background-color","white");
						$("#guildlikeBtn").css("border","white");
						$("#guildlikeBtn").empty();
						$("#guildlikeBtn").html("<i class='fa fa-thumbs-up'></i>"+" 추천");
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
							text: "오류 코드 42",
						  	icon: "warning",
						})
					}
				}
			});
		});
		
		$('#guestBookSuccess').on("click", function(){
			var guest_writer = $("#usr_name").val();
			var contentTrans = $("#guestBookContent").val().replace(/ /g, '&nbsp;');
			var guest_content = contentTrans.replace(/\n/gi, '<br/>');
			var guest_category = 0;
			var type_id = $("#guild_id").val();
			if($("#guestBookContent").val() == ''){
				swal({
					text: "글이 입력되지 않았습니다",
				  	icon: "warning",
				})
				return;
			}
			var form_data = {
					guest_category : guest_category,
					guest_writer : guest_writer,
					guest_content : guest_content,
					type_id : type_id,
			};
			
			$.ajax({
				method : "post",
				dataType : "json",
				url : "guildGuestBookInsertProcess.do",
				data : form_data,
				success : function(data){
					/* alert('등록 성공'); */
					//location.reload(true);
					guestBookList();
					var offset = $('.user-button-reply').offset(); //선택한 태그의 위치를 반환
		        	$('html, body').animate({scrollTop : offset.top}, 400);
		        	$("#guestBookContent").val('');
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
							text: "오류 코드 43",
						  	icon: "warning",
						})
					}
				}
			});	
		});
		
		$('#guildJoinCancelBtn').on("click", function(){
			var usr_id = $("#usr_id").val();
			var usr_name = $("#usr_name").val();
			var guild_id = $("#guild_id").val();
			var guild_name = $("#guild_name").val();
			var form_data = {
					usr_id : usr_id,
					usr_name : usr_name,
					guild_id : guild_id,
			};
			swal({
				/* title: "정말 탈퇴 하시겠습니까?", */
				text: guild_name+" 길드 가입 신청을 취소 하시겠습니까?",
				icon: "warning",
				buttons: true,
			})
			.then((willDelete) => {
				if (willDelete) {
					$.ajax({
						method : "post",
						dataType : "json",
						url : "guildAppDelete.do",
						data : form_data,
						success : function(data){
							if(data == 1){
								swal(guild_name+"길드에 신청이력이 없습니다.");
							}else if(data == 2){
								swal({
									text: guild_name+" 길드 가입 신청을 취소하였습니다.",
									icon: "success",
									confirm : "OK",
								}).then((willDelete) => {
									location.reload(true);
								});
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
	    							text: "오류 코드 44",
	    						  	icon: "warning",
	    						})
	    					}
						}
					});	
				}
			});
		});
		
		$('#guildJoinBtn').on("click", function(){
			var usr_id = $("#usr_id").val();
			var usr_name = $("#usr_name").val();
			var guild_id = $("#guild_id").val();
			var guild_name = $("#guild_name").val();
			var form_data = {
					usr_id : usr_id,
					usr_name : usr_name,
					guild_id : guild_id,
					guild_name : guild_name,
			};
			swal({
				/* title: "정말 탈퇴 하시겠습니까?", */
				text: guild_name+" 길드에 정말 가입 신청 하시겠습니까?",
				icon: "info",
				buttons: true,
			})
			.then((willDelete) => {
				if (willDelete) {
					$.ajax({
						method : "post",
						dataType : "json",
						url : "guildJoin.do",
						data : form_data,
						success : function(data){
							if(data == 1){
								swal("길드가 존재하지 않습니다.");
							}else if(data ==2){
								swal("이미 가입된 길드가 있습니다.");
							}else if(data == 3){
								swal("이미 가입 신청한 길드가 있습니다.");
							}else if(data == 4){
								swal({
									text: guild_name+" 길드에 가입하였습니다.",
									icon: "success",
									confirm : "OK",
								}).then((willDelete) => {
									location.reload(true);
								});
							}else if(data == 5){
								swal({
									text: guild_name+" 길드에 가입 신청되었습니다.",
									icon: "success",
									confirm : "OK",
								}).then((willDelete) => {
									location.reload(true);
								});
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
	    							text: "오류 코드 45",
	    						  	icon: "warning",
	    						})
	    					}
						}
					});	
				} else {
					swal("가입 신청을 취소하였습니다");
				}
			});
		});
		
		$('#guildSecessionBtn').on("click", function(){
			var usr_id = $("#usr_id").val();
			var usr_name = $("#usr_name").val();
			var guild_id = $("#guild_id").val();
			var guild_name = $("#guild_name").val();
			var form_data = {
					usr_id : usr_id,
					usr_name : usr_name,
					guild_id : guild_id,
					guild_name : guild_name,
			};
			swal({
				/* title: "정말 탈퇴 하시겠습니까?", */
				text: guild_name+" 길드를 정말 탈퇴 하시겠습니까?",
				icon: "warning",
				buttons: true,
				dangerMode: true,
			})
			.then((willDelete) => {
				if (willDelete) {
					$.ajax({
						method : "post",
						dataType : "json",
						url : "guildSecession.do",
						data : form_data,
						success : function(data){
							if(data == 1){
								swal("길드가 존재하지 않습니다");
							}else if(data ==2){
								swal("길드원이 아닙니다");
							}else if(data == 3){
								swal({
									text: guild_name+" 길드를 탈퇴하였습니다",
									icon: "success",
									confirm : "OK",
								})
								.then((willDelete) => {
									location.reload(true);
								});
							}else if(data ==4){
								swal({
									  text: "길드장은 위임 이전에 탈퇴할 수 없습니다",
									  icon: "warning",
									})
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
	    							text: "오류 코드 46",
	    						  	icon: "warning",
	    						})
	    					}
						}
					});	
				} else {
					swal("탈퇴를 취소하였습니다");
				}
			});
		});
		
		
		$(document).on("click",".guestBookTagBtnArea button", function() {
			switch($(this).text())	{
				case "":
					areaId = $(this).prop("id");
					var replceAreaId = areaId.replace('guestBookTagSuccess', '');
					var guest_writer = '${sessionScope.userInfoSession.usr_name}';
					var contentTrans = $("#guestBookTagContent"+replceAreaId).val().replace(/ /g, '&nbsp;');
					var guest_content = contentTrans.replace(/\n/gi, '<br/>');
					var guest_category = 0;
					var tag_name = $("#tag_name"+replceAreaId).val();
					var type_id = $("#guild_id").val();
					if($("#guestBookTagContent"+replceAreaId).val() == ''){
						swal({
							text: "글이 입력되지 않았습니다",
						  	icon: "warning",
						})
						return;
					}
					var form_data = {
							guest_category : guest_category,
							guest_writer : guest_writer,
							guest_content : guest_content,
							type_id : type_id,
							tag_name : tag_name,
					}; 
					$.ajax({
						method : "post",
						dataType : "json",
						url : "guildGuestBookInsertProcess.do",
						data : form_data,
						success : function(){
							//location.reload(true);
							guestBookList();
							var offset = $('.user-button-reply').offset(); //선택한 태그의 위치를 반환
				        	$('html, body').animate({scrollTop : offset.top}, 400);
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
	    							text: "오류 코드 47",
	    						  	icon: "warning",
	    						})
	    					}
						}
					});
				break;
			}
		});
		
		$(document).on("click",".guestBookBtn button", function() {
			switch($(this).text())	{
				case " 댓글":
					areaId = $(this).prop("id");
					$.ajax({
						success : function(){
							$(".guestBookTagContent").val("");
							$(".guestBookTagArea").css("display","none");
							$(".guestBookBtn2").css("display","none");
							$(".guestBookBtn").css("display","block");
							$("#guestBookBtn"+areaId).css("display","none");
							$("#guestBookTag"+areaId).css("display","block");
							$("#guestBookBtn2"+areaId).css("display","block");
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
	    							text: "오류 코드 48",
	    						  	icon: "warning",
	    						})
	    					}
						}
					});
				break;
				case " 삭제":
					areaId = $(this).prop("id");
					var form_data = {
							gb_id : areaId,
					};
					$.ajax({
						method : "post",
						url : "guildGuestBookDeleteProcess.do",
						data : form_data,
						success : function(data){
							//location.reload(true);
							swal({
    							text: "삭제되었습니다",
    							icon: "success",
    							confirm : "OK",
    						}).then((willDelete) => {
    							guestBookList();
    						});
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
	    							text: "오류 코드 49",
	    						  	icon: "warning",
	    						})
	    					}
						}
					});
				break;
					
			}
		});
		
		$(document).on("click",".guestBookBtn2 button", function() {
			switch($(this).text())	{
				case " 취소":
					$.ajax({
						success : function(){
							$(".guestBookTagContent").val("");
							$(".guestBookTagArea").css("display","none");
							$(".guestBookBtn2").css("display","none");
							$(".guestBookBtn").css("display","block");
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
	    							text: "오류 코드 50",
	    						  	icon: "warning",
	    						})
	    					}
						}
					});
				break;
			}
		});
		
		$('#guildListBtn').bind('click', listRun);
		
		function listRun() {
			$('#guildHomeguildHomeFrm').attr('action', "guildList.do").submit();
		}
		
		$('#replyFocus').bind('click', focusReply);
		
		function focusReply(){
			$('#guestBookContent').focus();
		}
		
		$('#moreBtn').bind('click', guestBookList);

		function guestBookList(){
			//var viewLastNum = lastNum; 제한 더보기
			var viewLastNum = 0; // 전체 더보기
			var viewLimitNum = limitNum;
			var type_id = $("#guild_id").val();
			var sessionUserId = $("#usr_name").val();
			var form_data = {
					viewLastNum : viewLastNum,
					viewLimitNum : viewLimitNum,
					type_id : type_id,
			};
			$.ajax({
				method : "POST",
				url : "guildGuestBookListProcess.do",
				data : form_data,
				success : function(data){
					$(".feed-activity-list").empty();
					$('#replyBox').show();
					if(data == ''){
						/*swal({
							text: "남겨진 방명록이 없습니다",
						  	icon: "info",
						})*/
						$('#moreBtn').text('남겨진 방명록이 없습니다');
						$('#replyFocus').text('남겨진 방명록이 없습니다');
						return;
					}else{
						$('#replyFocus').html("<i class='fa fa-arrow-up'></i>");
						$('#replyFocus').append(' 댓글쓰기');
					}
					$.each(data, function(index, item){
						var toDay = new Date();
						var date = new Date(data[index].guest_date);
						var day = date.getDate();
						var month = date.getMonth()+1;
						var year = date.getFullYear();
						var hour = date.getHours();
						var minutes = date.getMinutes();
						var dateSub = (toDay.getTime() - date.getTime()) / (1000*60*60*24);
						if(day < 10)
							day = "0"+day;
						if(month < 10)
							month = "0"+month;
						if(hour < 10)
							hour = "0"+hour;
						if(minutes < 10)
							minutes = "0"+minutes;
						var toDayRegDate = hour+":"+minutes;
						var oldDayRegDate = year+"-"+month+"-"+day;
						var feedElement = "<div class='feed-element feed-element-"+data[index].gb_id+"'></div>";
						var userImg = "<img alt='image' class='rounded-circle' src='"+data[index].guest_profile_path+"'>";
						var linkA = "<a href='javascript:void(0)' class='float-left' style='cursor:default;'>";
							linkA += userImg;
							linkA += "</a>";
						if(dateSub > 0.99)
							var regdate = "<small class='float-right'><i id='fa-calendar' class='fa fa-calendar'></i> "+oldDayRegDate+"</small>";
						else
							var regdate = "<small class='float-right'><i id='fa-calendar' class='fa fa-clock-o'></i> "+toDayRegDate+"</small>";
						var mediaBody = "<div class='media-body'>";
							mediaBody += regdate;
							mediaBody += "<a href='#'><strong>"+data[index].guest_writer+"</strong></a>";
							if(data[index].tag_name != null)
								mediaBody += "<strong> To.</strong>  "+data[index].tag_name;
							mediaBody += "<input type='hidden' name='tag_name' id='tag_name"+data[index].gb_id+"' value="+data[index].guest_writer+"></input>";
							mediaBody += "<div class='well'>"+data[index].guest_content+"</div>";
							mediaBody += "<div id='guestBookTag"+data[index].gb_id+"' class='guestBookTagArea'>";
							mediaBody += "<br> <strong>@"+data[index].guest_writer+"</strong>";
							mediaBody += "<div id='guestBookTagBtnArea"+data[index].gb_id+"' class='input-group m-b guestBookTagBtnArea'>";
							mediaBody += "<textarea id='guestBookTagContent"+data[index].gb_id+"' class='form-control guestBookTagContent' style ='width: 80%; resize: none;'></textarea>";
							mediaBody += "<button id='guestBookTagSuccess"+data[index].gb_id+"' class='btn btn-white btn-xs' type='button' style ='background: #1c84c6; color: white; width: 20%'><i class='fa fa-reply'></i></button>";
							mediaBody += "</div>"; //guestBookTagBtnArea${guestBookList.gb_id}
							mediaBody += "</div>"; // guestBookTag${guestBookList.gb_id}
							mediaBody += "<div id='guestBookBtn"+data[index].gb_id+"' class='float-right guestBookBtn'>";
							if(data[index].guest_writer == sessionUserId)
								mediaBody += "<button id='"+data[index].gb_id+"' type='button' class='btn btn-xs btn-white'><i class='fa fa-trash-o'></i> 삭제</button>";
							else
								mediaBody += "<button id='"+data[index].gb_id+"' type='button' class='btn btn-xs btn-white'><i class='fa fa-comment'></i> 댓글</button>";
							mediaBody += "</div>"; //guestBookBtn${guestBookList.gb_id}
							mediaBody += "<div id='guestBookBtn2"+data[index].gb_id+"' class='float-right guestBookBtn2' style='display:none;'>";
							mediaBody += "<button id='guestBookCancel' type='button' class='btn btn-xs btn-white'><i class='fa fa-trash-o'></i> 취소</button>";
							mediaBody += "</div>"; //guestBookBtn2${guestBookList.gb_id}
							mediaBody += "</div>"; //mediaBody
						$(".feed-activity-list").append(feedElement);
						$(".feed-element-"+data[index].gb_id).append(linkA);
						$(".feed-element-"+data[index].gb_id).append(mediaBody);
						if(viewState != 1){
							$(".feed-element-"+data[index].gb_id).hide();
							$(".feed-element-"+data[index].gb_id).slideDown();
							$(".user-button-open").remove();
							$(".user-button-reply").css('display','block');
						}
						lastNum++;
						if(data[index].guest_count > limitNum){
							limitNum++;
						}
						viewState = 1;
						//document.getElementById('moreBtn').scrollIntoView();
					});
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
							text: "오류 코드 49",
						  	icon: "warning",
						})
					}
				}
			});
		}
	});
	
	
	
</script>
<style>
.infomation{
	margin-bottom : 5px;
}

.ibox-tools{
	display:none;
}

.guestBookTagArea{
	display:none;
}

</style>
<body class="pace-done">
	<div class="pace  pace-inactive">
		<div class="pace-progress" data-progress-text="100%" data-progress="99" style="transform: translate3d(100%, 0px, 0px);">
  		<div class="pace-progress-inner"></div>
	</div>
	<div class="pace-activity"></div></div>
	
	<div class="wrapper">
	<%@ include file="../template/left_column.jsp"%>
		<div id="page-wrapper" class="gray-bg">
			<%@ include file="../template/header.jsp"%>
			<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>길드</h2>
					<ol class="breadcrumb">
						<li class="breadcrumb-item">
                            <a href="index.do">메인</a>
                        </li>
                        <li class="breadcrumb-item">
                            <span>길드정보</span>
                        </li>
                        <li class="breadcrumb-item active">
                            <strong>홈</strong>
                        </li>
                    </ol>
                </div>
            	<div class="col-lg-2">
            	</div>
        	</div>
        	<div class="wrapper wrapper-content">
            	<div class="row animated fadeInRight">
                	<div class="col-md-12">
                    	<div class="ibox">
                        	<div class="ibox-title" style="padding-right:8px;">
                            	<h5>${guildHomeView.guild_name}</h5>
                            	<input id="usr_id" type="hidden" class="form-control" name="usr_id" value="${sessionScope.userInfoSession.usr_id}">
                            	<input id="usr_name" type="hidden" class="form-control" name="usr_name" value="${sessionScope.userInfoSession.usr_name}">
                            	<input id="guild_id" type="hidden" class="form-control" name="guild_id" value="${guildHomeView.guild_id}">
                            	<input id="guild_name" type="hidden" class="form-control" name="guild_name" value="${guildHomeView.guild_name}">
                            	<input id="guild_ideology" type="hidden" class="form-control" name="guild_ideology" value="${guildHomeView.guild_ideology}">
                           		<c:choose>
                           			<c:when test="${guildHomeLike == 0}">
                           				<button id="guildlikeBtn" type="button" class="btn btn-xs btn-white" style="float:right; border:white;"><i class="fa fa-thumbs-up"></i> 추천</button>
                           			</c:when>
                           			<c:otherwise>
                           				<button id="guildlikeBtn" type="button" class="btn btn-xs btn-white" style="float:right; color:white; background-color:#ed5565; border:#ed5565;"><i class="fa fa-thumbs-up"></i> 취소</button>
                           			</c:otherwise>
                           		</c:choose>
                        	</div>
                        	<div>
                            	<div class="ibox-content no-padding border-left-right">
                                <!-- <img alt="image" class="img-fluid" src="img/character/sp.gif" style="width:100%; height: 250px;"> -->
                                	<img alt="image" class="img-fluid" src="img/landing/shattered.png" style="width:100%; height: 250px;"/>
                            	</div>
                            	<div class="ibox-content profile-content">
                            		<div class="infomation">
                            			<h4><strong><i class="fa fa-star"></i> 길드장 : </strong>${guildHomeView.guild_leader}</h4>
                            		</div>
                               		<div class="infomation">
                               			<strong>Lv. </strong>10
                               		</div>
                               		<div class="infomation">
                               			<c:choose>
                               				<c:when test="${guildTotalRank == 0}">
                               					<strong>실시간 종합 순위 : </strong> 순위 정보 없음
                               				</c:when>
                               				<c:otherwise>
                               					<strong>실시간 종합 순위 : </strong> <span>${guildTotalRank}</span>위
                               				</c:otherwise>
                               			</c:choose>
                               		</div>
                                	<div class="infomation">
                                		<jsp:useBean id="now" class="java.util.Date" />
										<fmt:formatDate value="${guildHomeView.create_date}" pattern="yyyy-MM-dd" var="reg_date" />
                                			<strong>생성일 :</strong> ${reg_date}
                                	</div>
                                	<div class="i-box">
                               			<div class="i-box-content">
                                			<p style="height: 120px;">
                                    			<strong>소개</strong><br>
                                    			<c:choose>
                               						<c:when test="${guildHomeView.guild_introduce != ''}">
                                    					${guildHomeView.guild_introduce}
                               						</c:when>
                               						<c:otherwise>
                               							<span>등록된 소개글이 없습니다.</span>
                               						</c:otherwise>
                               					</c:choose>
                                			</p>
                                		</div>
                                	</div>
                                	<div class="row m-t-lg">
                                 		<div class="col-md-12">
                                 			<div class="infomation">
                               					<strong>Lv. </strong>10
                               					 &nbsp; &nbsp; &nbsp;<strong><i class="fa fa-arrow-right"></i></strong> &nbsp; &nbsp; &nbsp;
                               					<strong>Lv. </strong>11 <br>
                               					<strong>(</strong>456454 <strong>/</strong>74564654<strong>)</strong>
                               				</div>
                                 			<div class="progress">
                                				<div class="progress-bar progress-bar-striped progress-bar-animated progress-bar-danger" style="width: ${guildHomeView.guild_slots *3}%" role="progressbar" aria-valuenow="${guildHomeView.guild_slots}" aria-valuemin="0" aria-valuemax="30">( 456454     /     74564654 )    30%</div>
                            				</div>
                                    	</div>
                                	</div>
                                	<br>
                                	<div class="user-button">
                                  		<div class="row">
                                			<c:choose>
                        						<c:when test="${sessionScope.userGuildInfoSession == null}">
                        							<c:choose>
                        								<c:when test="${guildApplication == guildHomeView.guild_id}">
                                        					<div class="col-md-12">
                                            					<button id="guildJoinCancelBtn" type="button" class="btn btn-primary btn-sm btn-block" style="color: #1c84c6;background-color: white;border-color: #1c84c6;border: 1px solid #1c84c6;"><i class="fa fa-id-card-o"></i> 가입 취소</button>
                                        					</div>
                        								</c:when>
                        								<c:otherwise>
                        									<div class="col-md-12">
                                            					<button id="guildJoinBtn" type="button" class="btn btn-primary btn-sm btn-block" style="color: #1c84c6;background-color: white;border-color: #1c84c6;border: 1px solid #1c84c6;"><i class="fa fa-id-card-o"></i> 가입 신청</button>
                                        					</div>
                        								</c:otherwise>
                        							</c:choose>
                        						</c:when>
                        						<c:otherwise>
                        							<c:choose>
                        								<c:when test="${sessionScope.userInfoSession.usr_guildname == guildHomeView.guild_name}">
                        									<div class="col-md-12">
                                            					<button id="guildSecessionBtn" type="button" class="btn btn-primary btn-sm btn-block guildSecessionBtn" style="color: #ed5565;background-color: white;border-color: #ed5565;border: 1px solid #ed5565;"><i class="fa fa-id-card-o"></i> 길드 탈퇴</button>
                                        					</div>
                        								</c:when>
                        								<c:otherwise>
                        								</c:otherwise>
                        							</c:choose>
                        						</c:otherwise>
                        					</c:choose>
                                    	</div>
                                	</div>
                           	 	</div>
                    		</div>
                		</div>
                    </div>
                	<div class="col-md-12">
                    	<div class="ibox ">
                        	<div class="ibox-title">
                           	 	<h5>방명록</h5>
                        	</div>
                        	<div class="ibox-content">
                        		<div>
                        			<div id="replyBox" class="input-group m-b">
                        				<textarea id="guestBookContent" class="form-control" style="width: 80%; resize: none;"></textarea>
                        				<button id="guestBookSuccess" class="btn btn-white btn-xs" type="button" style="background: #1c84c6; color: white; width: 20%">
                        					<i class="fa fa-reply"></i>
                        				</button>
                        			</div>
                        			<div class="feed-activity-list">
                        				<div class="feed-element">
										</div>
                            		</div>
                            		<div class="user-button-open">
                                    		<div class="row">
                                    			<div class="col-md-12">
                                    				<button id="moreBtn" class="btn btn-primary btn-sm btn-block"><i class="fa fa-arrow-down"></i> 방명록 전체 열기</button>
                                    			</div>
                                    		</div>
                                	</div>
                                	<div class="user-button-reply" style="display:none;">
                                    		<div class="row">
                                    			<div class="col-md-12">
                                    				<button id="replyFocus" class="btn btn-primary btn-sm btn-block"><i class="fa fa-arrow-up"></i> 댓글쓰기</button>
                                    			</div>
                                    		</div>
                                	</div>
                       	 		</div>
                    		</div>
                		</div>
            		</div>
        		</div>
        <%@ include file="../template/loading.jsp"%>
		<%@ include file="../template/footer.jsp"%>
	 </div>
	  <%@ include file="../template/chatBox.jsp"%>
	  <%-- <%@ include file="../template/right_column.jsp"%> --%>
	</div>
	</div>
	<%@ include file="../template/plugin_js.jsp"%>
</body>
</html>