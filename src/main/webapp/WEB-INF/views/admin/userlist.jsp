<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>User Management - User list</title>
<%@ include file="../includes/static.jsp"%>
</head>
<body>



	<div id="root">
		<div>
			<%@ include file="../includes/header.jsp"%>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="card m-2">
							<div class="card-body">
								<table class="table table-hover">
									<thead>
										<tr>
											<th >User ID</th>
											<th>Name</th>
											<th>Email</th>
											<th>User name</th>
										</tr>
									</thead>
									<tbody>
					                    <c:forEach items="${users}" var="user">
					                        <tr>
					                            <td>${user.userId}</td>
					                            <td>${user.name}</td>
					                            <td>${user.email}</td>
					                            <td>${user.username}</td>
					                        </tr>
					                    </c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>