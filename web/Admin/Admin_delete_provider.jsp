<%@page import="com.SkillRadar.Entites.Provider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page  import="com.SkillRadar.Entites.ORM.DBconnect;"%>
<%

    String id = request.getParameter("id");

    DBconnect connector = new DBconnect();
    Connection con = connector.getConnection();
    PreparedStatement psmt = con.prepareStatement("DELETE FROM `sr_service_man` where `ser_id`='" + id + "'");

    int i = psmt.executeUpdate();
%>
<script>
    window.location = "Admin_Approve_Provider.jsp?type=success&message=<strong>Success: </strong> The service provider is deleted";
</script>
<%

%>