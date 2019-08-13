<%-- 
    Document   : admin
    Created on : Aug 12, 2019, 11:19:06 AM
    Author     : LEE
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin</title>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="navbar.jsp" %>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Manager Account</h1>
                            <form action="/DatHomestay/AdminMainController" method="POST">
                                <div class="input-group custom-search-form">
                                    <input  required class="form-control" type="text" name="txtSearch" value="" />
                                    <span class="input-group-btn">
                                        <input class="btn btn-primary" type="submit" value="Search" name="action" />
                                    </span>
                                </div>
                            </form>
                            <hr>
                            <form action="/DatHomestay/MainController" method="POST">
                                <input type="hidden" name="txtSearch" value="" />
                                <input class="btn btn-primary" type="submit" value="List All" name="action" />
                            </form>
                            <hr>
                            <c:if test="${requestScope.INFO_USER!=null}">
                                <c:if test="${not empty requestScope.INFO_USER}" var="listAccount">
                                    <table border="1" class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Username</th>
                                                <th>Fullname</th>
                                                <th>Email</th>
                                                <th>PhoneNo</th>
                                                <th>Role</th>
                                                <th>Delete</th>
                                                <th>Edit</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.INFO_USER}" var="account" varStatus="counter">
                                                <tr>
                                                    <td>${counter.count}</td>
                                                    <td>${account.username}</td>
                                                    <td>${account.fullname}</td>
                                                    <td>${account.email}</td>
                                                    <td>${account.phoneNo}</td>
                                                    <td>${account.role}</td>
                                                    <td>
                                                        <form action="AdminMainController" method="POST">
                                                            <input type="hidden" name="id" value="${account.username}"/>
                                                            <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                                                            <input class="btn btn-block btn-outline btn-danger" type="submit" name="action" value="Delete"/>
                                                        </form>
                                                    </td>
                                                    <td>
                                                        <form action="AdminMainController" method="POST">
                                                            <input type="hidden" name="id" value="${account.username}"/>
                                                            <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                                                            <input class="btn btn-block btn-outline btn-danger" type="submit" name="action" value="Edit"/>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                </c:if>
                                <c:if test="${!listAccount}">
                                    <h1>No record found</h1>
                                </c:if>
                            </c:if>
                        </div>
                    </div>
                    <hr>
                    <!-- ... Your content goes here ... -->
                    <h4>Edit My Profile</h4>
                    <form action="/DatHomestay/MainController" method="POST">
                        <input type="hidden" name="id" value="${sessionScope.USER}"/>
                        <input type="hidden" name="txtSearch" value=""${param.txtSearch}/>
                        <input class="btn btn-default" type="submit" name="action" value="Edit Profile"/>
                    </form>
                    <hr>
                </div>
            </div>
        </div>
