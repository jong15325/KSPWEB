<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Survival Project</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="css/plugins/summernote/summernote-bs4.css" rel="stylesheet">

    <link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<style>
.note-para, .note-view, .note-icon-caret, .note-color-reset, .note-fontname, .note-insert, .note-float, .note-imagesize{
	display:none;
}

p img{
 width : 100%;
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
                    	<span>커뮤니티</span>
                    </li>
                    <li class="breadcrumb-item">
                    	<span>자유</span>
                    </li>
                    <li class="breadcrumb-item active">
                    	<strong>수정</strong>
                    </li>
                </ol>
            </div>
        </div>
        
        
        <div class="wrapper wrapper-content animated fadeInRight ecommerce">
        	<div class="row">
        		<div class="col-lg-12">
        			<div class="tabs-container">
        				<div class="tab-content">
        					<div id="tab-1" class="tab-pane active">
        						<div class="panel-body">
									<form name="updateFrm" id="updateFrm" method="post" enctype="multipart/form-data">
										<fieldset>
											<input class="form-control" type="hidden" value="1" name="article_category" id="article_category" />
                                        	<c:if test="${sessionScope.userInfoSession.usr_name != null}">
                                       			<input class="form-control" type="hidden" value="${sessionScope.userInfoSession.usr_name}" name="article_writer" id="article_writer" />
                                            </c:if>
                                            <div class="form-group row"><label class="col-sm-2 col-form-label">제목</label>
                                                <div class="col-sm-10"><input id="article_title" type="text" class="form-control" name = "article_title" placeholder="제목을 입력하세요." maxlength="50" value="${contentUpdate.article_title}" ></div>
                                            </div>
                                            <div class="form-group row"><label class="col-sm-2 col-form-label">내용</label>
                                                <div class="col-sm-10">
                                                    <textarea name="article_content" id="summernote" class="summernote">
                                                    ${contentUpdate.article_content}
                                                    </textarea>
                                                </div>
                                            </div>
                                            <div class="box-footer">
                                            <input type="hidden" name="currentPage" value="${currentPage}" />
											<input type="hidden" id="article_no" name="article_no" value="${contentUpdate.article_no}" />
												<input class="btn btn-primary" type="button" id="btnList" value="리스트" />
												<div class="pull-right">
													<input class="btn btn-success" type="button" id="btnSave" value="수정" />
												</div>
											</div>
										</fieldset>
									</form>
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
	<!-- Mainly scripts -->
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
	<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

	<!-- Custom and plugin javascript -->
	<script src="js/inspinia.js"></script>
	<script src="js/plugins/pace/pace.min.js"></script>

	<!-- SUMMERNOTE -->
	<!-- include summernote css/js-->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
	
	<!-- Data picker -->
	<script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script>
    	$(document).ready(function(){
    		var boardCategoty = 1;
    		
    		$('#btnList').bind('click', function() {
				$('#updateFrm').attr('action', 'noticeBoardMain.do');
				$('#updateFrm').submit();
			});
    		
    		$('#btnSave').bind('click', function() {
    			var title_str = $('#article_title').val();
    			
    			if($('#article_title').val().length < 1){
    				swal("제목을 입력하세요");
    			}else{
    				$('#updateFrm').attr('action', 'noticeBoardUpdateProcess.do');
    				$('#updateFrm').submit();
    			}
			});
    		
        	$('.summernote').summernote({
        	    height : 500, // 에디터의 높이 
        	    minHeight : null,
        	    maxHeight : null,
        	    fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
    			fontNamesIgnoreCheck : [ '맑은고딕' ],
    			focus: true,
        	    lang : 'ko-KR', // 기본 메뉴언어 US->KR로 변경
        	   	resize : '100%',
        	    callbacks: {
    				onImageUpload: function(files, editor, welEditable) {
    		            for (var i = files.length - 1; i >= 0; i--) {
    		            	sendFile(files[i], this, boardCategoty);
    		            }
    		        }
    			}
        	});
        	
    	});

    	function sendFile(file, el, boardCategory) {
    		var form_data = new FormData();
          	form_data.append('file', file);
          	form_data.append('boardCategory', boardCategory);
          	
          	$.ajax({
            	data: form_data,
            	type: "POST",
            	url: 'summernoteUpload.do',
            	cache: false,
            	contentType: false,
            	enctype: 'multipart/form-data',
            	processData: false,
            	success: function(img_name) {
            		alert("img_name : "+img_name)
              		$(el).summernote('editor.insertImage', img_name);
            	}
          	});
        }
    	
    	var postForm = function() {
    		var contents =  $('textarea[name="article_content"]').html($('.summernote').code());
		}
	</script>
</body>
</html>