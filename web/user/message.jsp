<%-- 
    Document   : message
    Created on : Aug 20, 2019, 10:43:16 PM
    Author     : LEE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="color:red"> ${requestScope.ERROR}</h1>
        <h1 style="color:green"> ${requestScope.SUCCESS}</h1>
        <a href="/DatHomestay/UserGetAllRoomController">Back to Home</a>
    </body>
</html>
