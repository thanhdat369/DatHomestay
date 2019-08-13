<%-- 
    Document   : index
    Created on : Aug 12, 2019, 11:08:42 AM
    Author     : LEE
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Sign In</title>
        <!-- Bootstrap Core CSS -->
        <link href="/DatHomestay/css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="/DatHomestay/css/metisMenu.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="/DatHomestay/css/startmin.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="/DatHomestay/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style type="text/css">
            body{
                background-image: url("/DatHomestay/image/6.jpg");
                background-size: cover;
                background-color: lightblue;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Please Sign In</h3>
                        </div>
                        <div class="panel-body">
                            <form role="form" method="POST" action="/DatHomestay/MainController" name="SignInForm">
                                <fieldset>
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Username" name="txtUsername" autofocus maxlength="50" required="">
                                    </div>
                                    <div class="form-group">
                                        <input type="password"  class="form-control" placeholder="Password" name="txtPassword"  value="" maxlength="50" required=""/>
                                    </div>
                                    <c:if test="${requestScope.INVALID!=null&&requestScope.INVALID.usernameError!=null}">
                                        <div class="text-center">
                                        <h5 style="color:red;">${requestScope.INVALID.usernameError}</h5>
                                        </div>
                                    </c:if>
                                    <input type="submit" name="action" value="Login" class="btn btn-lg btn-outline btn-info btn-block"/>
                                    <br/>
                                    
                                </fieldset>
                                <div class="text-center alert alert-info">
                                    <span>Not registered? <a href="signUp.jsp">Create an account</a></span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="/DatHomestay/js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="/DatHomestay/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="/DatHomestay/js/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="/DatHomestay/js/startmin.js"></script>

    </body>
</html>
