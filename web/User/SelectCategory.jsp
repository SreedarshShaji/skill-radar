<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.SkillRadar.Entites.Customer"%>
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
<% Customer p=(Customer)session.getAttribute("provider"); %>
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
                                        <option value="none">Select</option>
                                        <%
                                        for (ServiceCategory cat:cats) {
                                                out.print("<option value='"+cat.getId()+"'>");
                                                out.print(cat.getName());
                                                out.print("</option>");
                                            }
                                        %>
                                    </select>
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
								if(request.getParameter("serviceId")!=null){
                                                                   PreparedStatement p1=con.prepareStatement("SELECT `sr_services_provided`.*,`sr_service_cat`.Cat_name FROM `sr_services_provided` INNER JOIN `sr_service_cat` ON `sr_services_provided`.`sp_category`=`sr_service_cat`.`Cat_id` WHERE sp_category='"+request.getParameter("serviceId")+"'");
                                                                   // rs=p1.executeQuery();
                                                                   //int rc=0;
									//while(rs.next()) {
								%>
								<tr>
									
                                                                        </tr>
								<%
									//}
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
</script>