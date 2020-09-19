<%@page  import="com.SkillRadar.Entites.*,com.SkillRadar.Entites.ORM.ProviderORM"%>
<%


Provider Provider=new ProviderORM().getProvider("SreedarshShaji@outllook.com", "PlKollam");

if(Provider!=null)
{
    session.setAttribute("provider", Provider);
    Cookie id = new Cookie("id", ((int)Provider.getId()));
    id.setMaxAge(60*60*24); 
    response.addCookie(id);
    %>
    <script>
        window.location = "login-provider.jsp?type=success&message=The credentials match";
    </script>
    <%
}
else
{
    %>
    <script>
        window.location = "login-provider.jsp?type=danger&message=The credentials dosn't match";
    </script>
    <%
}

%>