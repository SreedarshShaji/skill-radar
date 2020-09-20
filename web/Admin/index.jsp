
<%@page import="com.SkillRadar.Entites.Customer"%>
<%@page import="com.SkillRadar.Entites.Provider"%>
<%@page import="com.SkillRadar.Entites.ORM.CustomerORM"%>
<%@page import="com.SkillRadar.Entites.ORM.ProviderORM"%>
<%@page import="com.SkillRadar.Entites.ORM.AdminORM"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Skill Radar</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap connections -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<!-- Connection to custom css page -->
<link rel="stylesheet" href="style/style.css">

<!-- Sticky navbar -->
<script type="text/javascript" src="script/sticky-nav-bar.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3 col-xs-10">
				<img src="images/logo.png" class="img-fluid" height="100px" />
			</div>
			<div class="col-md-9 col-xs-1"></div>
		</div>
	</div>



	<div class="container-fluid slider-div">
		<div class="row">
			<div class="col-md-3 col-xs-11"></div>
			<div class="col-md-6 col-xs-1">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 align="center">Login</h2>
					</div>
					<div class="panel-body">
						<form action="">
							<div class="form-group">
								<label for="email">Username:</label> <input type="text"
									class="form-control" id="email" name="email">
							</div>
							<div class="form-group">
								<label for="pwd">Password:</label> <input type="password" name="password"
									class="form-control" id="pwd">
							</div>
							
							<button type="submit" name="submit" value="submit" class="btn btn-primary"
								style="width: 100%;">Submit</button>
						</form>
					</div>

				</div>
			</div>

			<div class="col-md-3 col-xs-11"></div>
		</div>
	</div>
</body>
</html>
<%
	if (request.getParameter("submit") != null) {

		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		
		
		if (email.equals("admin")&&password.equals("admin")) {
			response.sendRedirect("Admin_Add_Categories.jsp");
		} 
		else
		{
			out.print("<div style='width:80%;background-color:#ffd5c1;margin-left:10%;' >");
			out.print("<h4 align='center'><br><Strong>Please enter valid details</Strong><br><hr></h4>"
				+"<br> <h5 align='center'>The details must be entered carefully as the service is case sensitive and takes every details seriously.</h5><br>");
			out.print("</div>");
		}
		

	}
%>