<%@page import="java.util.ArrayList"%>
<%@page  import="com.SkillRadar.Entites.*,com.SkillRadar.Entites.ORM.ProviderORM"%>
<%

Provider tempProvider=new Provider(0, request.getParameter("name"), request.getParameter("email"), request.getParameter("password"), null, new Location(8.9156436,76.62534389999999), null, false);

ProviderORM oRM=new ProviderORM();

ArrayList<Provider> existingCustomers=oRM.getProvider("`ser_email`="+request.getParameter("email"));

if(existingCustomers==null)
{
    oRM.insertProvider(tempProvider);
    %>
    <script>
        alert("User created");
        window.location = "login-provider.jsp";
    </script>
    <%
}
else
{
    %>
    <script>
        alert("User with the same email id exists in the system");
        window.location = "signup-provider.jsp";
    </script>
    <%
}

%>