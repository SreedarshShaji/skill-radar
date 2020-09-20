<%-- 
    Document   : accept_booking
    Created on : Sep 20, 2020, 4:41:12 AM
    Author     : Sreedarsh S
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page  import="com.SkillRadar.Entites.ORM.DBconnect;"%>
<%
    DBconnect connector = new DBconnect();
    Connection con = connector.getConnection();
    
    int id=Integer.parseInt(request.getParameter("id"));
    
    
    PreparedStatement psmt= con.prepareStatement("UPDATE `sr_booking` SET `book_status` = 'Completed' WHERE `sr_booking`.`book_id` = "+id);
    int i = psmt.executeUpdate();
    response.sendRedirect("See_bookings.jsp");
%>