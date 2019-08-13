<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>User Management - Update Account</title>
<%@ include file="../includes/static.jsp"%>
<script type="text/javascript">
	function changeCaptcha(contextPath) {
		$(".captcha-image").attr("src", contextPath + "/captcha_image");
	}

	function updateAccount() {
		if($('#password').val() !== $('#passwordConfirm').val()) {
		   $.toast({
                heading: 'Error',
                text: 'password mismatch.',
                showHideTransition: 'fade',
                icon: 'error',
                position: 'top-right'
            })
			return false;
		}

		let data = {
			userId : $('#userId').val(),
			name : $('#name').val(),
			email : $('#email').val(),
			username : $('#username').val(),
			password : $('#password').val(),
			admin : $('#admin').val(),
			passwordConfirm: $('#passwordConfirm').val(),
		};

		$.ajax({
			type : "PUT",
			contentType : "application/json",
			url : "${contextPath}/user/account?kaptcha=" + $('#kaptcha').val(),
			data : JSON.stringify(data),
			dataType : 'json',
			timeout : 100000,
        }).done(function(res) {
            $.toast({
                heading: 'Success',
                text: 'Account updated successfully.',
                showHideTransition: 'slide',
                icon: 'success',
                position: 'top-right'
            })
        }).fail(function(res) {
            $.toast({
                heading: 'Error',
                text: res.responseJSON.message,
                showHideTransition: 'fade',
                icon: 'error',
                position: 'top-right'
            })
        }).always(function() {
            // ...
        });
	}
</script>
</head>
<body>

	<div id="root">
		<div>
			<%@ include file="../includes/header.jsp"%>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3"></div>
					<div
						class="col-md-6">
						<form role="form" action="${contextPath}/user/account" method="POST">
							<div class="row">
								<div class="col-md-12">
									<h2>Update Account Information</h2>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
									<hr class="colorgraph">
								</div>
							</div>
								
								
							<c:if test="${not empty errorMessge}">
								<div class="row">
									<div class="col-md-12">
										<div class="alert alert-danger" role="alert">${errorMessge}</div>
									</div>
								</div>
							</c:if>
								<div class="form-group row">
									<div class="col-md-2">
										<label for="name">Name: </label>
									</div>
									<div class="col-md-10">
										<input type="text" name="name" id="name"
											class="form-control input-lg" placeholder="Name" value="${user.name}">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-2">
										<label for="email">Email: </label>
									</div>
									<div class="col-md-10">
										<input type="text" name="email" id="email"
											class="form-control input-lg" placeholder="Email" value="${user.email}">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-2">
										<label for="username">Username: </label>
									</div>
									<div class="col-md-10">
										<input type="text" name="username" id="username"
											class="form-control input-lg" placeholder="Username" 
											value="${user.username}" readonly="true">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-2">
										<label for="password">Password: </label>
									</div>
									<div class="col-md-10">
										 <input
											type="password" id="password" name="password" class="form-control"
											placeholder="Password" required="">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-md-2">
										<label for="passwordConfirm">Re-Enter Password: </label>
									</div>
									<div class="col-md-10">
										 <input
											type="password" id="passwordConfirm" name="passwordConfirm" class="form-control"
											placeholder="Confirm password" required="">
									</div>
								</div>
								
								<div class="form-group row">
									<div class="col-md-4">
										<img src="${contextPath}/captcha_image" onclick="changeCaptcha('${contextPath}')" width="80" height="34" class="captcha-image" alt="Captcha Code"/>
										<button id="refresh" type="button" title="Refresh captcha" onclick="changeCaptcha('${contextPath}')">
					                        <i class="fas fa-sync-alt"></i>
					                    </button>
									</div>
									<div class="col-md-8">
										 <input
											type="text" id="kaptcha" name="kaptcha" class="form-control captcha-input"
											placeholder="Enter Captcha" required="" autocomplete="off">
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<hr class="colorgraph">
									</div>
								</div>
								<div class="row">
									<div class="col-xs-6 col-sm-6 col-md-6">
										<input type="button" onclick="updateAccount()" class="btn btn-lg btn-success btn-block"
											value="Update">
									</div>
									<div class="col-xs-6 col-sm-6 col-md-6">
										<input type="reset" class="btn btn-lg btn-primary btn-block"
											value="Reset">
									</div>
								</div>
								<input type="hidden" name="userId" id="userId" value="${user.userId}" />
								<input type="hidden" name="admin" id="admin" value="${user.admin}" />
						</form>
					</div>
					<div class="col-md-3"></div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>