
<c:forEach items="${guildHomeGuestBook}" var="guestBookList"
	varStatus="status">
	<div class="feed-element feed-element-${guestBookList.gb_id}">
		<a href="javascript:void(0)" class="float-left"
			style="cursor: default;"> <img alt="image" class="rounded-circle"
			src="img/a5.jpg">
		</a>
		<div class="media-body">
			<jsp:useBean id="geustBookNow" class="java.util.Date" />
			<fmt:formatDate value="${geustBookNow}" pattern="yyyy-MM-dd"
				var="today" />
			<fmt:formatDate value="${guestBookList.guest_date}"
				pattern="yyyy-MM-dd" var="reg_date" />
			<c:choose>
				<c:when test="${reg_date == today}">
					<small class="float-right"><i id="fa-calendar"
						class="fa fa-clock-o"></i> <fmt:formatDate
							value="${guestBookList.guest_date}" pattern="HH:mm" /></small>
				</c:when>
				<c:otherwise>
					<small class="float-right"><i id="fa-calendar"
						class="fa fa-calendar"> </i> <fmt:formatDate
							value="${guestBookList.guest_date}" pattern="MM-dd" /></small>
				</c:otherwise>
			</c:choose>
			<a href="#"> <strong>${guestBookList.guest_writer}</strong>
			</a>
			<c:if test="${guestBookList.tag_name != null}">
				<strong>To.</strong> ${guestBookList.tag_name}
                                            </c:if>
			<input type="hidden" name="tag_name"
				id="tag_name${guestBookList.gb_id}"
				value="${guestBookList.guest_writer}" />
			<div class="well">${guestBookList.guest_content}</div>
			<div id="guestBookTag${guestBookList.gb_id}" class="guestBookTagArea">
				<br> <strong>@${guestBookList.guest_writer}</strong>
				<div id="guestBookTagBtnArea${guestBookList.gb_id}"
					class="input-group m-b guestBookTagBtnArea">
					<textarea id="guestBookTagContent${guestBookList.gb_id}"
						class="form-control guestBookTagContent"
						style="width: 80%; resize: none;"></textarea>
					<button id="guestBookTagSuccess${guestBookList.gb_id}"
						class="btn btn-white btn-xs" type="button"
						style="background: #1c84c6; color: white; width: 20%">
						<i class="fa fa-reply"></i>
					</button>
				</div>
			</div>
			<div id="guestBookBtn${guestBookList.gb_id}"
				class="float-right guestBookBtn">
				<c:choose>
					<c:when
						test="${sessionScope.userInfoSession.usr_name == guestBookList.guest_writer}">
						<button id="${guestBookList.gb_id}" type="button"
							class="btn btn-xs btn-white">
							<i class="fa fa-trash-o"></i> 삭제
						</button>
					</c:when>
					<c:otherwise>
						<button id="${guestBookList.gb_id}" type="button"
							class="btn btn-xs btn-white">
							<i class="fa fa-comment"></i> 댓글
						</button>
					</c:otherwise>
				</c:choose>
			</div>
			<div id="guestBookBtn2${guestBookList.gb_id}"
				class="float-right guestBookBtn2" style="display: none;">
				<button id="guestBookCancel" type="button"
					class="btn btn-xs btn-white">
					<i class="fa fa-trash-o"></i> 취소
				</button>
			</div>
		</div>
	</div>
</c:forEach>
<div class="feed-element">
	<div class="input-group m-b">
		<textarea id="guestBookContent" class="form-control"
			style="width: 80%; resize: none;"></textarea>
		<button id="guestBookSuccess" class="btn btn-white btn-xs"
			type="button" style="background: #1c84c6; color: white; width: 20%">
			<i class="fa fa-reply"></i>
		</button>
	</div>
</div>
