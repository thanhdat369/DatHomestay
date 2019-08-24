<%-- 
    Document   : historyBill
    Created on : Aug 24, 2019, 11:16:56 PM
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
        <div style="margin-top: 20px;" class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="text-center">
                        <h1><a href="/DatHomestay/UserGetAllProductBillHistoryController"> History Buy Product </a></h1>
                        <br/>
                        <h1><a href="/DatHomestay/UserGetAllRoomBillHistoryController"> History Book Room </a> </h1>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>