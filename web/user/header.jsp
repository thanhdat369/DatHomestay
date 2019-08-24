<%-- 
    Document   : header
    Created on : Aug 14, 2019, 9:04:11 AM
    Author     : LEE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="/DatHomestay/css/bootstrap.min.css">
    <link rel="stylesheet" href="/DatHomestay/css/font-awesome.min.css">
    <link rel="stylesheet" href="/DatHomestay/css/owl.carousel.css">
    <link rel="stylesheet" href="/DatHomestay/css/style.css">
    <link rel="stylesheet" href="/DatHomestay/css/responsive.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="user-menu">
                        <ul>
                            <li><span> Hello , ${sessionScope.USER}<span></li>
                            <li><a href="/DatHomestay/LogoutController"><i class="fa fa-user"></i> Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div> 
  </body>
</html>
