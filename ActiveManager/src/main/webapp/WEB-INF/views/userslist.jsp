<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="well">
	<h4>Dashboard</h4>
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">
			<span class="lead">List of Users </span>
		</div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Email</th>
					<th>SSO ID</th>
					<sec:authorize access="hasRole('ADMINISTRATOR') or hasRole('MANAGER')">
						<th width="100" colspan="2">Action</th>
					</sec:authorize>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${users}" var="user">
					<tr>
						<td>${user.firstName}</td>
						<td>${user.lastName}</td>
						<td>${user.email}</td>
						<td>${user.ssoId}</td>
						<sec:authorize
							access="hasRole('ADMINISTRATOR') or hasRole('MANAGER')">
							<td><a href="<c:url value='/edit-user-${user.ssoId}' />" class="btn btn-success">Edit</a></td>
							<td><a href="<c:url value='/delete-user-${user.ssoId}' />" class="btn btn-link">Delete</a></td>
						</sec:authorize>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<sec:authorize access="hasRole('ADMINISTRATOR') or hasRole('MANAGER')">
			<a href="<c:url value='/newuser' />" class="btn btn-primary" role="button">Add New User</a>
		</sec:authorize>
</div>