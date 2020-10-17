
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">

        <title>Skill Radar Landing</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap connections -->
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

        <!-- Connection to custom css page -->
        <link rel="stylesheet" href="style/style.css">

        <!-- Sticky navbar -->
        <script type="text/javascript" src="script/sticky-nav-bar.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3 col-xs-10">
                    <img src="images/logo.png" class="img-fluid" height="100px" />
                </div>
                <div class="col-md-9 col-xs-1"></div>
            </div>
        </div>

        <!-- Navbar start -->
        <nav class="navbar navbar-inverse stick-nav">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target="#myNavbar">
                        <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                            class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Skill Radar</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav" id="navbar">
                        <!--li class="active"><a href="#">Home</a></li>
                        <li class="dropdown"><a class="dropdown-toggle"
                                data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                        <li><a href="#">Page 1-1</a></li>
                                        <li><a href="#">Page 1-2</a></li>
                                        <li><a href="#">Page 1-3</a></li>
                                </ul></li>
                        <li><a href="#">Page 2</a></li>
                        <li><a href="#">Page 3</a></li-->
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a data-toggle="modal" data-target="#myModal"><span
                                    class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                        <li><a data-toggle="modal" data-target="#loginModal"><span class="glyphicon glyphicon-log-in"></span>
                                Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Navbar end -->

        <div class="container-fluid slider-div">
            <div class="row">
                <div class="col-md-2 col-xs-1"></div>
                <div class="col-md-8 col-xs-11">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ol class="carousel-indicators">
                                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                    <li data-target="#myCarousel" data-slide-to="1"></li>
                                    <li data-target="#myCarousel" data-slide-to="2"></li>
                                </ol>

                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <img src="images/carosal/pic1.jpg" alt="Los Angeles">
                                    </div>

                                    <div class="item">
                                        <img src="images/carosal/pic2.jpg" alt="Chicago">
                                    </div>

                                    <div class="item">
                                        <img src="images/carosal/pic3.jpg" alt="New York">                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 col-xs-1"></div>
                <!--div class="col-md-3 col-xs-1">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <img src="images/logo.png" class="img-fluid" height="312px" />
                        </div>
                    </div>
                </div-->
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-3 section-hr-container">
                    <hr class="section-hr">
                </div>
                <div class="col-md-6 " align="center">
                    <h2 class="section-heading">Services Offered</h2>
                </div>
                <div class="col-md-3 section-hr-container">
                    <hr class="section-hr">
                </div>
            </div>
        </div>

        <!-- category -->

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <img src="images/categories/Tour.png" class="img-circle"
                                 height="275px" alt="Cinque Terre">
                            <hr>
                            <h4>Tour Guide</h4>
                            <p>Choose a trusted local guide from the locality.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <img src="images/categories/computer.png" class="img-circle"
                                 height="275px" alt="Cinque Terre">
                            <hr>
                            <h4>Laptop Repairs</h4>
                            <p>Fix your laptop by the perfect technical skills.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <img src="images/categories/landscaping.png" class="img-circle"
                                 height="275px" alt="Cinque Terre">
                            <hr>
                            <h4>Landscaping</h4>
                            <p>Get someone for your gardens</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <img src="images/categories/placeholder.png" class="img-circle"
                                 height="275px" alt="Cinque Terre">
                            <hr>
                            <h4>Road side assistance</h4>
                            <p>Get your vehicle fixed and save your trip.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Categories End -->
        <!-- Contact Form Start -->

        <div class="container">
            <div class="row">
                <div class="col-md-3 section-hr-container">
                    <hr class="section-hr">
                </div>
                <div class="col-md-6 " align="center">
                    <h2 class="section-heading">Contact Us</h2>
                </div>
                <div class="col-md-3 section-hr-container">
                    <hr class="section-hr">
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-default" style="padding: 40px;">
                        <form>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="text" contenteditable="false" value="info@skillradar.com" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Message</label>
                                <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Message">
                            </div>
                            <div class="form-check">
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <center><h1>Navigations</h1></center>
                        <img src="https://geoawesomeness.com/wp-content/uploads/2018/05/Azure-maps-search.png" height="280px" style="padding: 20px;padding-left: 60px;">
                    </div>
                </div>
            </div>
            <div class="">

            </div>
        </div>
        <!-- Contact Form Ends -->
 <!-- Footer Start -->

        <footer class="page-footer font-small">

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2020 Copyright:
    <a href="#"> Skill radar </a>
  </div>
  <!-- Copyright -->

</footer>

 <!-- Footer End -->

        <!-- Model start -->
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" align="center">Signup to Account</h4>
                    </div>
                    <div class="modal-body">
                        <button class="btn btn-info" style="width: 100%" onclick="window.location='signup-provider.jsp'">Signup as service Provider</button>
                        <hr style="opacity: 0;">
                        <button class="btn btn-info" style="width: 100%" onclick="window.location='signup-customer.jsp'">Signup as Customer	</button>
                    </div> 
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        
        <div id="loginModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" align="center">Login to Account</h4>
                    </div>
                    <div class="modal-body">
                        <button class="btn btn-info" style="width: 100%" onclick="window.location='Admin/'">Login as Admin</button>
                        <hr style="opacity: 0;">
                        <button class="btn btn-info" style="width: 100%" onclick="window.location='login-provider.jsp'">Login as service Provider</button>
                        <hr style="opacity: 0;">
                        <button class="btn btn-info" style="width: 100%" onclick="window.location='login-customer.jsp'">Login as Customer	</button>
                    </div> 
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        <!-- Model ends -->
    </body>
</html>