<%@page import="com.SkillRadar.Entites.Provider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page  import="com.SkillRadar.Entites.ORM.DBconnect;"%>
<%

    String id = request.getParameter("delId");

    DBconnect connector = new DBconnect();
    Connection con = connector.getConnection();
    PreparedStatement psmt = con.prepareStatement("DELETE FROM `sr_service_cat` where `Cat_id`='" + id + "'");

    int i = psmt.executeUpdate();
%>
<script>
    window.location = "Admin_Add_Categories.jsp?type=success&message=<strong>Success: </strong> The category is deleted";
</script>
<%

%>