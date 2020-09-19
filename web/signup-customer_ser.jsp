<%@page import="java.util.LinkedList"%>
<%@page  import="com.SkillRadar.Entites.*,com.SkillRadar.Entites.ORM.CustomerORM"%>
<%

Customer tempCust=new Customer();
tempCust.setId(0);
tempCust.setName(request.getParameter("name"));
tempCust.setEmail(request.getParameter("email"));
tempCust.setPassword(request.getParameter("password"));
Location tempLocation=new Location(8.9156436,76.62534389999999);
tempCust.setLocation(tempLocation);

CustomerORM oRM=new CustomerORM();

Customer existingCustomers=oRM.getCustomer(request.getParameter("email"));

if(existingCustomers==null)
{
    oRM.insertUser(tempCust);
    %>
    <script>
        alert("User created");
        window.location = "login-customer.jsp";
    </script>
    <%
}
else
{
    %>
    <script>
        alert("User with the same email id exists in the system");
        window.location = "signup-customer.jsp";
    </script>
    <%
}

%>