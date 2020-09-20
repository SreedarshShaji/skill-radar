<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.SkillRadar.Entites.Provider"%>
<%@page import="com.SkillRadar.Entites.ServiceCategory"%>
<%@page import="com.SkillRadar.Entites.ORM.ServiceCategoryORM"%>
<%@page import="com.SkillRadar.Utils.GeoCoordinateDistanceCalculator"%>

<%
    Connection con = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skill_radar", "root", "");
    } catch (Exception ex) {
        System.out.println(ex.getMessage());
    }
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
                                    <li class="active"><a href="Admin_Add_Categories.jsp">Home</a></li>
                                    <li><a href="Admin_Approve_Provider.jsp">Providers</a></li>
                                    <li><a href="Admin_see_bookings.jsp">Booking</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="../"><span class="glyphicon glyphicon-log-in"></span>
							Log Out</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Navbar end -->

<% int p = Integer.parseInt(session.getAttribute("provider").toString()); %>
    <div class="container">
		<div class="row">
			<div class="col-md-3 section-hr-container">
				<hr class="section-hr">
			</div>
			<div class="col-md-6 " align="center">
				<h2 class="section-heading">Add Bookings</h2>
			</div>
			<div class="col-md-3 section-hr-container">
				<hr class="section-hr">
			</div>
		</div>
	</div>
	<br>

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
                                <th scope="col">Booking person</th>
                                <th scope="col">Location</th>
                                <th scope="col">Time of booking</th>
                                <th scope="col">Distance</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%

                                PreparedStatement p1 = con.prepareStatement("SELECT * FROM `sr_booking` WHERE `book_provider`='" + p + "'");
                                ResultSet rs = p1.executeQuery();
                                int rc = 0;
                                while (rs.next()) {

                                    String bookingPerson = "";
                                    String currentLocation = "";
                                    PreparedStatement p2 = con.prepareStatement("SELECT * FROM `sr_user` WHERE `us_id`='" + rs.getString("book_customer") + "'");
                                    ResultSet rs2 = p2.executeQuery();
                                    while (rs2.next()) {
                                        bookingPerson = rs2.getString("us_name");
                                    }

                                    PreparedStatement p3 = con.prepareStatement("SELECT * FROM `sr_service_man` WHERE `ser_id`='" + p + "'");
                                    ResultSet rs3 = p3.executeQuery();
                                    while (rs3.next()) {
                                        currentLocation = rs3.getString("ser_location");
                                    }
                            %>
                            <tr>
                                <th scope="row"><%=++rc%></th>
                                <td><%=bookingPerson%></td>
                                <td><%=rs.getString("user_location")%></td>
                                <td><%=rs.getString("book_date_time")%></td>
                                <td><%
                                    double Distance = new GeoCoordinateDistanceCalculator().distanceCalculator(currentLocation, rs.getString("user_location"));
                                    if (Distance < 1000) {
                                        out.print(Math.round(Distance) + " <span style='color:green'>Mts</span>");
                                    } else if (Distance < 5000) {
                                        out.print(Math.round(Distance / 1000) + " <span style='color:green'>KMS</span>");
                                    } else if (Distance < 10000) {
                                        out.print(Math.round(Distance / 1000) + " <span style='color:orange'>KMS</span>");
                                    } else {
                                        out.print(Math.round(Distance / 1000) + " <span style='color:red'>KMS</span>");
                                    }
                                    %></td>
                                <td>
                                    <%=rs.getString("book_status")%>
                                </td>
                               
                            </tr>
                            <%                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-md-2 col-xs-11"></div>
    </div>
</div>

<!-- Table end -->
<%@include  file="includes/footer.jsp"%>
<%
    if (request.getParameter("insert") != null) {
        PreparedStatement psmt = con.prepareStatement("INSERT INTO `sr_services_provided` (`sp_category`,`sp_provider`, `sp_service`) VALUES ('" + request.getParameter("cat") + "','" + p + "','" + request.getParameter("service") + "')");
        psmt.executeUpdate();
%>
<script>
    alert("service added successfully");
    window.location = "SelectCategory.jsp";
</script>
<%
    }
    if (request.getParameter("delete") != null) {
        PreparedStatement psmt = con.prepareStatement("DELETE FROM `sr_services_provided` WHERE `sp_id`='" + request.getParameter("delete") + "'");
        psmt.executeUpdate();
%>
<script>
    alert("service deleted successfully");
    window.location = "SelectCategory.jsp";
</script>
<%
    }
    if (request.getParameter("") != null) {

    }

%>

<!--Rejected booking comment-->
<script>
    
    function setTheBookingId(id)
    {
        document.getElementById("booking_id").value=id;
    }
    
    </script>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <center><h3 class="modal-title" id="exampleModalLabel">Rejected Booking</h3></center>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="reject_booking.jsp">
                    <input type="text" name="booking_id" id="booking_id">
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Reason to reject</label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="message"></textarea>
                    </div>
                    <div class="form-group">
                    <button type="submit" class="btn btn-danger">Reject booking</button>
                    </div>
                </form>
            </div>    
        </div>
    </div>
</div>