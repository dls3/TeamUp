
function initMap() {
  var toronto = new google.maps.LatLng(43.6629,-79.3957);
  var map = new google.maps.Map(document.getElementById('map'), {
    center: toronto,
    zoom: 12,
    mapTypeId: 'satellite'
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
            icon: '/tennis-18.png',
            title: results["courts"][i]["name"]
            });
          }
        else if (results["courts"][i]["sport"] === "Basketball") {
          var marker = new google.maps.Marker({
            map: map,
            position: {lat: long, lng: lat},
            animation: google.maps.Animation.DROP,
            icon: '/basketball-18.png',
            title: results["courts"][i]["name"]
          });
        }
         else {
          var marker = new google.maps.Marker({
            map: map,
            position: {lat: long, lng: lat},
            animation: google.maps.Animation.DROP,
            icon: '/whistle-18.png',
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
