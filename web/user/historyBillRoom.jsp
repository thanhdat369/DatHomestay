<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dat HomeStay</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%@include file="top.jsp" %>
        <%@include file="menu.jsp" %>
        <div class="product-big-title-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-bit-title text-center">
                            <h2>HISTORY BILL ROOM</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container" style="margin-top: 20px;">
            <div class="row">
                <div class="col-md-12">
                    <c:if test="${requestScope.INFO_BILLROOM!=null}">
                        <c:if test="${not empty requestScope.INFO_BILLROOM}" var="list">
                            <table border="1" class="table table-striped text-center">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Order Room ID</th>
                                        <th>Room ID</th>
                                        <th>Price Per Day</th>
                                        <th>Check in day</th>
                                        <th>Check out day</th>
                                        <th>Total</th>
                                        <th>Status</th>
                                        <th>Staff Check Out</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.INFO_BILLROOM}" var="dto" varStatus="counter">
                                        <tr>
                                            <td>${counter.count}</td>
                                            <td>${dto.orderRoomID}</td>
                                            <td>${dto.roomID}</td>
                                            <td>${dto.roomPrice}</td>
                                            <td>
                                                <input type="date" value="${dto.checkinDay}" disabled/>
                                            </td>
                                            <td>
                                                <input type="date" value="${dto.checkoutDay}" disabled/>
                                            </td>
                                            <td>${dto.total}</td>
                                            <td>${dto.status}</td>
                                            <td>${dto.staffUsername}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${!list}">
                            <h1>NO BILL TO SHOW</h1> 
                        </c:if>
                    </c:if>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
