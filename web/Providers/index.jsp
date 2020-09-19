<%@page import="com.SkillRadar.Entites.Provider"%>
<%@include  file="includes/header.jsp"%>
<%  Cookie cookie = null;
    Cookie[] cookies = null;

    // Get an array of Cookies associated with the this domain
    cookies = request.getCookies();

    if (cookies != null) {

        for (int i = 0; i < cookies.length; i++) {
            cookie = cookies[i];
            out.print("Name : " + cookie.getName() + ",  ");
        }
    } else {
        %>
        <div class="row">    
                <div class="col-md-1 col-xs-1"></div>
                <div class="col-md-10 col-xs-10">
                    <div class="alert alert-warning" role="alert">
                        Cookie malfunction, page may not work properly
                    </div>
                </div>
                <div class="col-md-1 col-xs-1"></div>
            </div>
        <%
    }%>
<div class="container-fluid slider-div">
    <div class="row">
        <div class="col-md-3 col-xs-1"></div>
        <div class="col-md-6 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2 align="center">Add Services provided</h2>
                </div>
                <div class="panel-body">
                    <form action="login-provider_ser.jsp" method="post">
                        <div class="form-group">
                            <label for="email">Email address:</label> <input type="email"
                                                                             class="form-control" id="email" name="email">
                        </div>
                        <div class="form-group">
                            <label for="pwd">Password:</label> <input type="password"
                                                                      class="form-control" id="pwd" name="password">
                        </div>
                        <input type="submit" class="btn btn-primary" style="width: 100%;" value="login"
                               value="Submit">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include  file="includes/footer.jsp"%>
