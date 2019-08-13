<%-- 
    Document   : index
    Created on : Aug 12, 2019, 10:59:19 AM
    Author     : LEE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <meta name="description" content="">
            <meta name="author" content="">

            <title>Sign Up</title>
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
                    background-image: url("/DatHomestay/image/background.jpg");
                    background-size: cover;
                    background-color: lightblue;
                }
            </style>
        </head>
        <body>
            <script type="text/javascript">
                function checkConfirm()
                {
                    var a = document.SignUpForm.txtPassword.value;
                    var b = document.SignUpForm.txtConfirm.value;
                    if (a != b)
                    {
                        alert("Confirm not match");
                        return false;
                    } else
                        return true;
                }
            </script>
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <div class="login-panel panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Sign Up</h3>
                            </div>
                            <div class="panel-body">
                                <form role="form" method="POST" action="/DatHomestay/MainController" name="SignUpForm" onsubmit="return(checkConfirm())">
                                    <fieldset>
                                        <div class="form-group">
                                            <input class="form-control" placeholder="Username" name="txtUsername" type="text" maxlength="50"  value="${param.txtUsername}" autofocus required="">
                                        </div>
                                        <c:if test="${requestScope.INVALID!=null&&requestScope.INVALID.usernameError!=null}">
                                            <div class="text-center">
                                                <h5 style="color:red;">${requestScope.INVALID.usernameError}</h5>
                                            </div>
                                        </c:if>
                                        <div class="form-group">
                                            <input class="form-control" placeholder="Password" name="txtPassword" type="password" value="" maxlength="50" required="">
                                        </div>

                                        <div class="form-group">
                                            <input class="form-control" placeholder="Confirm" name="txtConfirm" type="password" required="" maxlength="50" value="">
                                        </div> 

                                        <div class="form-group">
                                            <input class="form-control" placeholder="Full Name" name="txtFullname" type="text"  value="${param.txtFullname}" maxlength="100" required="">
                                        </div>
                                        <div class="form-group">
                                            <input class="form-control" placeholder="E-mail" name="txtEmail" type="email"  maxlength="100" value="${param.txtEmail}" required="">
                                        </div>

                                        <div class="form-group">
                                            <input class="form-control" placeholder="Phone No (10 number begin by 0)" name="txtPhoneNo" value="${param.txtPhoneNo}" pattern="(0)+([0-9]{9})" type="text" title="Must be a phone number">
                                        </div>
                                        <!-- Change this to a button or input when using this as a form -->
                                        <input type="submit" name="action" value="Sign Up" class="btn btn-lg btn-outline btn-info btn-block"/>
                                        <br/>
                                    </fieldset>
                                    <div class="text-center alert alert-info">
                                        <span>Already registered? <a href="index.jsp">Sign In</a></span>
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
</html>
