<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <c:if test="${requestScope.ROOM!=null}">
            <div class="row">
                <c:forEach items="${requestScope.ROOM}" var="room">
                    <div class="col-md-6 col-sm-12">
                        <div class="single-shop-product">
                            <div class="product-upper">
                                <img src="${room.roomImgLink}" style="width: 600px;height: 400px;" alt="${room.roomID}">
                            </div>
                            <h2><span>${room.roomID}</span></h2>
                            <div class="product-carousel-price">
                                <ins>${room.roomPrice} USD</ins> 
                            </div>
                            <button type="button" class="btn-link" data-toggle="modal" data-target="#modal${room.roomID}">
                                More Info
                            </button>
                            <div class="product-option-shop">
                                <a class="add_to_cart_button">Book</a>
                            </div>                       
                        </div>

                        <!-- MODEL TO SHOW INFO -->
                        <div id="modal${room.roomID}" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Modal Header</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>${room.roomDes}</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
    </div>
</div>
