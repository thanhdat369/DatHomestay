<%-- 
    Document   : room
    Created on : Aug 13, 2019, 4:17:46 PM
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
                            <h1 class="page-header">Manager Room</h1>
                        </div>  
                        <div class="row">
                            <div class="col-lg-12">
                                <h1 class="page-header">Search</h1>
                                <form action="/DatHomestay/AdminRoomMainController" method="POST">
                                    <div class="input-group custom-search-form">
                                        <input  class="form-control" placeholder="Name"type="text" name="txtSearch" value="" />
                                        <span class="input-group-btn">
                                            <input class="btn btn-primary" type="submit" value="Search" name="action" />
                                        </span>
                                    </div>
                                    <hr>
                                </form>
                                <!--Ket thuc form search-->
                                <c:if test="${requestScope.INFO_ROOM!=null}">
                                    <c:if test="${not empty requestScope.INFO_ROOM}" var="listRoom">
                                        <table border="1" class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>ID Room</th>
                                                    <th>Price</th>
                                                    <th>Description</th>
                                                    <th>Delete</th>
                                                    <th>Edit</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.INFO_ROOM}" var="room" varStatus="counter">
                                                    <tr>
                                                        <td>${counter.count}</td>
                                                        <td>${room.roomID}
                                                            <br/>
                                                            <img src="${room.roomImgLink}" class="img-thumbnail" style="width: 300px;height: 175px;" alt="${room.roomID}">
                                                        </td>
                                                        <td>${room.roomPrice}</td>
                                                        <td>
                                                            ${room.roomDes}
                                                        </td>
                                                        <td>
                                                            <form action="/DatHomestay/AdminRoomMainController" method="POST">
                                                                <input type="hidden" name="id" value="${room.roomID}"/>
                                                                <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                                                                <input class="btn btn-block btn-outline btn-danger" type="submit" name="action" value="Delete"/>
                                                            </form>
                                                        </td>
                                                        <td>
                                                            <form action="/DatHomestay/AdminRoomMainController" method="POST">
                                                                <input type="hidden" name="id" value="${room.roomID}"/>
                                                                <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                                                                <input class="btn btn-block btn-outline btn-danger" type="submit" name="action" value="Edit"/>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:if>
                                    <c:if test="${!listRoom}">
                                        <h1>No record found</h1>
                                    </c:if>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
