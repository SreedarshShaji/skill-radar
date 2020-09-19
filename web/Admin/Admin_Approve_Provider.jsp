<%@page import="com.SkillRadar.Entites.ORM.ServiceCategoryORM"%>
<%@page import="com.SkillRadar.Entites.ServiceCategory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.SkillRadar.Entites.Provider"%>
<%@page import="com.SkillRadar.Entites.ORM.ProviderORM"%>

<%
	ProviderORM orm = new ProviderORM();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Bootstrap Example</title>
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


	<!-- Navbar start -->
	<nav class="navbar navbar-inverse stick-nav">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Skill Radar</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav" id="navbar">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#">Categories</a></li>
					<li><a href="#">Providers</a></li>
					<li><a href="#">Feedback</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
							Log Out</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Navbar end -->

	<!-- Contact Form Start -->

	<div class="container">
		<div class="row">
			<div class="col-md-3 section-hr-container">
				<hr class="section-hr">
			</div>
			<div class="col-md-6 " align="center">
				<h2 class="section-heading">All Service Providers</h2>
			</div>
			<div class="col-md-3 section-hr-container">
				<hr class="section-hr">
			</div>
		</div>
	</div>
	<br>
	<!--Contact Form  Ends -->

	<!-- Table -->

	<div class="container-fluid slider-div">
		<div class="row">
			<div class="col-md-2 col-xs-11"></div>
			<div class="col-md-8 col-xs-1">
				<div class="panel panel-default">
					<div class="panel-body">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Name</th>
									<th scope="col">Email</th>
									<th scope="col">Location</th>
								</tr>
							</thead>
							<tbody>
								<%
									ArrayList<Provider> providerHolder = orm.getProvider();

									for (Provider temp : providerHolder) {
								%>
								<tr>
									<th scope="row"><%=temp.getId()%></th>
									<td><%=temp.getName()%></td>
									<td><%=temp.getEmail()%></td>
                                                                        <td><a target="_blank" href="https://www.google.com/maps/place/8%C2%B054'56.3%22N+76%C2%B037'31.2%22E/@<%=temp.getLocation()%>,15z"><%=temp.getLocation()%></a></td>
                                                                        <!--td><a href="Admin_Approve_Provider.jsp?approve=<%//temp.getId()%>">Approve</a></td-->
                                                                        <!--td><a href="Admin_Approve_Provider.jsp?suspend=<%//temp.getId()%>">suspend</a></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-2 col-xs-11"></div>
		</div>
	</div>
	<!-- Table End -->


</body>
</html>

<%
    
    Provider p;
if (request.getParameter("approve") != null) {
    p=orm.getProvider(Integer.parseInt(request.getParameter("approve")));
    if(p.isAvailable()&&p.getStatus().equals("Active"))
    {
    %><script>alert('The user is alread approved and active');</script><%
    }
    else{
    orm.approveProvider(p);
    %><script>alert('The user is approved');</script><%
    }
}

if (request.getParameter("suspend") != null) {
    
 %><script>alert('This will be suspending soon');</script><%   
}

%>