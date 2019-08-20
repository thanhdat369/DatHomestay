/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function setDate()
{
    var day = new Date();
    var valueDay = day.toISOString().substr(0, 10);
    var day1 = document.getElementById("checkinDay");
    var day2 = document.getElementById("checkoutDay");
    day1.value = valueDay;
    day2.value = valueDay;
    day1.min = valueDay;
    day2.min = valueDay;
}
window.onload = function ()
{
    setDate();
}
function calculateMoney()
{
    var pricePerDay = document.getElementById("roomPrice").value;
    var day1 = document.getElementById("checkinDay").value;
    var day2 = document.getElementById("checkoutDay").value;
    var d1 = new Date(day1);
    var d2 = new Date(day2);
    if (d1 > d2)
    {
        document.getElementById("showRoomTotal").innerHTML = pricePerDay;
        document.getElementById("totalDay").innerHTML = 1;
        document.getElementById("txtTotal").value = pricePerDay;
        alert("Check in day must before check out day");
    } else
    {
        var daydiff = (d2 - d1) / (24 * 3600 * 1000) + 1;
        var total = daydiff * pricePerDay;
        document.getElementById("totalDay").innerHTML = daydiff;
        document.getElementById("showRoomTotal").innerHTML = total;
        document.getElementById("txtTotal").value = total;
    }
}
function bookingRoomAjax()
{

    var checkConfirm = confirm("Do you want to book room ? ");
    if (checkConfirm == true)
    {
        var url = "/DatHomestay/UserBookRoomMainController";
        var checkinday = "txtCheckinDay=" + document.getElementById("checkinDay").value;
        var checkoutday = "txtCheckoutDay=" + document.getElementById("checkoutDay").value;
        var d1 = new Date(checkinday);
        var d2 = new Date(checkoutday);
        if (d1 > d2)
        {
            alert("Check in day must before check out day");

        }
        else
        {
            var roomID = "txtRoomID=" + document.getElementById("roomID").value;
            var roomPrice = "txtRoomPrice=" + document.getElementById("roomPrice").value;
            var txtTotal = "txtTotal=" + document.getElementById("txtTotal").value
            var params = "action=Book" + "&" + checkinday + "&" + checkoutday + "&" + roomID + "&" + roomPrice + "&" + txtTotal;
            console.log(params);
            if (window.XMLHttpRequest) {
                // code for modern browsers
                xmlhttp = new XMLHttpRequest();
            } else {
                // code for old IE browsers
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.open("POST", url, true);
            xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//    xmlhttp.setRequestHeader("Content-length", params.length);
//    xmlhttp.setRequestHeader("Connection", "close");
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4)
                {
                    var a = xmlhttp.responseText;
                    document.getElementById("msg").innerHTML = a;
                }
            }
            xmlhttp.send(params);
        }
    }
    return false;
}
