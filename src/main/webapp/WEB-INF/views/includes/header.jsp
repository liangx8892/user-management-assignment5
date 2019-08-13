<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<nav class="navbar">
	<a class="navbar-brand"><i class="fas fa-users fa-2x"></i><span>User
			Management </span></a>
	<ul class="menu navbar-nav bd-navbar-nav flex-row">
		<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
			<li class="nav-item"><a
				class="btn btn-bd-download d-none d-lg-inline-block mb-3 mb-md-0 ml-md-3"
				href="${contextPath}/user/tutorials">Tutorials</a></li>
		</sec:authorize>

		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<li class="nav-item"><a
				class="nav-link"
				href="${contextPath}/admin/admin">Admin</a></li>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<li class="nav-item"><a
				class="nav-link"
				href="${contextPath}/admin/userlist">Users</a></li>
		</sec:authorize>

		<sec:authorize access="hasRole('ROLE_ANONYMOUS')">
			<li class="nav-item"><a
				class="btn btn-bd-download d-none d-lg-inline-block mb-3 mb-md-0 ml-md-3"
				href="${contextPath}/login">Login</a></li>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_ANONYMOUS')">
			<li class="nav-item"><a
				class="btn btn-bd-download d-none d-lg-inline-block mb-3 mb-md-0 ml-md-3"
				href="${contextPath}/register">Register</a></li>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_USER')">
			<li class="nav-item" style="width:200px"><a
				class="btn btn-bd-download d-none d-lg-inline-block mb-3 mb-md-0 ml-md-3"
				href="${contextPath}/user/account">Account Update</a></li>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_USER')">
			<li class="nav-item"><a
				class="btn btn-bd-download d-none d-lg-inline-block mb-3 mb-md-0 ml-md-3"
				href="${contextPath}/logout">Logout</a></li>
		</sec:authorize>
	</ul>
</nav>
<script type="text/javascript">
	$(function($) {
		var currentPage = location.pathname.match(/(.*?)([^\/]+)$/).pop();
		$('.menu li').each(function(idx, li) {
			var anchor = $('a', li)[0];
			if (anchor && anchor.href && anchor.href.endsWith(currentPage)) {
				$(anchor).addClass('active');
			}
		});
	});
</script>