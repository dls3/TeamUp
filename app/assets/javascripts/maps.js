function initMap() {
  console.log('inside init map');
  console.log( document.getElementById('map'));

  var toronto = new google.maps.LatLng(43.642,-79.387);
  var map = new google.maps.Map(document.getElementById('map'), {
    center: toronto,
    zoom: 11
  });

  $.ajax({
    url: '/courts',
    method: 'GET',
    dataType: 'json'
  }).done(function(results) {
      // console.log(results["courts"].length);

      for (var i = 0; i < results["courts"].length; i++) {
        console.log("INSIDE LOOP")

        var results = JSON.parse(results)
        console.log(results)
        var marker = new google.maps.Marker({
          position: {lat: results["courts"]["lat"], lng: results["courts"]["long"]},
          animation: google.maps.Animation.DROP,
          map: map,
          icon: image,
          shape: shape,
          title: results["courts"]["name"]
        });
        var contentString = '<h3 id="firstHeading" class="firstHeading">Join this game!</h3>'+
        '<div id="bodyContent">'+ '<p><b>Click here</b> to join this tennis match at <br>' + results["courts"]["name"] + '</p></div>';

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
