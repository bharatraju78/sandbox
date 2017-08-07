<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><sitemesh:write property='title' /></title>
	<link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
	<script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/static/js/jquery-3.2.1.min.js' />"></script>
	<sitemesh:write property='head' />
		<style>
			/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
			.row.content {
				height: 550px
			}
			
			/* Set gray background color and 100% height */
			.sidenav {
				background-color: #f1f1f1;
				height: 100%;
			}
			
			/* On small screens, set height to 'auto' for the grid */
			@media screen and (max-width: 767px) {
				.row.content {
					height: auto;
				}
			}
		</style>
	</head>

<body>
	<nav class="navbar navbar-inverse visible-xs">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Logo</a>
			</div>
			<div class="col-sm-3">
				
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<strong>Welcome ${loggedinuser}</strong>
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Dashboard</a></li>
					<li><a href="#">Age</a></li>
					<li><a href="#">Gender</a></li>
					<li><a href="#">Geo</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav hidden-xs">
				<h2>Logo</h2>
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="#section1">Dashboard</a></li>
					<li><a href="#section2">Age</a></li>
					<li><a href="#section3">Gender</a></li>
					<li><a href="#section3">Geo</a></li>
				</ul>
				<br>
			</div>
			<br>
			<div class="col-sm-9">
				<sitemesh:write property='body' />
			</div>
		</div>
	</div>
</body>
</html>