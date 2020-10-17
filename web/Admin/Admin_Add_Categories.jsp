
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.SkillRadar.Entites.ServiceCategory"%>
<%@page import="com.SkillRadar.Entites.ORM.ServiceCategoryORM"%>

<%
	ServiceCategoryORM orm = new ServiceCategoryORM();
%>
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
                                    <li class="active"><a href="Admin_Add_Categories.jsp">Home</a></li>
                                    <li><a href="Admin_Approve_Provider.jsp">Providers</a></li>
<!--                                    <li><a href="Admin_see_bookings.jsp">Booking</a></li>-->
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="../"><span class="glyphicon glyphicon-log-in"></span>
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
				<h2 class="section-heading">Add Categories</h2>
			</div>
			<div class="col-md-3 section-hr-container">
				<hr class="section-hr">
			</div>
		</div>
	</div>
	<br>
	<!--Contact Form  Ends -->

	<!-- Form -->

	<div class="container-fluid slider-div">
		<%
			if (request.getParameter("message") != null) {
		%>
		<div class="alert alert-primary alert-dismissible fade show"
			role="alert">
			This is a sample message
			<%=(request.getParameter("message"))%>
			<button type="button" class="close" data-dismiss="alert"
				arial-label="Close"></button>
		</div>
		<%
			}
		%>
		<div class="row">
			<div class="col-md-3 col-xs-11"></div>
			<div class="col-md-6 col-xs-1">
				<div class="panel panel-default">

					<div class="panel-body">
						<%
							boolean update = false;
							ServiceCategory updateEntity = null;
							if (request.getParameter("id") != null) {
								update = true;
								int updateId = Integer.parseInt(request.getParameter("id"));
								updateEntity = orm.getServiceCategory(updateId);
							}
						%>
						<form action="">
							<div class="form-group">
								<%
									if (request.getParameter("id") != null) {
								%>
								<input type="hidden" name="id"
									<%="value='" + updateEntity.getId() + "'"%>>
								<%
									}
								%>
								<label for="category">Category Name:</label> <input type="text"
									id="name" name="category"
									<%if (request.getParameter("id") != null) {
				out.print(" class='form-control'  value='" + updateEntity.getName() + "'");
			} else {
				out.print("class='form-control' ");
			}%>
									required="required">
							</div>
							<div class="form-group">
								<label for="pwd">Category Description:</label> <input
									type="text"
									<%if (request.getParameter("id") != null) {
				out.print(" class='form-control'  value='" + updateEntity.getDescription() + "'");
			} else {
				out.print("class='form-control' ");
			}%>
									id="description" name="description" required="required">
							</div>
							<div class="form-group">
                                                            <img alt="" id="imageDisplay" height="300px"
									src="<%if (request.getParameter("id") != null) {
				out.print(" class='form-control'  value='" + updateEntity.getPhoto() + "'");
			}%>"><br>
								<label for="pwd">Image Url:</label> <input type="url"
									<%if (request.getParameter("id") != null) {
				out.print(" class='form-control'  value='" + updateEntity.getPhoto() + "'");
			} else {
				out.print("class='form-control' ");
			}%>
									id="url" name="url" required="required"
									oninput="displayImage(this.value)">
							</div>


							<%
								if (update) {
									out.print("<button type='submit' value='submit'	class='btn btn-primary' style='width: 100%;'");
									out.print(" name='update'>");
									out.print("Update");
									out.print("</button>");
								} else {
									out.print("<button type='submit' value='submit'	class='btn btn-primary' style='width: 100%;'");
									out.print(" name='submit'>");
									out.print("Submit");
									out.print("</button>");
								}
							%>

						</form>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-xs-11"></div>
		</div>
	</div>
	<!-- Form End -->

	<!-- Contact Form Start -->

	<div class="container">
		<div class="row">
			<div class="col-md-3 section-hr-container">
				<hr class="section-hr">
			</div>
			<div class="col-md-6 " align="center">
				<h2 class="section-heading">All Added Categories</h2>
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
			<div class="col-md-3 col-xs-11"></div>
			<div class="col-md-6 col-xs-1">
				<div class="panel panel-default">
					<div class="panel-body">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Category Name</th>
									<th scope="col">Description</th>
									<th scope="col">Image</th>
								</tr>
							</thead>
							<tbody>
								<%
									ArrayList<ServiceCategory> serviceCategoryHolder = orm.getServiceCategories();

									for (ServiceCategory temp : serviceCategoryHolder) {
								%>
								<tr>
									<th scope="row"><%=temp.getId()%></th>
									<td><%=temp.getName()%></td>
									<td><%=temp.getDescription()%></td>
									<td><img width="150px" src="<%=temp.getPhoto()%>"></td>
									<td><a href="?<%="id=" + temp.getId()%>">Update</a></td>
									<td><span onclick="deleteChoice(<%=temp.getId() %>)">Delete</span></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-xs-11"></div>
		</div>
	</div>
	<!-- Table End -->


</body>
</html>

<%
	if (request.getParameter("submit") != null) {

		String category = request.getParameter("category");
		String description = request.getParameter("description");
		String url = request.getParameter("url");

		ServiceCategory category2 = new ServiceCategory(0, category, description, url);

		int result = orm.insertServiceCategory(category2);
		
%>
<script>
	alert("Category added successfully...");
        window.location="Admin_Add_Categories.jsp";
</script>
<%
	
	}
%>

<%
	if (request.getParameter("update") != null) {
		int id = Integer.parseInt(request.getParameter("id"));
		String category = request.getParameter("category");
		String description = request.getParameter("description");
		String url = request.getParameter("url");

		ServiceCategory category2 = new ServiceCategory(id, category, description, url);

		int result = orm.updateServiceCategory(category2);
		
                %>
<script>
	alert("Category updated successfully...");
        window.location="Admin_Add_Categories.jsp";
</script>
<%
	}
%>

<%
	if (request.getParameter("delId") != null) {
		int id = Integer.parseInt(request.getParameter("delId"));

		ServiceCategory category2 = orm.getServiceCategory(id);

		int result = orm.deleteServiceCategory(category2);
		%>
<script>
	alert("Category deleted successfully...");
        window.location="Admin_Add_Categories.jsp";
</script>
<%
	}
%>
<!-- Java script dedicated part -->
<script>
	function displayImage(url) {
		document.getElementById("imageDisplay").src = url;
		document.getElementById("imageDisplay").alt = "Loading " + url;
	}

	function deleteChoice(id) {
		var res=confirm("Do you want to delete?");
		if(res)
			{
			window.location="Admin_Add_Categories.jsp?delId="+id;
			}
	}
</script>
