<%-- 
    Document   : addProduct
    Created on : Aug 13, 2019, 10:18:38 PM
    Author     : LEE
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add Product</title>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="navbar.jsp" %>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Add Product</h1>
                            <form action="/DatHomestay/AdminProductMainController" method="POST">
                                <div class="form-group">
                                    <label>Product Name</label>
                                    <input class="form-control" placeholder="Product Name" name="txtProName" type="text" maxlength="100"/>
                                </div>
                                <div class="form-group">
                                    <label>Product Price</label>
                                    <input class="form-control" placeholder="Price" name="txtProPrice" type="number" step="any" max="1000000000" required/>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea class="form-control" name="txtProDes"  maxlength="500" rows="4"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Image Link</label>
                                    <input class="form-control" placeholder="Link image" name="txtProImgLink" maxlength="100" type="text" required/>
                                </div>
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <input class="form-control" placeholder="Quantity" name="txtProQuantity" max="1000000" type="number" required/>
                                </div>
                                <div class="form-group">
                                    <label>Type</label>
                                    <select class="form-control" name="cmbProType">
                                        <option value="food"> Food </option>
                                        <option value="drink">Drink</option>
                                    </select>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" name="action" value="Add" class="btn btn-lg btn-outline btn-info btn-block"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
