<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="well">
	<div class="alert alert-success lead">
    	${success}
	</div>
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">
			<span class="lead">Instances </span>
		</div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Instance ID</th>
					<th>Instance Name</th>
					<sec:authorize access="hasRole('ADMINISTRATOR') or hasRole('MANAGER')">
						<th width="100" colspan="2">Action</th>
					</sec:authorize>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${instances}" var="instance">
					<tr>
						<td>${instance.id}</td>
						<td>${instance.instanceName}</td>
						<sec:authorize access="hasRole('ADMINISTRATOR') or hasRole('MANAGER')">
							<td><a href="<c:url value='/edit-instance-${user.ssoId}' />" class="btn btn-success">Edit</a></td>
							<td><a href="<c:url value='/delete-instance-${user.ssoId}' />" class="btn btn-link">Delete</a></td>
						</sec:authorize>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<sec:authorize access="hasRole('ADMINISTRATOR') or hasRole('MANAGER')">
		<a href="<c:url value='/admin/newinstance' />" class="btn btn-primary" role="button">Add Instance</a>
	</sec:authorize>
</div>