<%-- 
    Document   : deletedRoom
    Created on : Aug 13, 2019, 8:05:53 PM
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
                            <h1 class="page-header">ROOM RECOVERY</h1>
                            <c:if test="${requestScope.INFO_DELETED_ROOM!=null}">
                                <c:if test="${not empty requestScope.INFO_DELETED_ROOM}" var="listRoom">
                                    <table border="1" class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>ID Room</th>
                                                <th>Price</th>
                                                <th>Image and Link</th>
                                                <th>Recover</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.INFO_DELETED_ROOM}" var="room" varStatus="counter">
                                                <tr>
                                                    <td>${counter.count}</td>
                                                    <td>${room.roomID}</td>
                                                    <td>${room.roomPrice}</td>
                                                    <td><img src="${room.roomImgLink}" style="width: 200px;height: 200px"/> 
                                                        <br/>
                                                        <a href="${room.roomImgLink}">${room.roomImgLink}</a>
                                                    </td>
                                                    <td>
                                                        <form action="/DatHomestay/AdminRoomMainController" method="POST">
                                                            <input type="hidden" name="id" value="${room.roomID}"/>
                                                            <input class="btn btn-block btn-outline btn-danger" type="submit" name="action" value="Recover"/>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:if>
                                <c:if test="${!listRoom}">
                                    <h3 class="text-danger">YOU HAVE NOT DELETED ANY ROOM YET</h3>
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
