<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="single-product-area">
    <div class="zigzag-bottom">
        <div class="container">
            <c:if test="${requestScope.ROOM!=null}">
                <div class="row">
                    <c:forEach items="${requestScope.ROOM}" var="room">
                        <form action="/DatHomestay/UserBookRoomMainController" method="POST">
                            <div class="col-md-6 col-sm-12">
                                <div class="single-shop-product">
                                    <div class="product-upper">
                                        <img src="${room.roomImgLink}" class="img-thumbnail" style="width: 600px;height: 350px;" alt="${room.roomID}">
                                    </div>
                                    <h3 style="margin-top:10px"><span>Room ${room.roomID}</span></h3>
                                    <div class="product-carousel-price">
                                        <ins>Price: <span style="color: red">${room.roomPrice} </span>USD/Day</ins> 
                                    </div>
                                    <div class="product-option-shop">
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal${room.roomID}">
                                            More Info
                                        </button>
                                    </div>                       
                                </div>
                            </div>
                            <!-- MODEL TO SHOW INFO -->
                            <div id="modal${room.roomID}" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Detail Room ${room.roomID}</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="single-shop-product">
                                                <div class="product-upper">
                                                    <img src="${room.roomImgLink}" class="img-thumbnail center-block" style="width: 300px;height:175px;" alt="${room.roomID}">
                                                </div>
                                                <h3 style="margin-top:10px"><span>Room ${room.roomID}</span></h3>
                                                <div class="product-carousel-price">
                                                    <ins>Price: <span style="color: red">${room.roomPrice} </span>USD/Day</ins> 
                                                </div>
                                                <br/>
                                                <h4>Description</h4>
                                                <p>
                                                    ${room.roomDes}
                                                </p>
                                                <br/>
                                                <input type="hidden" name="txtRoomID" value="${room.roomID}"/>
                                                <input type="submit"  name="action" class="btn btn-info" value="Show Detail"/>                     
                                            </div>
                                            <!-- FORM -->

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </form>
                    </c:forEach>
                </div>
            </c:if>
        </div>
    </div>
</div>
