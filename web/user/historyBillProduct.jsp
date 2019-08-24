<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                            <h2>BILL PRODUCT</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container" style="margin-top: 20px;">
            <div class="row">
                <div class="col-md-12">
                    <c:if test="${requestScope.INFO_BILLPRODUCT!=null}">
                        <c:if test="${not empty requestScope.INFO_BILLPRODUCT}" var="list">
                            <table border="1" class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Order Product ID</th>
                                        <th>Username</th>
                                        <th>Total</th>
                                        <th>Detail</th>
                                        <th>Time Check Out</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.INFO_BILLPRODUCT}" var="dto" varStatus="counter">
                                        <tr>
                                            <td>${counter.count}</td>
                                            <td>${dto.orderProductID}</td>
                                            <td>${dto.custormerUsername}</td>
                                            <td>${dto.total} $</td>
                                            <td class="text-center">
                                                <form action="/DatHomestay/UserViewDetailOrderProductController" method="POST">
                                                    <input type="hidden" value="${dto.orderProductID}" name="txtOrderProductID"/>
                                                    <input type="hidden" value="${dto.total}" name="txtTotal"/>
                                                    <input type="submit" value="View Detail" name="action" class="btn btn-info"/>
                                                </form>
                                            </td>
                                            <td>
                                                <p class="alert-danger">${dto.timeCheckOut}</p>
                                            </td>
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
