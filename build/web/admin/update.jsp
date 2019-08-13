<%-- 
    Document   : update
    Created on : Aug 12, 2019, 10:28:13 PM
    Author     : LEE
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="navbar.jsp" %>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Update User</h1>
                            <div class="form">
                                <form role="form" method="POST" action="/DatHomestay/AdminMainController" name="UpdateForm">
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Username" name="txtUsername" type="text" maxlength="50"  value="${requestScope.DTO_USER.username}" autofocus readonly>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Full Name" name="txtFullname" type="text"  value="${requestScope.DTO_USER.fullname}" maxlength="100" required="">
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="E-mail" name="txtEmail" type="email"  maxlength="100" value="${requestScope.DTO_USER.email}" required="">
                                    </div>

                                    <div class="form-group">
                                        <input class="form-control" placeholder="Phone No (10 number begin by 0)" name="txtPhoneNo" value="${requestScope.DTO_USER.phoneNo}" pattern="(0)+([0-9]{9})" type="text" title="Must be a phone number">
                                        <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                                    </div>
                                    <div class="form-group">
                                        <label>
                                            Your Role
                                        </label>
                                        <select class="form-control" name="cmbRole">
                                            <option value="admin"<c:if test="${requestScope.DTO_USER.role eq 'admin'}">selected</c:if>> Admin </option>
                                            <option value="staff"<c:if test="${requestScope.DTO_USER.role eq 'staff'}">selected</c:if>>Staff</option>
                                            <option value="user"<c:if test="${requestScope.DTO_USER.role eq 'user'}">selected</c:if>>User</option>
                                        </select>
                                    </div>
                                    <!-- Change this to a button or input when using this as a form -->
                                    <input type="submit" name="action" value="Update" class="btn btn-lg btn-outline btn-info btn-block"/>
                                </form>
                                <br/>
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
