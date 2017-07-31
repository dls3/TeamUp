function initMap() {
  console.log('inside init map');
  console.log( document.getElementById('map'));

  var toronto = new google.maps.LatLng(43.642,-79.387);
  var map = new google.maps.Map(document.getElementById('map'), {
    center: toronto,
    zoom: 12
  });

  var image = {
    url: 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png',
    // This marker is 20 pixels wide by 32 pixels high.
    size: new google.maps.Size(20, 32),
    // The origin for this image is (0, 0).
    origin: new google.maps.Point(0, 0),
    // The anchor for this image is the base of the flagpole at (0, 32).
    anchor: new google.maps.Point(0, 32)
  };
  // Shapes define the clickable region of the icon. The type defines an HTML
  // <area> element 'poly' which traces out a polygon as a series of X,Y points.
  // The final coordinate closes the poly by connecting to the first coordinate.
  var shape = {
    coords: [1, 1, 1, 20, 18, 20, 18, 1],
    type: 'poly'
  };

  $.ajax({
    url: '/courts',
    method: 'GET',
    dataType: 'json'
  }).done(function(results) {

      for (var i = 0; i < results["courts"].length; i++) {

        var lat = Number(results["courts"][i]["lat"]);
        var long = Number(results["courts"][i]["long"]);

        // var myLatLng = {lat: Number(results["courts"][i]["lat"]), lng: Number(results["courts"][i]["long"]);

        var marker = new google.maps.Marker({
          map: map,
          // position: {lat: Number(results["courts"][i]["lat"]), lng: Number(results["courts"][i]["long"])},
          position: {lat: long, lng: lat},
          animation: google.maps.Animation.DROP,
          icon: image,
          shape: shape,
          title: results["courts"][i]["name"]
        });
        var contentString = '<h3 id="firstHeading" class="firstHeading">Join this game!</h3>'+
        '<div id="bodyContent">'+ '<p><b>Click here</b> to join this game of ' + results["courts"][i]["sport"] + ' at <br>' + results["courts"][i]["name"] + '</p></div>';

        AddInfowWindow(marker, contentString);

      }   // CLOSE LOOP

    })  // *** CLOSES DONE FUNCTION ***
    .done( function() {
      console.log("AJAX REQUEST done")
    }) // *** CLOSES DONE ***
  };  // CLOSES MAIN FUNCTION ***

closeInfoWindow = function() {
  infoWindow.close();
};

function AddInfowWindow(marker, contentString) {

  var infoWindow = new google.maps.InfoWindow({
    content: contentString
  });
  google.maps.event.addListener(marker, 'click', function() {
    if (!marker.open) {
        infoWindow.open(map,marker);
        marker.open = true;
    }
    else {
        infoWindow.close();
        marker.open = false;
    };
  });
};
