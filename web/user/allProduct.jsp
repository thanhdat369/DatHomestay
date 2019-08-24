<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="single-product-area">
    <div class="zigzag-bottom">
        <div class="container">
            <c:if test="${requestScope.PRODUCT!=null}">
                <c:if test="${not empty requestScope.PRODUCT}" var="list">
                    <div class="row">
                        <c:forEach items="${requestScope.PRODUCT}" var="product">
                            <form action="/DatHomestay/UserBuyProductMainController" method="POST">
                                <div class="col-md-4 col-sm-12">
                                    <div class="single-shop-product">
                                        <div class="product-upper">
                                            <img src="${product.proImgLink}" class="img-thumbnail" style="width: 350px;height: 350px;" alt="${room.roomID}">
                                        </div>
                                        <h3 style="margin-top:10px"><span>Product: ${product.proName}</span></h3>
                                        <div class="product-carousel-price">
                                            <ins>Price: <span style="color: red">${product.proPrice} </span>USD</ins> 
                                        </div>
                                        <div>
                                            <p><strong>Description: </strong>${product.proDes}</p>
                                            <p><strong>Type </strong>${product.proType}</p>
                                        </div>
                                        <div class="product-option-shop">
                                            <strong>Quantity</strong> you want to buy:
                                            <input type="number" name="txtQuantityAdd" value="1" min="1" max="${product.proQuantity}"/>
                                            <input type="hidden" name="txtProID" value="${product.proID}"/>
                                            <br/>
                                            <input type="submit" name="action" value="Add to Cart" class="add_to_cart_button" />                                    
                                        </div>                       
                                    </div>
                                </div>
                            </form>
                        </c:forEach>
                    </div>
                </c:if>
                <c:if test="${!list}">
                    NO PRODUCT TO SHOW
                </c:if>
            </c:if>
            <c:if test="${requestScope.PAGEMAX!=null and requestScope.PAGECURRENT!=null}">
                <p>Page ${requestScope.PAGECURRENT} on Total ${requestScope.PAGEMAX} page</p>
                <c:if test="${requestScope.PAGEMAX>1}">
                    <c:if test="${requestScope.PAGEMAX==2}">
                        <ul class="pagination text-center">
                            <li><a href="/DatHomestay/UserGetAllProductController?pageID=1">1</a></li>
                            <li><a href="/DatHomestay/UserGetAllProductController?pageID=2">2</a></li>
                        </ul>
                    </c:if>
                    <c:if test="${requestScope.PAGEMAX>2}">
                        <c:if test="${requestScope.PAGECURRENT==1}">
                            <ul class="pagination text-center">
                                <li><a href="/DatHomestay/UserGetAllProductController?pageID=1">1</a></li>
                                <li><a href="/DatHomestay/UserGetAllProductController?pageID=2">2</a></li>
                                <li><a href="/DatHomestay/UserGetAllProductController?pageID=3">3</a></li>
                                <li><a href="/DatHomestay/UserGetAllProductController?pageID=${requestScope.PAGEMAX}">Last Page</a></li>
                            </ul>
                        </c:if>
                        <c:if test="${requestScope.PAGECURRENT==PAGEMAX}">
                            <ul class="pagination text-center">
                                <li><a href="/DatHomestay/UserGetAllProductController?pageID=1">First Page</a></li>
                                <li><a href="/DatHomestay/UserGetAllProductController?pageID=${requestScope.PAGEMAX-2}">${requestScope.PAGEMAX-2}</a></li>
                                <li><a href="/DatHomestay/UserGetAllProductController?pageID=${requestScope.PAGEMAX-1}">${requestScope.PAGEMAX-1}</a></li>
                                <li><a href="/DatHomestay/UserGetAllProductController?pageID=${requestScope.PAGEMAX}">${requestScope.PAGEMAX}</a></li>
                            </ul>
                        </c:if>
                        <c:if test="${requestScope.PAGECURRENT!=1 and requestScope.PAGECURRENT!=requestScope.PAGEMAX}">
                            <ul class="pagination text-center">
                                <li><a href="/DatHomestay/UserGetAllProductController?pageID=1">First Page</a></li>
                                <li><a href="/DatHomestay/UserGetAllProductController?pageID=${requestScope.PAGECURRENT-1}">${requestScope.PAGECURRENT-1}</a></li>
                                <li><a href="/DatHomestay/UserGetAllProductController?pageID=${requestScope.PAGECURRENT}">${requestScope.PAGECURRENT}</a></li>
                                <li><a href="/DatHomestay/UserGetAllProductController?pageID=${requestScope.PAGECURRENT+1}">${requestScope.PAGECURRENT+1}</a></li>
                                <li><a href="/DatHomestay/UserGetAllProductController?pageID=${requestScope.PAGEMAX}">Last Page</a></li>
                            </ul>
                        </c:if>
                    </c:if>
                </c:if>
            </c:if>
        </div>
    </div>
</div>
