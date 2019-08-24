<%-- 
    Document   : searchAvailableRoom
    Created on : Aug 24, 2019, 10:46:07 PM
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
                            <h2>Available Room</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="/DatHomestay/user/bookroom.js"></script>
        <div class="container" style="padding-bottom:100px;">
            <div class="row">

                <div class="col-md-6" style="position: fixed;z-index: 1000; top:50px;right:0px;">
                    <form action="/DatHomestay/UserGetAvailableRoomController" method="POST" onsubmit="return(showAvailableRoomList())">
                        <strong>Checkin day:</strong> 
                        <input type="date" name="txtCheckinDay" onchange="showAvailableRoomList()" id="checkinDay" required=""/>
                        <strong>Checkout day</strong> 
                        <input type="date" name="txtCheckoutDay" onchange="showAvailableRoomList()"  id="checkoutDay" required=""/>
                        <input type="submit" name="action" value="Search"/>
                    </form>
                </div>
            </div>
        </div>

        <div id="resultDiv">

        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
