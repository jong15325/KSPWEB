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
	 <div id="page-wrapper" class="gray-bg dashbard-1">
	 	<%@ include file="../template/header.jsp"%>
	 	<div class="row  border-bottom white-bg dashboard-header">
	 	</div>
	 	<div class="wrapper wrapper-content">
	 	</div>
		<%@ include file="../template/footer.jsp"%>
	 </div>
	  <%@ include file="../template/chatBox.jsp"%>
	  <%-- <%@ include file="../template/right_column.jsp"%> --%>
	</div>
	<script>
        $(document).ready(function() {
    		
        });
    </script>
	<%@ include file="../template/plugin_js.jsp"%>
</body>
</html>