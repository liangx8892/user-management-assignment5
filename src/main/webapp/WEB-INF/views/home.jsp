<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>User Management - main page</title>
<%@ include file="includes/static.jsp"%>
</head>
<body>

	<div id="root">
		<div>
			<%@ include file="includes/header.jsp"%>
			<div class="container-fluid">
				<div class="row">
					<div
						class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
						This is main page for User Management.
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>