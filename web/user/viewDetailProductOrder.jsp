<%-- 
    Document   : viewDetailProductOrder
    Created on : Aug 24, 2019, 11:24:31 PM
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
                            <h2>DETAIL</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container" style="padding: 20px;">
            <div class="row">
                <div class="col-md-6">
                    <c:if test="${requestScope.INFO_LISTDETAIL!=null}" var="checkCart">
                        <h2>ID: ${requestScope.ORDERID}</h2>
                        <c:if test="${not empty requestScope.INFO_LISTDETAIL}" var="checkEmpty">
                            <table border="1" class="table table-responsive table-hover">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Product Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.INFO_LISTDETAIL}" var="dto" varStatus="counter"> 
                                    <input type="hidden" name="txtID" value="${dto.proID}"/>
                                    <tr>
                                        <td>${counter.count}</td>
                                        <td>${dto.proName}
                                        </td>
                                        <td>${dto.proPrice}</td>
                                        <td>
                                            ${dto.quantityBuy}
                                        </td>
                                        <td>${dto.proPrice*dto.quantityBuy}</td>
                                    </tr>
                                    </form>
                                </c:forEach>
                                <tr>
                                    <td>TOTAL</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><strong>${requestScope.TOTALBILL}</strong> (USD)</td>
                                </tr>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${!checkEmpty}">
                            <h2>NOTHING HERE. PLEASE TRY AGAIN</h2>
                        </c:if>
                    </c:if>
                    <c:if test="${!checkCart}">
                        <h2>SOMETHING WRONG. PLEASE TRY AGAIN</h2>
                    </c:if>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
