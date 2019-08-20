<%-- 
    Document   : bookRoom
    Created on : Aug 20, 2019, 10:26:44 PM
    Author     : LEE
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dat HomeStay</title>
    </head>
    <body>
        <script src="/DatHomestay/user/bookroom.js"></script>
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

        <!--START Thong tin san pham-->
        <c:if test="${requestScope.DTO_ROOM!=null}">
            <div class="container">
                <div class="row">
                    <form method="POST" action="/DatHomestay/UserBookRoomMainController" onsubmit="return(bookingRoomAjax())">
                        <div class="col-md-12 col-sm-12">
                            <img src="${requestScope.DTO_ROOM.roomImgLink}" class="img-thumbnail" style="width: 900px;height: 525px;" alt="${room.roomID}">
                            <h2>Room ${requestScope.DTO_ROOM.roomID}</h2>
                            <h3><strong>Price:</strong> ${requestScope.DTO_ROOM.roomPrice}<span style="color: red"> USD/Day</span></h3>  
                            <h4>Description</h4>
                            <p>${requestScope.DTO_ROOM.roomDes}</p>
                            <hr/>
                            <div class="col-md-6">
                                <h4>Please choose day to stay </h4>
                                <div class="form-group">
                                    <label>Checkinday</label>
                                    <input type="date" name="txtCheckinDay" onchange="calculateMoney()" class="form-control" id="checkinDay" required=""/>
                                </div>
                                <div class="form-group">
                                    <label>Check out day</label>
                                    <input type="date" name="txtCheckoutDay" onchange="calculateMoney()" class="form-control" id="checkoutDay" required=""/>
                                </div>
                                <input type="hidden" name="txtPrice" value="${requestScope.DTO_ROOM.roomPrice}" id="roomPrice"/>
                                <input type="hidden" name="txtRoomID" value="${requestScope.DTO_ROOM.roomID}" id="roomID"/>
                                <h3>Total Day : <span id="totalDay">1</span> Day</h3>
                                <h3>Total: <span id="showRoomTotal">${requestScope.DTO_ROOM.roomPrice}</span> $</h3>
                                <input type="hidden" name="txtTotal" value="${requestScope.DTO_ROOM.roomPrice}" id="txtTotal"/>
                                <input type="submit"  class="btn-info" value="Book" name="action"/>   
                            </div>
                        </div>
                </div>
            </form>
        </div>
    </div>
</c:if>
<!--END Thong tin san pham-->

<hr/>
<div style="margin-top: 10px;" class="container">
    <div class="row">
        <div class="col-md-12">
            <div id="msg">

            </div>
        </div>
    </div>
</div>

<%@include file="footer.jsp" %>
</body>
</html>
