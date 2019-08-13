<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>User Management - main page</title>
<%@ include file="../includes/static.jsp"%>
</head>
<body>

	<div id="root">
		<div>
			<%@ include file="../includes/header.jsp"%>
			<div class="container-fluid">
				<div class="row mt-3">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<div class="card">
						  <div class="card-body alert alert-warning">
						    <h5 class="card-title">Access denied</h5>
						    <h6 class="card-subtitle mb-2 text-muted">No sufficient permission</h6>
						    <p class="card-text">
						    	You are not allowed to access this page.
						    </p>
						    <a href="${contextPath}" class="btn btn-primary">Go to home page</a>
						  </div>
						</div>
					</div>
					<div class="col-md-3"></div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>