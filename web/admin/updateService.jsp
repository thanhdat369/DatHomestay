<%-- 
    Document   : updateService
    Created on : Aug 13, 2019, 3:48:52 PM
    Author     : LEE
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Update Service</title>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="navbar.jsp" %>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Update Service</h1>
                            <form action="/DatHomestay/AdminServiceMainController" method="POST">
                                <input type="hidden" name="id" value="${requestScope.DTO_SERVICE.serviceID}"/>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Name" name="txtServiceName" type="text" maxlength="100" value="${requestScope.DTO_SERVICE.serviceName}" required autofocus/>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Price" name="txtServicePrice" value="${requestScope.DTO_SERVICE.servicePrice}" type="number" step="any" required/>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea class="form-control" name="txtServiceDes"  maxlength="500" rows="4">${requestScope.DTO_SERVICE.serviceDes}</textarea>
                                </div>
                                <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" name="action" value="Update" class="btn btn-lg btn-outline btn-info btn-block"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
