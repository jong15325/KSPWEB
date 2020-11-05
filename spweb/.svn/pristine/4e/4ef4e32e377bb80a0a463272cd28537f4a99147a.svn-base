<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<%@ include file="../template/head.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		var cardDetatilView = 0;
		var lastNum = 0;
		var limitNum = 5;
		var viewState = 0;
		$('#replyBox').hide();
		
		$('#magicViewBtn').on("click", function(){
			var nowView = $(".nowViewValue").val(); //1매직 2//웨펀 //3아머
			if(nowView != 1){
				var itm_id = $("#magic_itm_id").val();
				cardDetatilView = 0;
				user_card_view(itm_id);
				$(".nowViewValue").val(1);
			}
		});
		
		$('#weaponViewBtn').on("click", function(){
			var nowView = $(".nowViewValue").val(); //1매직 2//웨펀 //3아머
			if(nowView != 2){
			var itm_id = $("#weapon_itm_id").val();
			cardDetatilView = 0;
			user_card_view(itm_id);
			$(".nowViewValue").val(2);
			}
		});
		
		$('#armViewBtn').on("click", function(){
			var nowView = $(".nowViewValue").val(); //1매직 2//웨펀 //3아머
			if(nowView != 3){
				var itm_id = $("#arm_itm_id").val();
				cardDetatilView = 0;
				user_card_view(itm_id);
				nowView = 3;
				$(".nowViewValue").val(3);
			}
		});
		
		$('#myHomelikeBtn').on("click", function(){
			var like_type = 1;
			var usr_id = $("#usr_id").val();
			var usr_name = $("#usr_name").val();
			var like_usr_id = $("#like_usr_id").val();
			var like_usr_name = $("#like_usr_name").val();
			var form_data = {
					usr_id : usr_id,
					usr_name : usr_name,
					like_usr_id : like_usr_id,
					like_usr_name : like_usr_name,
					like_type : like_type,
			};
			
			$.ajax({
				method : "post",
				dataType : "json",
				url : "myHomeLike.do",
				data : form_data,
				success : function(data){
					if(data == 1){
						$("#myHomelikeBtn").css("color","white");
						$("#myHomelikeBtn").css("background-color","#ed5565");
						$("#myHomelikeBtn").css("border","#ed5565");
						$("#myHomelikeBtn").empty();
						$("#myHomelikeBtn").append("<i class='fa fa-thumbs-up'></i>"+" 취소");
					}else if(data == 2){
						$("#myHomelikeBtn").css("color","black");
						$("#myHomelikeBtn").css("background-color","white");
						$("#myHomelikeBtn").css("border","white");
						$("#myHomelikeBtn").empty();
						$("#myHomelikeBtn").html("<i class='fa fa-thumbs-up'></i>"+" 추천");
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
							text: "오류 코드 33",
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
			var guest_category = 1; // 0 길드홈 게스트북 , 1 마이홈 게스트북
			var type_id = $("#like_usr_id").val();
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
				url : "myHomeGuestBookInsertProcess.do",
				data : form_data,
				success : function(data){
					/* alert('등록 성공'); */
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
							text: "오류 코드 34",
						  	icon: "warning",
						})
					}
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
					var guest_category = 1;
					var tag_name = $("#tag_name"+replceAreaId).val();
					var type_id = $("#like_usr_id").val();
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
						url : "myHomeGuestBookInsertProcess.do",
						data : form_data,
						success : function(){
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
									text: "오류 코드 35",
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
									text: "오류 코드 26",
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
						url : "myHomeGuestBookDeleteProcess.do",
						data : form_data,
						success : function(data){
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
									text: "오류 코드 36",
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
									text: "오류 코드 37",
								  	icon: "warning",
								})
							}
						}
					});
				break;
			}
		});
		
$('#replyFocus').bind('click', focusReply);
		
		function focusReply(){
			$('#guestBookContent').focus();
		}
		
		$('#moreBtn').bind('click', guestBookList);
		
		function guestBookList(){
			//var viewLastNum = lastNum; 제한 더보기
			var viewLastNum = 0; // 전체 더보기
			var viewLimitNum = limitNum;
			var type_id = $("#like_usr_id").val();
			var sessionUserId = $("#usr_name").val();
			var form_data = {
					viewLastNum : viewLastNum,
					viewLimitNum : viewLimitNum,
					type_id : type_id,
			};
			$.ajax({
				method : "POST",
				url : "myHomeGuestBookListProcess.do",
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
							$(".replyFocusBtn").css('display','block');
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
	
	function user_card_view(itm_id){
		var form_data = {
				itm_id : itm_id,
		};
		$.ajax({
			method : "post",
			dataType : "json",
			url : "userCardDetailView.do",
			data : form_data,
			success : function(data){
				cardDetatilView = 1;
				var cardDate = 0;
				cardDate = data.itm_trans_gf;
				if(cardDate < 0){
					cardDate = 0;
				}
				$("#view_div").empty();
				$("#view_div").css('display','block');
				$("#view_div").append("<div class='view_close_box'></div>");
				$(".view_close_box").append("<button type='button' id='itm_view_close' class='itm_view_close' onclick='return view_close()'></button>");
				$("#view_div").append("<div class='itm_option_info'></div>");
				$("#view_div").append("<div class='itm_option_box'></div>");
				$(".itm_option_info").append("<span class='itm_type_info'>타입</span>");
				$(".itm_option_info").append("<span class='itm_name_info'>명칭</span>");
				$(".itm_option_info").append("<span class='itm_channel_info'>채널제한</span>");
				$(".itm_option_info").append("<span class='itm_element_info'>속성</span>");
				$(".itm_option_info").append("<span class='itm_gf_info'>남은 일수</span>");
				$(".itm_option_box").append("<span class='itm_type_span'>"+data.card_type_info+"</span>");
				$(".itm_option_box").append("<span class='itm_name_span'>"+data.card_name_info+"</span>");
				$(".itm_option_box").append("<span class='itm_channel_span'>"+data.card_channl_info+"</span>");
				$(".itm_option_box").append("<span class='itm_element_span'>"+data.card_element+"</span>");
				$(".itm_option_box").append("<span class='itm_gf_span'>"+cardDate+"</span>");
				$("#view_div").append("<div class='itm_skill_box'></div>");
				if(data.card_skill1 != "")
				$(".itm_skill_box").append("<span class='itm_skill1'>1. "+data.card_skill1+"</span>");
				if(data.card_skill2 != "")
				$(".itm_skill_box").append("<span class='itm_skill2'>2. "+data.card_skill2+"</span>");
				if(cardDate > 0){
					/* $("#view_div").append("<img class='itm_view_gold' alt='image' class='img-fluid' src='img/CARD/etc/gold.png'/>"); */
					$("#view_div").append("<div class='goldBorderBlock_view'></div>");
					$("#view_div").append("<span class='itm_view_gf_date'>"+data.card_date+"</span>");
				}else{
					$("#view_div").append("<div class='blackBorderBlock_view'></div>");
				}
				if(data.itm_skill > 0){
					if(data.itm_trans_gf > 0){
						$("#view_div").append("<div class='card_list_skill_back_view_gold'></div>");
					}else{
						$("#view_div").append("<div class='card_list_skill_back_view'></div>");
					}
					$("#view_div").append("<span class='card_list_skill_view'>S</span>");
					
					/* $("#view_div").append("	<img class='itm_view_skill_img' alt='image' class='img-fluid' src='img/CARD/etc/s.png'/>"); */
				}
				$("#view_div").append("<img class='img-fluid itm_view_img' alt='image' src='"+data.card_img_path+"'/>");
				if(data.itm_skill > 0){
					$("#view_div").append("<img id='card_template' alt='image' class='img-fluid' src='img/CARD/etc/card_template2.png'/>");
				}else{
					$("#view_div").append("<img id='card_template' alt='image' class='img-fluid' src='img/CARD/etc/card_template3.png'/>");
				}
				/* $("#view_div").attr('class','view_div animated fadeOutLeft'); */
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
						text: "오류 코드 38",
					  	icon: "warning",
					})
				}
			}
		});
	}
	
	function view_close(){
	    $("#view_div").slideUp('fast', function(){
	    	$("#view_div").empty();
	    });
	    $(".nowViewValue").val(0);
	}
	
</script>
<style>
.infomation{
	margin-bottom : 5px;
	border-bottom: 1px solid black;
}

.ibox-tools{
	display:none;
}

.guestBookTagArea{
	display:none;
}

.nowElementTable td{
 text-align: center;
 padding: 7px;
}

.itm_gf_date{
    position: absolute;
    background: #5A2400;
    font-size: 9px;
    color: #FFEB29;
    z-index: 5;
    width: 23px;
    height: 15px;
    text-align: center;
    border-right: 1px solid #FFEB29;
    border-bottom: 1px solid #FFEB29;
    border-bottom-right-radius: 5px;
    margin-left: 1px;
    
}

.itm_skill_img{
    width: 12px;
    height: 16px;
    position: absolute;
    margin-top: 2px;
    margin-left: 26px;
}
.itm_gold{
	position: absolute;
    width: 42px;
    z-index: 1;
}

.itm_silver{
    position: absolute;
    width: 40px;
    height: 77px;
    z-index: 1;
}

.itm_type_span{
    position: absolute;
    margin-top: 1px;
    width: 98%;
    color: #E7DFCE;
    text-align: right;
    font-size: 12px;
    font-weight: 500;
}

.itm_name_span{
    position: absolute;
    margin-top: 19px;
    width: 98%;
    color: #E7DFCE;
    text-align: right;
    font-size: 12px;
    font-weight: 500;
}

.itm_channel_span{
    position: absolute;
    margin-top: 39px;
    width: 98%;
    color: #E7DFCE;
    text-align: right;
    font-size: 12px;
    font-weight: 500;
}

.itm_element_span{
    position: absolute;
    margin-top: 55px;
    width: 98%;
    color: #E7DFCE;
    text-align: right;
	font-size: 12px;
	font-weight: 500;
}

.itm_gf_span{
    position: absolute;
    margin-top: 75px;
    width: 98%;
    color: #FFDB00;
    text-align: right;
   font-weight: 600;
}

.itm_view_gf_date{
	position: absolute;
    background: #5A2400;
    font-size: 11px;
    color: #FFEB29;
    z-index: 5;
    width: 24px;
    height: 17px;
    text-align: center;
    border-right: 1px solid #FFEB29;
    border-bottom: 1px solid #FFEB29;
    border-bottom-right-radius: 5px;
    margin-left: 7px;
    margin-top: 39px;
}

.itm_view_skill_img{
    width: 12px;
    height: 16px;
    position: absolute;
    margin-top: 38px;
    margin-left: 41px;
    z-index: 2;
    border-radius : 2px;
}
.itm_view_gold{
	position: absolute;
    width: 53px;
    z-index: 1;
    margin-top: 36px;
    margin-left: 4px;
    z-index: 3;
    border-radius : 3px;
}

.itm_view_img{
	width: 47px;
    height: 90px;
    margin-top: 39px;
    margin-left: 7px;
    position: absolute;
    z-index: 1;
}

.view_div{
 	display: none;
 	width: 203px;
 	height: 297px;
 	margin: auto;
}

.itm_option_box{
	height: 100px;
    position: absolute;
    margin-top: 37px;
    width: 197px;
}

#card_template{
	border-radius: 9px;
}

.itm_view_close{
 	background-image: url(img/CARD/etc/view_close.png);
    margin-top: 5px;
    width: 25px;
    height: 25px;
    float: right;
    border: 0;
    outline: 0;
}

.itm_view_close:hover{
 	background-image: url(img/CARD/etc/view_close_hover.png);
 	cursor:pointer;
}

.itm_view_close:active{
	background-image: url(img/CARD/etc/view_close_active.png);
	cursor:pointer;
}

.view_close_box{
	position: absolute;
    width: 197px;
    height: 33px;
}

.itm_skill_box{
    height: 100px;
    position: absolute;
    margin-top: 170px;
    width: 197px;
    color: #BDBAB5;
    margin-left: 15px;
    font-weight: 600;
}

.itm_skill1{
    position: absolute;
    font-size: 12px;
    margin-top: 2px;
	font-weight: 600;
}

.itm_skill2{
    position: absolute;
    font-size: 12px;
    margin-top: 19px;
	font-weight: 600;
}

.itm_option_info{
 	height: 91px;
    width: 130px;
    position: absolute;
    margin-top: 37px;
    color: #BDBAB5;
    margin-left: 66px;
    font-weight: 500;
}

.itm_type_info{
    position: absolute;
    margin-top: 1px;
    width: 98%;
    color: #E7DFCE;
    text-align: left;
    font-size: 12px;
    font-weight: 500;
}

.itm_name_info{
    position: absolute;
    margin-top: 19px;
    width: 98%;
    color: #E7DFCE;
    text-align: left;
    font-size: 12px;
    font-weight: 500;
}

.itm_channel_info{
    position: absolute;
    margin-top: 38px;
    width: 98%;
    color: #E7DFCE;
    text-align: left;
    font-size: 12px;
    font-weight: 500;
}

.itm_element_info{
    position: absolute;
    margin-top: 56px;
    width: 98%;
    color: #E7DFCE;
    text-align: left;
	font-size: 12px;
	font-weight: 500;
}

.itm_gf_info{
    position: absolute;
    margin-top: 75px;
    width: 98%;
    color: #E7DFCE;
    text-align: left;
    font-weight: 500;
    font-size : 12px;
}


.goldBorderBlock {
    position: absolute;
    width: 43px;
    height: 77px;
    z-index: 1;
    border-radius: 2px;
}

.goldBorderBlock:before{
	content: '';
	position: absolute;
	left: -2px;
	top: -2px;
	/* background: linear-gradient(140deg, #f7c400, #f4e000, #f4eb00,#ffffff, #f4f700, #f7c400, #f7c400, #f4bf00, #f6d500, #f7c400); */
	background: linear-gradient(140deg, #f7c400, #f7c400, #f7c400,#ffffff, #d6ae31, #d6ae31, #d6ae31, #c69618, #c69618, #c69618);
	background-size: 400%;
	width: calc(100% + 4px);
	height: calc(100% + 4px);
	z-index: -1;
	animation: steam 7s linear infinite;
	border-radius: 1px;
}

@keyframes steam {
	0% {
		background-position: 0 0;
	}
	50% {
		background-position: 400% 0;
	}
	100% {
		background-position: 0 0;
	}
}

.goldBorderBlock:after {
	filter: blur(10px);
}

.goldBorderBlock_view {
    margin: auto;
    position: absolute;
    width: 49px;
    height: 90px;
    z-index: 1;
    border-radius: 2px;
    margin-top: 39px;
    margin-left: 6px;
}

.goldBorderBlock_view:before{
	content: '';
	position: absolute;
	left: -2px;
	top: -2px;
	/* background: linear-gradient(140deg, #f7c400, #f4e000, #f4eb00,#ffffff, #f4f700, #f7c400, #f7c400, #f4bf00, #f6d500, #f7c400); */
	background: linear-gradient(140deg, #f7c400, #f7c400, #f7c400,#ffffff, #d6ae31, #d6ae31, #d6ae31, #c69618, #c69618, #c69618);
	background-size: 400%;
	width: calc(100% + 4px);
	height: calc(100% + 4px);
	z-index: -1;
	animation: steam 7s linear infinite;
	border-radius: 1px;
}

@keyframes steam {
	0% {
		background-position: 0 0;
	}
	50% {
		background-position: 400% 0;
	}
	100% {
		background-position: 0 0;
	}
}

.goldBorderBlock_view:after {
	filter: blur(10px);
}

.silverBorderBlock {
    position: absolute;
    width: 43px;
    height: 77px;
    z-index: 1;
    border-radius: 2px;
}

.silverBorderBlock:before{
	content: '';
	position: absolute;
	left: -2px;
	top: -2px;
	background: linear-gradient(140deg, #738aa5, #738aa5, #738aa5,#ffffff, #738aa5, #738aa5, #738aa5, #42597b, #42597b, #42597b);
	background-size: 400%;
	width: calc(100% + 4px);
	height: calc(100% + 4px);
	z-index: -1;
	animation: steam 7s linear infinite;
	border-radius: 1px;
}

@keyframes steam {
	0% {
		background-position: 0 0;
	}
	50% {
		background-position: 400% 0;
	}
	100% {
		background-position: 0 0;
	}
}

.silverBorderBlock:after {
	filter: blur(10px);
}

.silverBorderBlock_view {
    margin: auto;
    position: absolute;
    width: 49px;
    height: 90px;
    z-index: 1;
    border-radius: 2px;
    margin-top: 39px;
    margin-left: 6px;
}

.silverBorderBlock_view:before{
	content: '';
	position: absolute;
	left: -2px;
	top: -2px;
	/* background: linear-gradient(140deg, #f7c400, #f4e000, #f4eb00,#ffffff, #f4f700, #f7c400, #f7c400, #f4bf00, #f6d500, #f7c400); */
	background: linear-gradient(140deg, #738aa5, #738aa5, #738aa5,#ffffff, #738aa5, #738aa5, #738aa5, #42597b, #42597b, #42597b);
	background-size: 400%;
	width: calc(100% + 4px);
	height: calc(100% + 4px);
	z-index: -1;
	animation: steam 7s linear infinite;
	border-radius: 1px;
}

@keyframes steam {
	0% {
		background-position: 0 0;
	}
	50% {
		background-position: 400% 0;
	}
	100% {
		background-position: 0 0;
	}
}

.silverBorderBlock_view:after {
	filter: blur(10px);
}

.brassBorderBlock {
    position: absolute;
    width: 43px;
    height: 77px;
    z-index: 1;
    border-radius: 2px;
}

.brassBorderBlock:before{
	content: '';
	position: absolute;
	left: -2px;
	top: -2px;
	background: linear-gradient(140deg, #ffaa42, #ffaa42, #ffaa42, #ffffff, #ffa229, #ffa229, #ffa229, #bd6900, #bd6900, #bd6900);
	background-size: 400%;
	width: calc(100% + 4px);
	height: calc(100% + 4px);
	z-index: -1;
	animation: steam 7s linear infinite;
	border-radius: 1px;
}

@keyframes steam {
	0% {
		background-position: 0 0;
	}
	50% {
		background-position: 400% 0;
	}
	100% {
		background-position: 0 0;
	}
}

.brassBorderBlock:after {
	filter: blur(10px);
}

.brassBorderBlock_view {
    margin: auto;
    position: absolute;
    width: 49px;
    height: 90px;
    z-index: 1;
    border-radius: 2px;
    margin-top: 39px;
    margin-left: 6px;
}

.brassBorderBlock_view:before{
	content: '';
	position: absolute;
	left: -2px;
	top: -2px;
	/* background: linear-gradient(140deg, #f7c400, #f4e000, #f4eb00,#ffffff, #f4f700, #f7c400, #f7c400, #f4bf00, #f6d500, #f7c400); */
	background: linear-gradient(140deg, #ffaa42, #ffaa42, #ffaa42, #ffffff, #ffa229, #ffa229, #ffa229, #bd6900, #bd6900, #bd6900);
	background-size: 400%;
	width: calc(100% + 4px);
	height: calc(100% + 4px);
	z-index: -1;
	animation: steam 7s linear infinite;
	border-radius: 1px;
}

@keyframes steam {
	0% {
		background-position: 0 0;
	}
	50% {
		background-position: 400% 0;
	}
	100% {
		background-position: 0 0;
	}
}

.brassBorderBlock_view:after {
	filter: blur(10px);
}

.blackBorderBlock {
    position: absolute;
    width: 43px;
    height: 77px;
    z-index: 1;
    border-radius: 2px;
}

.blackBorderBlock:before{
	content: '';
	position: absolute;
	left: -2px;
	top: -2px;
	background: linear-gradient(140deg, #292821, #292821, #292821, #292821, #292821, #292821, #292821, #292821, #292821, #292821);
	background-size: 400%;
	width: calc(100% + 4px);
	height: calc(100% + 4px);
	z-index: -1;
	animation: steam 7s linear infinite;
	border-radius: 1px;
}

@keyframes steam {
	0% {
		background-position: 0 0;
	}
	50% {
		background-position: 400% 0;
	}
	100% {
		background-position: 0 0;
	}
}

.blackBorderBlock:after {
	filter: blur(10px);
}

.blackBorderBlock_view {
    margin: auto;
    position: absolute;
    width: 49px;
    height: 90px;
    z-index: 1;
    border-radius: 2px;
    margin-top: 39px;
    margin-left: 6px;
}

.blackBorderBlock_view:before{
	content: '';
	position: absolute;
	left: -2px;
	top: -2px;
	/* background: linear-gradient(140deg, #f7c400, #f4e000, #f4eb00,#ffffff, #f4f700, #f7c400, #f7c400, #f4bf00, #f6d500, #f7c400); */
	background: linear-gradient(140deg, #292821, #292821, #292821,#292821, #292821, #292821, #292821, #292821, #292821, #292821);
	background-size: 400%;
	width: calc(100% + 4px);
	height: calc(100% + 4px);
	z-index: -1;
	animation: steam 7s linear infinite;
	border-radius: 1px;
}

@keyframes steam {
	0% {
		background-position: 0 0;
	}
	50% {
		background-position: 400% 0;
	}
	100% {
		background-position: 0 0;
	}
}

.blackBorderBlock_view:after {
	filter: blur(10px);
}

.card_list_skill{
    width: 15px;
    height: 15px;
    position: absolute;
    margin-top: -2px;
    margin-left: 28px;
    z-index: 5;
    border-radius: 2px;
    font-size: 12px;
    text-align: center;
    background: -webkit-linear-gradient(left top, #E7FB08, #10AAE7);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    color : #FF0000;
    font-weight: bolder;
}

.card_list_skill_back{
	width: 13px;
    height: 15px;
    background: #001c31;
    position: absolute;
    margin-top: 0px;
    margin-left: 29px;
    z-index: 4;
    border-left: 1px solid #292821;
    border-bottom: 1px solid #292821;
    border-bottom-left-radius: 5px;
}

.card_list_skill_back_gold{
	width: 13px;
    height: 15px;
    background: #001c31;
    position: absolute;
    margin-top: 0px;
    margin-left: 29px;
    z-index: 4;
    border-left: 1px solid #FFEB29;
    border-bottom: 1px solid #FFEB29;
    border-bottom-left-radius: 5px;
}

.card_list_skill_view{
	width: 15px;
    height: 20px;
    position: absolute;
    margin-top: 36px;
    margin-left: 40px;
    z-index: 5;
    border-radius: 2px;
    font-size: 14px;
    text-align: center;
    background: -webkit-linear-gradient(left top, #E7FB08, #10AAE7);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    color: #FF0000;
    font-weight: bolder;
}

.card_list_skill_back_view{
	width: 15px;
    height: 17px;
    background: #001c31;
    position: absolute;
    margin-top: 39px;
    margin-left: 39px;
    z-index: 4;
    border-left: 1px solid #292821;
    border-bottom: 1px solid #292821;
    border-bottom-left-radius: 5px;
}

.card_list_skill_back_view_gold{
    width: 15px;
    height: 17px;
    background: #001c31;
    position: absolute;
    margin-top: 39px;
    margin-left: 39px;
    z-index: 4;
    border-left: 1px solid #FFEB29;
    border-bottom: 1px solid #FFEB29;
    border-bottom-left-radius: 5px;
}

.itm_img{
	width: 40px;
	position: relative; 
	z-index: 1;
	margin-left: 1px;
}

.cardView{
    width: 42px;
    height: 77px;
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
				<h2>내 정보</h2>
					<ol class="breadcrumb">
						<li class="breadcrumb-item">
                            <a href="index.do">메인</a>
                        </li>
                        <li class="breadcrumb-item">
                            <strong>내 정보</strong>
                        </li>
                    </ol>
                </div>
            	<div class="col-lg-2">
            	</div>
        	</div>
        	<div class="wrapper wrapper-content">
        		<c:choose>
					<c:when test="${UserDTO.usr_admin >= 7}">
						<div class="col-md-12">
                    		<div class="ibox ">
                        		<div class="ibox-content">
 									방문 권한이 없습니다.
                    			</div>
               				</div>
           			 	</div>
					</c:when>
					<c:otherwise>
            		<div class="row animated fadeInRight">
                		<div class="col-md-12">
                    		<div class="ibox">
                        		<div class="ibox-title" style="padding-right:8px;">
                            		<h5><img alt="image" src="${myInfoLevelImg}" style="width:12px"/>  ${UserDTO.usr_name}</h5>
                            		<input id="usr_id" type="hidden" class="form-control" name="usr_id" value="${sessionScope.userInfoSession.usr_id}">
                            		<input id="usr_name" type="hidden" class="form-control" name="usr_name" value="${sessionScope.userInfoSession.usr_name}">
                            		<input id="like_usr_id" type="hidden" class="form-control" name="like_usr_id" value="${UserDTO.usr_id}">
                            		<input id="like_usr_name" type="hidden" class="form-control" name="like_usr_name" value="${UserDTO.usr_name}">
                           			<c:if test="${sessionScope.userInfoSession.usr_name != UserDTO.usr_name}">
                           				<c:choose>
                           					<c:when test="${myHomeLike == 0}">
                           						<button id="myHomelikeBtn" type="button" class="btn btn-xs btn-white" style="float:right; border:white;"><i class="fa fa-thumbs-up"></i> 추천</button>
                           					</c:when>
                           					<c:otherwise>
                           						<button id="myHomelikeBtn" type="button" class="btn btn-xs btn-white" style="float:right; color:white; background-color:#ed5565; border:#ed5565;"><i class="fa fa-thumbs-up"></i> 취소</button>
                           					</c:otherwise>
                           				</c:choose>                           			
                           			</c:if>
                        		</div>
                        		<div>
                            		<div class="ibox-content no-padding">
                            			<div class="row">
                            				<div class="col-md-4">
                                				<img alt="image" class="img-fluid" src="${myInfoCharImg}" style="max-width:100%; width: 400px;"/>
                            				</div>
                            				<div class="col-md-7">
                            					<fmt:formatNumber value="${UserDTO.usr_points}" pattern="#,###" var="usr_points_patturn"/>
                            					<div class="infomation" style="padding: 10px;">
                            						<Strong>포인트 : </Strong>${usr_points_patturn}
                               					</div>
                               					<fmt:formatNumber value="${UserDTO.usr_code}" pattern="#,###" var="usr_code_patturn"/>
                               					<div class="infomation" style="padding: 10px;">
                               						<strong>코드 : </strong>${usr_code_patturn}
                               					</div>
                               					<div class="infomation" style="padding: 10px;">
                               						<c:choose>
                               							<c:when test="${myInfoRank == 0 || UserDTO.usr_admin >= 7}">
                               								<strong>실시간 종합 순위 : </strong> 순위 정보 없음
                               							</c:when>
                               							<c:otherwise>
                               								<strong>실시간 종합 순위 : </strong> <span>${myInfoRank}</span>위
                               							</c:otherwise>
                               						</c:choose>
                               					</div>
                               					<div class="infomation" style="padding: 10px;">
                               						<strong>정령 현황</strong>
                               						<table class="nowElementTable" style="margin:auto;">
                               			 				<tr style="text-align: center;">
                               			  					<td>
                               			  						<img alt="image" class="img-fluid" src="img/spimg/water.png" style="width:40px;"/>
                               			  					</td>
                               			  					<td>
                               			  						<img alt="image" class="img-fluid" src="img/spimg/fire.png" style="width:40px;"/>
                               			  					</td>
                            								<td>
                            									<img alt="image" class="img-fluid" src="img/spimg/earth.png" style="width:40px;"/>
                            								</td>
                            								<td>
                            									<img alt="image" class="img-fluid" src="img/spimg/wind.png" style="width:40px;"/>
                            								</td>
                               			  				</tr>
                               			  				<tr style="text-align: center;">
                               			  					<td>${UserDTO.usr_water}</td>
                               			  					<td>${UserDTO.usr_fire}</td>
                               			  					<td>${UserDTO.usr_earth}</td>
                               			  					<td>${UserDTO.usr_wind}</td>
                               			  				</tr>
                               						</table>
                               					</div>
                            				</div>
                            			</div>
                            			<div class="row">
                            				<div class="col-md-4">
                            				</div>
                            				<div class="col-md-7">
                               					<div class="infomation" style="padding: 10px;">
                               						<strong>장착 현황</strong>
                               						<table class="nowElementTable" style="margin:auto;">
                               			 			<tr style="text-align: center;">
                               			 				<c:choose>
                               			 			       	<c:when test="${UserNowEquipMagic != null}">
                               			 						<td>
                               			 							<input id="magic_itm_id" name="magic_itm_id" type="hidden" value="${UserNowEquipMagic.itm_id}">
                               			 							<div class="cardView">
                               			 								<c:if test="${UserNowEquipMagic.itm_gf > 0}">
                               			 									<!-- <img class="itm_gold" alt="image" class="img-fluid" src="img/CARD/etc/gold.png"/> -->
                               			 									<div class="goldBorderBlock"></div>
                               			 									<span class="itm_gf_date">${UserNowEquipMagic.card_date}</span>
                               			  								</c:if>
                               			  								<c:if test="${UserNowEquipMagic.itm_gf < 1}">
                               			  									<div class="blackBorderBlock"></div>
                               			  								</c:if>
                               			  								<c:if test="${UserNowEquipMagic.skill_flag}">
                               			  									<!-- <img class="itm_skill_img" alt="image" class="img-fluid" src="img/CARD/etc/s.png"/> -->
                               			  									<c:if test="${UserNowEquipMagic.itm_gf < 1}">
      																			<div class="card_list_skill_back"></div>
      																		</c:if>
      																		<c:if test="${UserNowEquipMagic.itm_gf > 0}">
      																			<div class="card_list_skill_back_gold"></div>
      																		</c:if>
      																		<span class="card_list_skill">S</span>
                               			  								</c:if>
                               			  								<img alt="image" class="img-fluid itm_img" src="${UserNowEquipMagic.itm_img_path}"/>
                               			  							</div>
                               			  						</td>
                               			 					</c:when>
                               			 					<c:otherwise>
                               			 						<td>
                               			 							<div>
                               			  								<img alt="image" class="img-fluid" src="img/spimg/MyMagic.png" style="width:40px; height:73px;"/>
                               			  							</div>
                               			  						</td>
                               			 					</c:otherwise>
                               			 				</c:choose>
                               			 				<c:choose>
                               			 			       	<c:when test="${UserNowEquipWeapon != null}">
                               			 						<td>
                               			 							<input id="weapon_itm_id" name="weapon_itm_id" type="hidden" value="${UserNowEquipWeapon.itm_id}">
                               			 							<div class="cardView">
                               			 								<c:if test="${UserNowEquipWeapon.itm_gf > 0}">
                               			 									<!-- <img class="itm_gold" alt="image" class="img-fluid" src="img/CARD/etc/gold.png"/> -->
                               			 									<div class="goldBorderBlock"></div>
                               			  									<span class="itm_gf_date">${UserNowEquipWeapon.card_date}</span>
                               			  								</c:if>	
                               			  								<c:if test="${UserNowEquipWeapon.itm_gf < 1}">
                               			  									<div class="blackBorderBlock"></div>
                               			  								</c:if>
                               			  								<c:if test="${UserNowEquipWeapon.skill_flag}">
                               			  									<!-- <img class="itm_skill_img" alt="image" class="img-fluid" src="img/CARD/etc/s.png"/> -->
                               			  									<c:if test="${UserNowEquipWeapon.itm_gf < 1}">
      																			<div class="card_list_skill_back"></div>
      																		</c:if>
      																		<c:if test="${UserNowEquipWeapon.itm_gf > 0}">
      																			<div class="card_list_skill_back_gold"></div>
      																		</c:if>
      																		<span class="card_list_skill">S</span>
                               			  								</c:if>
                               			  								<img alt="image" class="img-fluid itm_img" src="${UserNowEquipWeapon.itm_img_path}"/>
                               			  							</div>
                               			  						</td>
                               			 					</c:when>
                               			 					<c:otherwise>
                               			 						<td>
                               			 							<div>
                               			  								<img alt="image" class="img-fluid" src="img/spimg/MyWeapon.png" style="width:40px; height:73px;"/>
                               			  							</div>
                               			  						</td>
                               			 					</c:otherwise>
                               			 				</c:choose>
                              							<c:choose>
                               			 			       	<c:when test="${UserNowEquipArm != null}">
                               			 						<td>
                               			 							<input id="arm_itm_id" name="arm_itm_id" type="hidden" value="${UserNowEquipArm.itm_id}">
                               			 							<div class="cardView">
                               			 								<c:if test="${UserNowEquipArm.itm_gf > 0}">
                               			 									<!-- <img class="itm_gold" alt="image" class="img-fluid" src="img/CARD/etc/gold.png"/> -->
                               			  									<div class="goldBorderBlock"></div>
                               			  									<span class="itm_gf_date">${UserNowEquipArm.card_date}</span>
                               			  								</c:if>
                               			  								<c:if test="${UserNowEquipWeapon.itm_gf < 1}">
                               			  									<div class="blackBorderBlock"></div>
                               			  								</c:if>
                               			  								<c:if test="${UserNowEquipArm.skill_flag}">
                               			  									<c:if test="${UserNowEquipArm.itm_gf < 1}">
      																			<div class="card_list_skill_back"></div>
      																		</c:if>
      																		<c:if test="${UserNowEquipArm.itm_gf > 0}">
      																			<div class="card_list_skill_back_gold"></div>
      																		</c:if>
      																		<span class="card_list_skill">S</span>
                               			  								</c:if>
                               			  								<img alt="image" class="img-fluid itm_img" src="${UserNowEquipArm.itm_img_path}"/>
                               			  							</div>
                               			  						</td>
                               			 					</c:when>
                               			 					<c:otherwise>
                               			 						<td>
                               			 							<div>
                               			  								<img alt="image" class="img-fluid" src="img/spimg/MyArmor.png" style="width:40px; height:73px;"/>
                               			  							</div>
                               			  						</td>
                               			 					</c:otherwise>
                               			 				</c:choose>
                               			 				<c:choose>
                               			 			       	<c:when test="${UserNowEquipPet != null}">
                               			 						<td>
                               			 							<input id="pet_itm_id" name="pet_itm_id" type="hidden" value="${UserNowEquipPet.itm_id}">
                               			 							<div class="cardView">
                               			 								<!-- <img class="itm_silver" alt="image" class="img-fluid" src="img/CARD/etc/silver.png"/> -->
                               			 								<div class="silverBorderBlock"></div>
                               			  								<img alt="image" class="img-fluid itm_img" src="${UserNowEquipPet.itm_img_path}"/>
                               			  							</div>
                               			  						</td>
                               			 					</c:when>
                               			 					<c:otherwise>
                               			 						<td>
                               			 							<div>
                               			  								<img alt="image" class="img-fluid" src="img/spimg/MyPet.png" style="width:40px; height:73px;"/>
                               			  							</div>
                               			  						</td>
                               			 					</c:otherwise>
                               			 				</c:choose>
                               			  			</tr>
                               			  				<tr style="text-align: center;">
                               			  					<td>
                               			  						<c:if test="${UserNowEquipMagic != null}">
                               			  							<button id="magicViewBtn" type="button" class="btn btn-outline btn-success">상세</button>
                               			  						</c:if>
                               			  					</td>
                               			  					<td>
                               			  						<c:if test="${UserNowEquipWeapon != null}">
                               			  							<button id="weaponViewBtn" type="button" class="btn btn-outline btn-success">상세</button>
                               			  						</c:if>
                               			  					</td>
                               			  					<td>
                               			  						<c:if test="${UserNowEquipArm != null}">
                               			  							<button id="armViewBtn" type="button" class="btn btn-outline btn-success">상세</button>
                               			  						</c:if>
                               			  					</td>
                               			  				</tr>
                               						</table>
                               						<div id="view_div" class="view_div animated fadeInRight">
                               						</div>
                               						<input class="nowViewValue" type="hidden" value="0">
                               					</div>
                               					<div class="infomation" style="padding: 10px;">
                               						<span>
                               							<strong>길드 : </strong>
                               							<c:choose>
                               								<c:when test="${UserDTO.usr_guildname != ''}">
                               									${UserDTO.usr_guildname}
                               								</c:when>
                               								<c:otherwise>
                               									길드 없음
                               								</c:otherwise>
                               							</c:choose>
                               						</span>
                               						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               						<span>
                               						<strong>직책 : </strong>
                               						<c:choose>
                               							<c:when test="${UserDTO.usr_guildduty != ''}">
                               								${UserDTO.usr_guildduty}
                               							</c:when>
                               							<c:otherwise>
                               								직책 없음
                               							</c:otherwise>
                               						</c:choose>
                               						</span>
                               					</div>
                               					<div class="infomation" style="padding: 10px;">
                               						<span><strong>미션클리어 : </strong>${UserDTO.usr_mission}</span>
                               					</div>
                               					<div class="infomation" style="padding: 10px;">
                               						<span><strong>승 : </strong>${UserDTO.usr_wins}</span>
                               						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               						<span><strong>패 : </strong>${UserDTO.usr_losses}</span>
                               						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               						<span><strong>K.O : </strong>${UserDTO.usr_ko}</span>
                               						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               						<span><strong>Down : </strong>${UserDTO.usr_down}</span>
                               					</div>
                               				</div>
                            			</div>
                            			<br>
                            			<div class="row">
                            				<div class="col-md-12">
                            					<table class="nowElementTable" style="margin:auto;">
                            						<tr>
                            					<%-- <c:if test="${sessionScope.userInfoSession.usr_name != UserDTO.usr_name}"> --%>
                            							<td>
                                							<button type="button" class="btn btn-outline btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;쪽지&nbsp;&nbsp;&nbsp;&nbsp;</button>
                                						</td>
                                						<td>
                            								<button type="button" class="btn btn-outline btn-danger">&nbsp;&nbsp;&nbsp;&nbsp;판매&nbsp;&nbsp;&nbsp;&nbsp;</button>
                                						</td>
                                						<td>
                                							<button type="button" class="btn btn-outline btn-warning">&nbsp;&nbsp;&nbsp;&nbsp;구매&nbsp;&nbsp;&nbsp;&nbsp;</button>
                                						</td>
                            					<%-- </c:if> --%>
                            						</tr>
                            					</table>
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
                                	<div class="user-button-reply" >
                                    		<div class="row">
                                    			<div class="col-md-12">
                                    				<button id="replyFocus" class="btn btn-primary btn-sm btn-block replyFocusBtn" style="display:none;"><i class="fa fa-arrow-up"></i> 댓글쓰기</button>
                                    			</div>
                                    		</div>
                                	</div>
                       	 		</div>
                    		</div>
                		</div>
            		</div>
        		</div>
			</c:otherwise>
        </c:choose>
		<%@ include file="../template/footer.jsp"%>
	 </div>
	  <%@ include file="../template/chatBox.jsp"%>
	  <%-- <%@ include file="../template/right_column.jsp"%> --%>
	</div>
	</div>
	<%@ include file="../template/plugin_js.jsp"%>
</body>
</html>