
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
    
    PreparedStatement psmt= con.prepareStatement("INSERT INTO `sr_booking` (`book_provider`, `book_customer`, `book_service`) VALUES ('"+provider+"', '"+customer+"', '"+service+"')");
    int i = psmt.executeUpdate();
    
%>