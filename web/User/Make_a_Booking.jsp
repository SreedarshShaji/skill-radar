
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page  import="com.SkillRadar.Entites.ORM.DBconnect;"%>
<%
    DBconnect connector = new DBconnect();
    Connection con = connector.getConnection();
    
    String provider=request.getParameter("provider");
    String customer=request.getParameter("customer");
    String service=request.getParameter("service");
    String userLocation=request.getParameter("loc");
    
    
    PreparedStatement psmt= con.prepareStatement("INSERT INTO `sr_booking` (`book_provider`, `book_customer`, `book_service`,`user_location`) VALUES ('"+provider+"', '"+customer+"', '"+service+"','"+userLocation+"')");
    int i = psmt.executeUpdate();
    response.sendRedirect("user_see_bookings.jsp");
%>