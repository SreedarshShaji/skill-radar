
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="com.SkillRadar.Entites.ORM.ServiceCategoryORM" %>
<%@page import="com.SkillRadar.Entites.ServiceCategory" %>
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
			<div class="col-md-3 col-xs-1"></div>
			<div class="col-md-6 col-xs-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2 align="center">Signup as Customer</h2>
					</div>
					<div class="panel-body">
						<form action="signup-customer_ser.jsp" method="post">
							<div class="form-group">
								<label for="name">Name:</label> <input type="text"
									class="form-control" required id="name" name="name">
							</div>
							<div class="form-group">
								<label for="email">Email address:</label> <input type="email"
                                                                         class="form-control" id="email" name="email">
							</div>
							<div class="form-group">
								<label for="pwd">Password:</label> <input type="password"
                                                                                                          class="form-control" id="pwd" name="password">
							</div>
							<div class="form-group">
								<label for="pwd">Confirm Password:</label> <input type="password"
									class="form-control" id="cpwd">
							</div>
							<div class="form-group">
								<label for="pwd">Location:</label> <input type="text"
									class="form-control" id="location" name="location">
									<img src="" id="locationMap" >
							</div>
							<input type="submit" class="btn btn-primary" style="width: 100%;"
								value="Submit">
						</form>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-xs-11"></div>
		</div>
	</div>
	<!-- Script starts -->
	<script type="text/javascript">
	$(document).ready(function() {
		
		if (navigator.geolocation) { navigator.geolocation.getCurrentPosition(showPosition); } 
			
		$("#name").focusout(
				function() {
					var input = $("#name").val();
					var expressionName = /[a-z A-Z]/g;
					var matching = input
							.match(expressionName);

					if ((matching==null)||(input.length != matching.length)) {
						var modelTitle = "Name Mismatch";
						var modelMessage = "Please make sure that you entered a valid name. "+
						"\n Name should contain only characters and spaces."+
						"\n Name should contain atleast 3 cahracters and a maximim of 15 characters.";
						showError(modelTitle,modelMessage);
					}
				});
		
		$("#email").focusout(
				function() {
					var input = $("#email").val();

					if (input.indexOf('@')<0 || input.indexOf('.')<0 || input.indexOf('.')<input.indexOf('@')||input.indexOf('@')<2||input.indexOf('.')<5||input.length-input.indexOf('.')<3) {
						var modelTitle = "Mail Id Mismatch";
						var modelMessage = "";

						if(input.indexOf('@')<0){modelMessage="Mail id should contain a '@' symbol.\n";}
						else if(input.indexOf('.')<0){modelMessage+="Mail id should contain a '.' symbol.\n";}
						else if(input.indexOf('@')<2){modelMessage+="Mail id must be atleast 2 characters long (before the @ symbol).\n";}
						else if(input.indexOf('.')<5){modelMessage+="Domain name must be atleast 2 characters long (after the @ symbol and before .).\n";}
						else if(input.length-input.indexOf('.')<3){modelMessage+="Possible error after the . sign.";}
						
						showError(modelTitle,modelMessage);
					}
				});

		$("#cpwd").focusout(
						function() {
							var input = $("#pwd").val();
							var toCompare= $("#cpwd").val();
							
							if (input!==toCompare) {
								var modelTitle = "Password Mismatch";
								modelMessage+="Password and confirm password must be equal.\n";
								showError(modelTitle,modelMessage);
							}
						});
	});
	
	
	
	
	
	
		function showPosition(position) {
			var location = position.coords.latitude + ","
					+ position.coords.longitude;
			$("#location").val(location);
		}
		function showError(title, message) {
			$("#ModelTitle").text(title);
			$("#ModelMessage").text(message);
			$("#MessageModel").modal();
		}
	</script>
	<!-- Script ends -->
	<div class="modal" tabindex="-1" role="dialog" id="MessageModel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title text-warning" id="ModelTitle" align="center">Modal
						title</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<span id="ModelMessage" class="text-danger" style="white-space: pre;">Modal body text goes
						here.</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>