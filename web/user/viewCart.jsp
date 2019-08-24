<%-- 
    Document   : viewCart
    Created on : Aug 20, 2019, 7:41:00 PM
    Author     : LEE
--%>
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
                            <h2>YOUR CART</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container" style="padding: 20px;">
            <div class="row">
                <div class="col-md-6">
                    <c:if test="${sessionScope.CART!=null}" var="checkCart">
                        <c:if test="${not empty sessionScope.CART.cartDetail}" var="checkEmpty">
                            <table border="1" class="table table-responsive table-hover">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Product Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Type</th>
                                        <th>Update</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${sessionScope.CART.cartDetail}" var="dto" varStatus="counter"> 
                                    <form action="/DatHomestay/UserEditShoppingCartController" method="POST">
                                        <input type="hidden" name="txtID" value="${dto.proID}"/>
                                        <tr>
                                            <td>${counter.count}</td>
                                            <td>${dto.proName}
                                                <img src=" ${dto.proImgLink}" style="width: 100px;height: 100px;" class="img-thumbnail"/>
                                            </td>
                                            <td>${dto.proPrice}</td>
                                            <td>
                                                <input type="number" name="txtQuantity" min="1" value="${dto.quantityBuy}"/>
                                            </td>
                                            <td>${dto.proType}</td>
                                            <td>
                                                <input type="submit" name="action" value="Update"/>
                                            </td>
                                            <td>
                                                <input type="submit" name="action" value="Delete"/>
                                            </td>
                                        </tr>
                                    </form>
                                </c:forEach>
                                <tr>
                                    <td>TOTAL</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><strong>${sessionScope.CART.total}</strong> (USD)</td>
                                </tr>
                                </tbody>
                            </table>
                            <h3>CHECK OUT</h3>
                            <form action="/DatHomestay/UserBuyProductMainController" method="POST">
                                <input type="submit" name="action" class="btn-sm btn-info" value="Check Out"/>
                            </form>
                        </c:if>
                        <c:if test="${!checkEmpty}">
                            <h2>YOU DIDNT ADD ANYTHING INTO YOUR CART</h2>
                        </c:if>
                    </c:if>
                    <c:if test="${!checkCart}">
                        <h2>YOU DIDNT ADD ANYTHING INTO YOUR CART</h2>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <h1 style="color:red"> ${requestScope.ERROR}</h1>
                <h1 style="color:green"> ${requestScope.SUCCESS}</h1>
            </div>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>
