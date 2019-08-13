<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>User Management - User </title>
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
						  <div class="card-body">
						    <h5 class="card-title">User Tutorials</h5>
						    <h6 class="card-subtitle mb-2 text-muted">Tutorials</h6>
						    <p class="card-text">
						    	This is tutorials page for User Management, only logged-in users can see it.
						    </p>
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