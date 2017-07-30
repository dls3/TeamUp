function initMap() {
  console.log('inside init map');

  var toronto = new google.maps.LatLng(43.642,-79.387);
  var map = new google.maps.Map(document.getElementById('map'), {
    center: toronto,
    zoom: 11
  });

  $.ajax({
    url: 'http://localhost:3000/courts',
    method: 'GET',
    dataType: 'json',
    }).done(function(results) {
    for (var i = 0; i < results.length; i++) {
      var results = results[i];
      console.log(' 1 2 1 2 1 2 1 2 1 2 1 2 1 2')
      var marker = new google.maps.Marker({
        position: {lat: results.lat, lng: results.long},
        animation: google.maps.Animation.DROP,
        map: map,
        icon: image,
        shape: shape,
        title: results.name
      });
      var contentString = '<h3 id="firstHeading" class="firstHeading">Join this game!</h3>'+
      '<div id="bodyContent">'+ '<p><b>Click here</b> to join this tennis match at <br>' + results.name + '</p></div>';

      AddInfowWindow(marker, contentString);

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




    }
    var infowindow = new google.maps.InfoWindow({
      content: contentString
    });


  });  // Close .done function

  // Rails.root.join("assets", "lib", "tennis-15.svg")
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

}  // Close InitMap function

closeInfoWindow = function() {
  infoWindow.close();
};
