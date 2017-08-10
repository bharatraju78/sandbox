<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title><sitemesh:write property='title' /></title>
		<link href="<c:url value='/static/css/bootstrap.min.css' />" rel="stylesheet"></link>
		<sitemesh:write property='head' />
	</head>
	<body>
		<div class="container">
			<!-- Static navbar -->
		      <nav class="navbar navbar-default">
		        <div class="container-fluid">
		          <div class="navbar-header">
		            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
		              <span class="sr-only">Toggle navigation</span>
		              <span class="icon-bar"></span>
		              <span class="icon-bar"></span>
		              <span class="icon-bar"></span>
		            </button>
		            <a class="navbar-brand" href="#">Project name</a>
		          </div>
		          <div id="navbar" class="navbar-collapse collapse">
		            <ul class="nav navbar-nav">
		              <li class="dropdown">
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Administration <span class="caret"></span></a>
		                <ul class="dropdown-menu">
		                  <li><a href="<c:url value='/list' />">Manage Users</a></li>
		                  <li><a href="<c:url value='/admin/listInstances' />">Manage Instances</a></li>
		                  <li><a href="#">Something else here</a></li>
		                  <li role="separator" class="divider"></li>
		                  <li class="dropdown-header">Nav header</li>
		                  <li><a href="#">Separated link</a></li>
		                  <li><a href="#">One more separated link</a></li>
		                </ul>
		              </li>
		              <li class="dropdown">
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Setup <span class="caret"></span></a>
		                <ul class="dropdown-menu">
		                  <li><a href="#">Manage Blocks </a></li>
		                  <li><a href="#">Manage Flats</a></li>
		                  <li><a href="#">Manager Parking</a></li>
		                  <li role="separator" class="divider"></li>
		                  <li class="dropdown-header">Nav header</li>
		                  <li><a href="#">Separated link</a></li>
		                  <li><a href="#">One more separated link</a></li>
		                </ul>
		              </li>
		              <li><a href="#">Wall</a></li>
		              <li class="dropdown">
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">User <span class="caret"></span></a>
		                <ul class="dropdown-menu">
		                  <li><a href="#">Manage Profile</a></li>
		                  <li><a href="#">View Payment Details</a></li>
		                  <li role="separator" class="divider"></li>
		                  <li class="dropdown-header">Others</li>
		                  <li><a href="#">Service Requests</a></li>
		                  <li><a href="#">Separated link</a></li>
		                  <li><a href="#">One more separated link</a></li>
		                </ul>
		              </li>
		            </ul>
		            <ul class="nav navbar-nav navbar-right">
		              <li><a href="#">Dear ${loggedinuser}</a></li>
		              <li><a href="<c:url value="/logout" />">Logout</a></li>
		            </ul>
		          </div><!--/.nav-collapse -->
		        </div><!--/.container-fluid -->
		      </nav>
		    
			<sitemesh:write property='body' />
			
		</div>
		<script type="text/javascript" src="<c:url value='/static/js/jquery-3.2.1.min.js' />"></script>
		<script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js' />"></script>
	</body>
</html>