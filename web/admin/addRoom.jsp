<%-- 
    Document   : addRoom
    Created on : Aug 13, 2019, 4:19:56 PM
    Author     : LEE
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add Room</title>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="navbar.jsp" %>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Add New Room</h1>
                            <form action="/DatHomestay/AdminRoomMainController" method="POST">
                                <div class="form-group">
                                    <label>Room ID</label>
                                    <input class="form-control" placeholder="ID Room" name="txtRoomID" type="text" maxlength="15" required autofocus/>
                                     <c:if test="${requestScope.INVALID!=null&&requestScope.INVALID.roomIDError!=null}">
                                            <div class="text-danger">
                                                <h5 style="color:red;">${requestScope.INVALID.roomIDError}</h5>
                                            </div>
                                    </c:if>
                                </div>
                                <div class="form-group">
                                    <label>Room Price</label>
                                    <input class="form-control" placeholder="Price" name="txtRoomPrice" type="number" step="any" max="100000000" required/>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea class="form-control" name="txtRoomDes"  maxlength="500" rows="4">${requestScope.DTO_ROOM.roomDes}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Image Link</label>
                                    <input class="form-control" placeholder="Link image" name="txtRoomImgLink" maxlength="100" type="text" value="${requestScope.DTO_ROOM.roomImgLink}" required/>
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
