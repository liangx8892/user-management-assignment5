<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>User Management - Login</title>
<%@ include file="includes/static.jsp"%>
<script type="text/javascript">
  function changeCaptcha(contextPath){
	  $(".captcha-image").attr("src", contextPath + "/captcha_image?ts=" + Date.now());
  }
</script>
</head>
<body>
	<div id="root">
		<div>
			<%@ include file="includes/header.jsp"%>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3"></div>
					<div
						class="col-md-6">
						<form role="form" action="${contextPath}/login" method="POST">
							<div class="row">
								<div class="col-md-12">
									<h2>Please Sign In</h2>
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
										<label for="username">Username: </label>
									</div>
									<div class="col-md-10">
										<input type="text" name="username" id="username"
											class="form-control input-lg" placeholder="Username">
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
										<input type="submit" class="btn btn-lg btn-success btn-block"
											value="Sign In">
									</div>
									<div class="col-xs-6 col-sm-6 col-md-6">
										<input type="reset" class="btn btn-lg btn-primary btn-block"
											value="Reset">
									</div>
								</div>
						</form>
					</div>
					<div class="col-md-3"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>