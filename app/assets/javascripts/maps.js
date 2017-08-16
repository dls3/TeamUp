
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

        var lat = Number(results["courts"][i]["latitude"]);
        var long = Number(results["courts"][i]["longitude"]);

        if (results["courts"][i]["sport"] === "Tennis") {
          var marker = new google.maps.Marker({
            map: map,
            position: {lat: lat, lng: long},
            animation: google.maps.Animation.DROP,
            icon: '/tennis-18.png',
            title: results["courts"][i]["name"]
            });
          }
        else if (results["courts"][i]["sport"] === "Basketball") {
          var marker = new google.maps.Marker({
            map: map,
            position: {lat: lat, lng: long},
            animation: google.maps.Animation.DROP,
            icon: '/basketball-18.png',
            title: results["courts"][i]["name"]
          });
        }
         else {
          var marker = new google.maps.Marker({
            map: map,
            position: {lat: lat, lng: long},
            animation: google.maps.Animation.DROP,
            icon: '/whistle-2.png',
            title: results["courts"][i]["name"]
          });
        }

        // <%= link_to "Click here", users_join_games_path %>
        var contentString = '<h3 id="firstHeading" class="firstHeading">Start a game!</h3>'+
        '<div id="bodyContent">'+ '<p><b><a href="/games/new">Click here</a></b> to start a game of ' + results["courts"][i]["sport"].toLowerCase() + ' at <br>' + results["courts"][i]["name"] + '</p></div>';

        AddInfowWindow(marker, contentString);

      };   // CLOSE LOOP

    })  // *** CLOSES DONE FUNCTION ***
    .done( function() {
      console.log("AJAX REQUEST done")
    }) // *** CLOSES DONE confirmation***
  };  // CLOSES MAIN FUNCTION ***

var infoWindows = [];   // Create empty global array

function closeAllInfoWindows() {
  // close all infowindows within the array
  for (var i = 0; i < infoWindows.length; i++) {
    infoWindows[i].close();
  }
};

function AddInfowWindow(marker, contentString) {

  var infoWindow = new google.maps.InfoWindow({
    content: contentString
  });
  infoWindows.push(infoWindow)

  google.maps.event.addListener(marker, 'click', function() {
    // console.log('Hello world');
    if (!marker.open) {
      closeAllInfoWindows();
        infoWindow.open(map,marker);
        marker.open = true;
      }
    else {
        infoWindow.close();
        marker.open = false;
    };
  });
};
