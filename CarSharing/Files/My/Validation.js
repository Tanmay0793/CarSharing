
// ***************************************************************************//
//              Validation for Sign UP                                       //
//**************************************************************************//
$(document).ready(function () {
    $("#phone").focusout(function () {
        $("#lblphone").text("");
        var phone = $("#phone").val();
        if (phone.length < 10 || phone.length>10) {
            $("#lblphone").text("Should be 10 digits...");
            $("#phone").focus();
        }
    });

    $("#pass").focusout(function () {
        $("#lblpass").text("");
        var pass = $("#pass").val();
        if (pass.length < 5) {
            $("#lblpass").text("Password Should be more than 5 digits...");
            $("#pass").focus();
        }
    });

    $("#repass").focusout(function () {
        $("#lblrpass").text("");
        var rpass = $("#repass").val();
        if (rpass.length < 5) {
            $("#lblrpass").text("Password Should be more than 5 digits...");
            $("#repass").focus();
        }
    });

    //***************************************************************************//
    //          Validation for Registartion                                     //
    //************************************************************************//

    $("#txtname").focusout(function () {
        $("#lblname").text("");
        var name = $("#txtname").val();
        var pat = /[a-zA-Z]/g;
        if (!(pat.test(name))) {
            $("#lblname").text("Enter only alphabet...");
            $("#txtname").focus();
        }
    });

    $("#txtxphone").focusout(function () {
        $("#lblphone").text("");
        var phone = $("#txtxphone").val();
        var pat = /[0-9]/g;
        if ((!(pat.test(phone))) || ((phone.length < 10 || phone.length > 10))) {
            if (!(pat.test(phone))) {
                $("#lblphone").text("Enter only Numbers...");
                $("#txtxphone").focus();
            }
            else {
                $("#lblphone").text("Number Should be 10 digit...");
                $("#txtxphone").focus();
            }
        }

    });

    $("#txtemail").focusout(function () {
        $("#lblemail").text("");
        var email = $("txtemail").val();
        var pat = /[a-z]/g;
        if (!pat.test(email)) {
            $("#lblemail").text("Provide correct email...");
            $("#txtemail").focus();
        }
    });

    $("#btnSave").click(function () {
        var username = $("#txtuname").val();
        var name = $("#txtname").val();
        var address = $("#txtaddress").val();
        var phone = $("#txtxphone").val();
        var email = $("#txtemail").val();
        var car = $("#txtcar").val();
        
        if (username != "" && name != "" && address != "" && phone != "" && email != "" && car != "") {
            $("#hidden").val("hello");
        }
        else {
            alert("Please Fill data...");
        
        }

    });


    /***********************************************************


    var from;
    var to;

    google.maps.event.addDomListener(window, 'load', function () {
        var places = new google.maps.places.Autocomplete(document.getElementById('txtfrom'));
        var toplace = new google.maps.places.Autocomplete(document.getElementById('txtto'));

        google.maps.event.addListener(places, 'place_changed', function () {
            var place = places.getPlace();
            var address = place.formatted_address;
            var latitude = place.geometry.location.lat();
            var longitude = place.geometry.location.lng();
            var mesg = "From Address: " + address;
            mesg += "\nFrom Latitude: " + latitude;
            mesg += "\nFrom Longitude: " + longitude;
            from = mesg;
        });
        google.maps.event.addListener(toplace, 'place_changed', function () {
            var place = toplace.getPlace();
            var address = place.formatted_address;
            var latitude = place.geometry.location.lat();
            var longitude = place.geometry.location.lng();
            var mesg = "\n\n\nTo Address: " + address;
            mesg += "\nTo Latitude: " + latitude;
            mesg += "\nTo Longitude: " + longitude;
            to = mesg;
        });

        $("#btnsubmit").click(function () {

            alert("From :" + from + "To :" + to);
        });
    });

    ****************************************************************/

    /************************************************************
    //              Get Map
    //************************************************************
    

    var source, destination;
        var directionsDisplay;
        var directionsService = new google.maps.DirectionsService();
        google.maps.event.addDomListener(window, 'load', function () {
            new google.maps.places.Autocomplete(document.getElementById('txtfrom'));
            new google.maps.places.Autocomplete(document.getElementById('txtto'));
            directionsDisplay = new google.maps.DirectionsRenderer({ 'draggable': true });
        });

        
        function getValue()
        {
            var mumbai = new google.maps.LatLng(18.9750, 72.8258);
            var mapOptions = {
                zoom: 7,
                center: mumbai
            };
            map = new google.maps.Map(document.getElementById('dvMap'), mapOptions);
            directionsDisplay.setMap(map);



        source = document.getElementById("txtfrom").value;
        destination = document.getElementById("txtto").value;

        var request = {
            origin: source,
            destination: destination,
            travelMode: google.maps.TravelMode.DRIVING
        };
        directionsService.route(request, function (response, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                directionsDisplay.setDirections(response);
            }
        });


        var service = new google.maps.DistanceMatrixService();
        service.getDistanceMatrix({
            origins: [source],
            destinations: [destination],
            travelMode: google.maps.TravelMode.DRIVING,
            unitSystem: google.maps.UnitSystem.METRIC,
            avoidHighways: false,
            avoidTolls: false
        }, function (response, status) {
            if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status != "ZERO_RESULTS") {

            } else {
            alert("Unable to find the distance via road.");
            }
        });


            return false;
        }

            function getVal() {
                alert();
                PageMethods.setValue(source, destination, onSucceed, onError);

                return false;
            }

            function onSucceed(result) {
                alert(result);
            }

            function onError(result) {
                alert("Error :" + result.error_getmessage());
            }


    *************************************************************/


});

// ********************************************************************************//