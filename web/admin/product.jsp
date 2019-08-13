<%-- 
    Document   : product
    Created on : Aug 13, 2019, 8:42:04 PM
    Author     : LEE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="navbar.jsp" %>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Manager Product</h1>
                        </div>  
                        <div class="row">
                            <div class="col-lg-12">
                                <h1 class="page-header">Search</h1>
                                <form action="/DatHomestay/AdminProductMainController" method="POST">
                                    <div class="input-group custom-search-form">
                                        <input  class="form-control" placeholder="Name"type="text" name="txtSearch" value="${param.txtSearch}" />
                                        <span class="input-group-btn">
                                            <input class="btn btn-primary" type="submit" value="Search" name="action" />
                                        </span>
                                    </div>
                                    <hr>
                                </form>
                                <c:if test="${requestScope.INFO_PRODUCT!=null}">
                                    <c:if test="${not empty requestScope.INFO_PRODUCT}" var="listProduct">
                                        <table border="1" class="table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Name</th>
                                                    <th>Price</th>
                                                    <th>Description</th>
                                                    <th>Type</th>
                                                    <th>Delete</th>
                                                    <th>Edit</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.INFO_PRODUCT}" var="product" varStatus="counter">
                                                    <tr>
                                                        <td>${counter.count}</td>
                                                        <td>${product.proName}</td>
                                                        <td>${product.proPrice}</td>
                                                        <td>${product.proDes}</td>
                                                        <td>${product.proType}</td>
                                                        <td>
                                                            <form action="/DatHomestay/AdminProductMainController" method="POST">
                                                                <input type="hidden" name="id" value="${product.proID}"/>
                                                                <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                                                                <input class="btn btn-block btn-outline btn-danger" type="submit" name="action" value="Delete"/>
                                                            </form>
                                                        </td>
                                                        <td>
                                                            <form action="/DatHomestay/AdminProductMainController" method="POST">
                                                                <input type="hidden" name="id" value="${product.proID}"/>
                                                                <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                                                                <input class="btn btn-block btn-outline btn-danger" type="submit" name="action" value="Edit"/>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:if>
                                    <c:if test="${!listProduct}">
                                        <h1>No record found</h1>
                                    </c:if>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
