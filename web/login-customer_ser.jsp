<%@page import="java.util.LinkedList"%>
<%@page  import="com.SkillRadar.Entites.*,com.SkillRadar.Entites.ORM.CustomerORM"%>
<%

CustomerORM oRM=new CustomerORM();

Customer existingCustomers=oRM.getCustomer(request.getParameter("email"), request.getParameter("password"));

if(existingCustomers!=null)
{
    session.setAttribute("customer", existingCustomers);
    %>
    
    <script>
        window.location = "login-customer.jsp?type=success&message=The credentials match";
    </script>
    <%
}
else
{
    %>
    <script>
        window.location = "login-customer.jsp?type=danger&message=The credentials dosn't match";
    </script>
    <%
}

%>