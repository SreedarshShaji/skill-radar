<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.SkillRadar.Entites.Customer"%>
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
        <div class="col-md-3 col-xs-1"></div>
        <div class="col-md-6 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2 align="center">Add Services provided</h2>
                </div>
                <div class="panel-body">
                    <form action="" method="post">
                        <%
                            ArrayList<ServiceCategory> cats = new ServiceCategoryORM().getServiceCategories();
                        %>
                        <div class="form-group">
                            <label for="email">Select Category:</label> 
                            <select class="form-control" id="email" name="cat">
                                <option value="none">Select</option>
                                <%
                                    for (ServiceCategory cat : cats) {
                                        out.print("<option value='" + cat.getId() + "'>");
                                        out.print(cat.getName());
                                        out.print("</option>");
                                    }
                                %>
                            </select>
                            <input type="text" class="form-control" id="loc" name="loc">
                        </div>


                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

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
                                <th scope="col">Service Person</th>
                                <th scope="col">Location</th>
                                <th scope="col">Distance</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                if (request.getParameter("serviceId") != null) {
                                    PreparedStatement p1 = con.prepareStatement("SELECT `sr_services_provided`.* FROM `sr_services_provided` WHERE sp_category='" + request.getParameter("serviceId") + "'");
                                    ResultSet rs = p1.executeQuery();
                                    int rc = 0;
                                    while (rs.next()) {

                                        String providerName = "";
                                        String ProviderLocation = "";
                                        double Distance = 0;

// Reading the provider Details
                                        PreparedStatement p2 = con.prepareStatement("SELECT * FROM `sr_service_man` WHERE  `sr_service_man`.`ser_id`='" + rs.getString("sp_provider") + "'");
                                        ResultSet rs1 = p2.executeQuery();
                                        while (rs1.next()) {
                                            providerName = rs1.getString("ser_name");
                                            ProviderLocation = rs1.getString("ser_location");
                                        }
                                        Distance = new GeoCoordinateDistanceCalculator().distanceCalculator(request.getParameter("loc"), ProviderLocation);

                            %>
                            <tr>
                                <td><%=(++rc)%></td>
                                <td><%=providerName%></td>
                                <td><a href="https://www.google.com/maps/place/<%=ProviderLocation%>/@<%=ProviderLocation%>,16z" target="_blank">View on map</a></td>
                                <td><%
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
                                    <button type="button" class="btn btn-primary">Make a booking</button>
                                </td>
                            </tr>
                            <%
                                    }
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

<!-- Table end -->
<%@include  file="includes/footer.jsp"%>
<script type="">
    const fetchdata = async()=>{
        
        const resp = await fetch("https://api.github.com");
        const data = await resp.json();
        console.log(data);
        
    };
    fetchdata();
    $(document).ready(function(){
        
        if (navigator.geolocation) { navigator.geolocation.getCurrentPosition(showPosition); } 
        
    function showPosition(position) {
                        var location = position.coords.latitude + ","
                                        + position.coords.longitude;
                        $("#loc").val(location);
                }       
    });
</script>