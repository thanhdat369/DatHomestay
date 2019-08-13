<%-- 
    Document   : addService
    Created on : Aug 13, 2019, 11:25:04 AM
    Author     : LEE
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add Service</title>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="navbar.jsp" %>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Add New Service</h1>
                            <form action="/DatHomestay/AdminServiceMainController" method="POST">
                                <div class="form-group">
                                    <input class="form-control" placeholder="Name" name="txtServiceName" type="text" maxlength="100" required autofocus/>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Price" name="txtServicePrice" type="number" step="any" required/>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea class="form-control" name="txtServiceDes"  maxlength="500" rows="4"></textarea>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" name="action" value="Add" class="btn btn-lg btn-outline btn-info btn-block"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
