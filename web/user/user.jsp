<%-- 
    Document   : user
    Created on : Aug 14, 2019, 8:58:48 AM
    Author     : LEE
--%>
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
                            <h2>All Home Stay</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="allRoom.jsp" %>
        <%@include file="footer.jsp" %>
    </body>
</html>
