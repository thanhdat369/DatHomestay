<%-- 
    Document   : product
    Created on : Aug 20, 2019, 3:52:52 PM
    Author     : LEE
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PRODUCT</title>
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
                            <h2>All Product</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${requestScope.ROOMID!=null}" var="checkStay">
            <div class="container" style="margin-top: 20px;">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-bit-title text-center">
                            <h3 style="color:red">YOUR PRODUCT WILL BRING TO ROOM ${requestScope.ROOMID}</h3>
                        </div>
                    </div>
                </div>
            </div>

            <%@include file="allProduct.jsp" %>
        </c:if>
        <c:if test="${!checkStay}">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-bit-title text-center">
                            <h2 style="color:red">Please Book Room. That products just sell for people staying at DAT Homestay now</h2>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <%@include file="footer.jsp" %>
    </body>
</html>
