<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <link href="css/footer.css" rel="stylesheet">
<div class="footer">

	<a id="TopButton" class="ScrollButton">asd</a>
	<a id="BottomButton" class="ScrollButton">vds</a>
	
	<div class="float-right">
		<!-- <strong>Survival Project</strong> -->
		<img alt="image" src="img/spimg/bottom.gif" style="width:150px;"/>
	</div>
	<div>
		<strong>This page was created by Jung Jong-han</strong>
	</div>
	<script>
	$(function() {
        
    	$("#TopButton").click(function() {
     	   $('html').animate({scrollTop : 0}, 600);
    	});
 
    	$("#BottomButton").click(function() {
     	   $('html').animate({scrollTop : ($('#footer').offset().top)}, 600);
    	});
	});
	
	</script>
</div>
