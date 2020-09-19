<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.SkillRadar.Entites.Provider"%>
<%@page import="com.SkillRadar.Entites.ServiceCategory"%>
<%@page import="com.SkillRadar.Entites.ORM.ServiceCategoryORM"%>

<%
Connection con=null;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/skill_radar","root","");
    }
    catch(Exception ex){
    System.out.println(ex.getMessage());
    }
%>

<%@include  file="includes/header.jsp"%>
<% Provider p=(Provider)session.getAttribute("provider"); %>
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
                                    ArrayList<ServiceCategory> cats=new ServiceCategoryORM().getServiceCategories();
                                %>
                                <div class="form-group">
                                    <label for="email">Select Category:</label> 
                                    <select class="form-control" id="email" name="cat">
                                        <%
                                        for (ServiceCategory cat:cats) {
                                                out.print("<option value='"+cat.getId()+"'>");
                                                out.print(cat.getName());
                                                out.print("</option>");
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="pwd">Service Provided:</label> <input type="text"
                                                                              class="form-control" id="pwd" name="service">
                                </div>
                                <input type="submit" class="btn btn-primary" style="width: 100%;" name="insert" value="Add Service"
                                       value="Submit">
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
									<th scope="col">Category Name</th>
									<th scope="col">Description</th>
								</tr>
							</thead>
							<tbody>
								<%
								
                                                                   PreparedStatement p1=con.prepareStatement("SELECT `sr_services_provided`.*,`sr_service_cat`.Cat_name FROM `sr_services_provided` INNER JOIN `sr_service_cat` ON `sr_services_provided`.`sp_category`=`sr_service_cat`.`Cat_id` WHERE sp_provider='"+p.getId()+"'");
                                                                   ResultSet rs=p1.executeQuery();
                                                                   int rc=0;
									while(rs.next()) {
								%>
								<tr>
									<th scope="row"><%=++rc %></th>
                                                                        <td><%=rs.getString("Cat_name") %></td>
                                                                        <td><%=rs.getString("sp_service") %></td>
                                                                        <td><a href="SelectCategory.jsp?delete=<%=rs.getString("sp_id") %>">Delete</a></td>
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
                                    
                                    <!-- Table end -->
<%@include  file="includes/footer.jsp"%>
<%
    
    
if(request.getParameter("insert")!=null)
{
    PreparedStatement psmt=con.prepareStatement("INSERT INTO `sr_services_provided` (`sp_category`,`sp_provider`, `sp_service`) VALUES ('"+request.getParameter("cat")+"','"+p.getId()+"','"+request.getParameter("service")+"')");
    psmt.executeUpdate();
    %>
    <script>
        alert("service added successfully");
        window.location="SelectCategory.jsp";
    </script>
    <%
}
if(request.getParameter("delete")!=null)
{
    PreparedStatement psmt=con.prepareStatement("DELETE FROM `sr_services_provided` WHERE `sp_id`='"+request.getParameter("delete")+"'");
    psmt.executeUpdate();
    %>
    <script>
        alert("service deleted successfully");
        window.location="SelectCategory.jsp";
    </script>
    <%
}
if(request.getParameter("")!=null)
{
    
}

%>