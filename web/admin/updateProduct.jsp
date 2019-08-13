<%-- 
    Document   : updateProduct
    Created on : Aug 13, 2019, 9:38:06 PM
    Author     : LEE
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Update Product</title>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="navbar.jsp" %>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Update Product</h1>
                            <form action="/DatHomestay/AdminProductMainController" method="POST">
                                <div class="form-group">
                                    <label>Product ID</label>
                                    <input class="form-control" placeholder="Product ID" name="txtProID" type="text" maxlength="15" value="${requestScope.DTO_PRODUCT.proID}" readonly autofocus/>
                                </div>
                                <div class="form-group">
                                    <label>Product Name</label>
                                    <input class="form-control" placeholder="Product Name" name="txtProName" type="text" maxlength="100" value="${requestScope.DTO_PRODUCT.proName}" required/>
                                </div>
                                <div class="form-group">
                                    <label>Product Price</label>
                                    <input class="form-control" placeholder="Price" name="txtProPrice" type="number" step="any" value="${requestScope.DTO_PRODUCT.proPrice}" max="1000000000" required/>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea class="form-control" name="txtProDes"  maxlength="500" rows="4">${requestScope.DTO_PRODUCT.proDes}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Image Link</label>
                                    <input class="form-control" placeholder="Link image" name="txtProImgLink" maxlength="100" type="text" value="${requestScope.DTO_PRODUCT.proImgLink}" required/>
                                    <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                                </div>
                                <div class="form-group">
                                    <label>Type</label>
                                    <select class="form-control" name="cmbProType">
                                        <option value="food" <c:if test="${requestScope.DTO_PRODUCT.proType eq 'food'}">selected</c:if>> Food </option>
                                        <option value="drink" <c:if test="${requestScope.DTO_PRODUCT.proType eq 'drink'}">selected</c:if>>Drink</option>
                                    </select>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" name="action" value="Update" class="btn btn-lg btn-outline btn-info btn-block"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
