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

<%@include  file="includes/header.jsp"%>
<% int customer = Integer.parseInt(session.getAttribute("customer").toString()); %>
<div class="container-fluid slider-div">
    <div class="row">
        <div class="col-md-2 col-xs-1"></div>
        <div class="col-md-8 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2 align="center">All Bookings</h2>
                </div>

            </div>
        </div>
    </div>
</div>

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
                                <th scope="col">Service person</th>
                                <th scope="col">Location</th>
                                <th scope="col">Time of booking</th>
                                <th scope="col">Distance</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%

                                PreparedStatement p1 = con.prepareStatement("SELECT * FROM `sr_booking` WHERE `book_customer`='" + customer + "'");
                                ResultSet rs = p1.executeQuery();
                                int rc = 0;
                                while (rs.next()) {

                                    String bookingPerson = "";
                                    String servicePerson = "";
                                    String currentLocation = "";
                                    PreparedStatement p2 = con.prepareStatement("SELECT * FROM `sr_user` WHERE `us_id`='" + rs.getString("book_customer") + "'");
                                    ResultSet rs2 = p2.executeQuery();
                                    while (rs2.next()) {
                                        bookingPerson = rs2.getString("us_name");
                                    }

                                    PreparedStatement p3 = con.prepareStatement("SELECT * FROM `sr_service_man` WHERE `ser_id`='" + rs.getString("book_provider") + "'");
                                    ResultSet rs3 = p3.executeQuery();
                                    while (rs3.next()) {
                                        servicePerson = rs3.getString("ser_name");
                                        currentLocation = rs3.getString("ser_location");
                                    }
                            %>
                            <tr>
                                <th scope="row"><%=++rc%></th>
                                <td><%=bookingPerson%></td>
                                <td><%=servicePerson %></td>
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
                                <td>
                                    <%
  if (rs.getString("book_status").equals("In Progress")) {
                                    %>
                                <td><a href="https://www.google.com/maps/place/<%=currentLocation %>/@<%=currentLocation %>,16z" target="_blank"><button class="btn btn-info">View on map</button></a><hr>
                                    
                                    <%
                                        }

                                    %>
                                </td>
                                <% if(rs.getString("book_status").equals("Completed") && (rs.getInt("book_rating")>0 || !rs.getString("user_comment").equals("-")))
                                {
                                %>
                                <td><strong>Rating : </strong><%=rs.getString("book_rating")%></td>
                                <td><strong>Review : </strong><%=rs.getString("user_comment")%></td>
                                <%
                                } 
                                %>
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