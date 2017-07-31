function initMap() {
  console.log('inside init map');

  var toronto = new google.maps.LatLng(43.7072,-79.4046);
  var map = new google.maps.Map(document.getElementById('map'), {
    center: toronto,
    zoom: 11
  });

  $.ajax({
    url: '/courts',
    method: 'GET',
    dataType: 'json'
  }).done(function(results) {

      for (var i = 0; i < results["courts"].length; i++) {

        var lat = Number(results["courts"][i]["lat"]);
        var long = Number(results["courts"][i]["long"]);

        if (results["courts"][i]["sport"] === "Tennis") {
          var marker = new google.maps.Marker({
            map: map,
            position: {lat: long, lng: lat},
            animation: google.maps.Animation.DROP,
            icon: '/app/assets/images/tennis.svg',
            // icon: '/tenins.svg'
            title: results["courts"][i]["name"]
            });
          }
        else if (results["courts"][i]["sport"] === "Basketball") {
          var marker = new google.maps.Marker({
            map: map,
            position: {lat: long, lng: lat},
            animation: google.maps.Animation.DROP,
            icon: 'http://maps.google.com/mapfiles/ms/icons/purple-dot.png',
            title: results["courts"][i]["name"]
          });
        }
         else {
          var marker = new google.maps.Marker({
            map: map,
            position: {lat: long, lng: lat},
            animation: google.maps.Animation.DROP,
            icon: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png',
            // icon: '/ice-skating.svg',
            title: results["courts"][i]["name"]
          });
        }

        var contentString = '<h3 id="firstHeading" class="firstHeading">Join this game!</h3>'+
        '<div id="bodyContent">'+ '<p><b>Click here</b> to join this game of ' + results["courts"][i]["sport"].toLowerCase() + ' at <br>' + results["courts"][i]["name"] + '</p></div>';

        AddInfowWindow(marker, contentString);

      };   // CLOSE LOOP

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
