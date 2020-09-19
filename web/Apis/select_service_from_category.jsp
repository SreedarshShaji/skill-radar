<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.SkillRadar.Entites.Customer"%>
<%@page import="com.SkillRadar.Entites.ServiceCategory"%>
<%@page import="com.SkillRadar.Entites.ServiceCategory"%>
<%@page import="com.SkillRadar.Entites.ORM.ServiceCategoryORM"%>

<%

String category = request.getParameter("id");

try
{
    Class.forName("com.mysql.jdbc.Driver");
    
    String url = "jdbc:mysql://localhost:3306/skill_radar";
    String user = "root";
    String password = "";
    
    Connection con = DriverManager.getConnection(url, user, password);
    
    String sql = "SELECT `sr_services_provided`.*,`sr_service_man`.*,`sr_service_cat`.* "
            + "FROM `sr_services_provided` "
            + "INNER JOIN `sr_service_man` ON `sr_services_provided`.`sp_provider` = `sr_service_man`.`ser_id` "
            + "INNER JOIN `sr_service_cat` ON `sr_services_provided`.`sp_category` = `sr_service_cat`.`Cat_id`"
            + "WHERE `sp_category`='"+category+"'";
    
    PreparedStatement psmt = con.prepareStatement(sql);
    ResultSet rs = psmt.executeQuery();
    
    //Creating the JSON
    
    out.print("[");
    int i= 0;
    while(rs.next())
    {
        if(i!=0){ out.print(",");i++; }
        
        out.print("{");
        out.print("}");
    }
    out.print("}");
}
catch(Exception ex)
{
    
}

%>

