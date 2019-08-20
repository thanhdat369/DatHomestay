<%-- 
    Document   : staff
    Created on : Aug 20, 2019, 10:46:21 PM
    Author     : LEE
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Staff</title>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <script type="text/javascript">
            function wannaCheckOut(noRecord)
            {
                var check = confirm("Do you wanna check out record number " + noRecord);
                return check;
            }
        </script>
        <div id="wrapper">
            <%@include file="navbar.jsp" %>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Bill CheckOut</h1>
                            <c:if test="${requestScope.INFO_BILLCHECKOUT!=null}">
                                <c:if test="${not empty requestScope.INFO_BILLCHECKOUT}" var="listBill">
                                    <table border="1">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Username</th>
                                                <th>Room</th>
                                                <th>Checkin Day</th>
                                                <th>Checkout Day</th>
                                                <th>Total</th>
                                                <th>Check out</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.INFO_BILLCHECKOUT}" var="dto" varStatus="counter">
                                            <form action="/DatHomestay/StaffCheckOutController" method="POST" onsubmit="return(wannaCheckOut(${counter.count}))">
                                                <tr>
                                                    <td>${counter.count}</td>
                                                    <td>${dto.customerUsername}</td>
                                                    <td>${dto.roomID}</td>
                                                    <td><input type="date" class="form-control" value="${dto.checkinDay}" disabled=""/></td>
                                                    <td><input type="date" class="form-control" value="${dto.checkoutDay}" disabled=""/></td>
                                                    <td>${dto.total}</td>
                                                    <td>
                                                        <input type="hidden" value="${dto.orderRoomID}" name="txtOrderRoomID"/> 
                                                        <input class="btn btn-success btn-outline" type="submit" value="Check" name="action"/>
                                                    </td>
                                                </tr>
                                            </form>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </c:if>
                                <c:if test="${!listBill}">
                                    <h1>No Bill To Process</h1>
                                </c:if>
                            </c:if>
                        </div>
                    </div>
                    <hr>
                    <!-- ... Your content goes here ... -->
                </div>
            </div>
        </div>
    </body>
</html>