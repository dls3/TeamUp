var map;
var service;
var infowindow;

function initMap() {
  console.log('inside init map');
  console.log( document.getElementById('map'));

  var toronto = new google.maps.LatLng(43.642,-79.387);

  map = new google.maps.Map(document.getElementById('map'), {
    center: toronto,
    zoom: 12
  });

  var request = {
    location: toronto,
    radius: 1000,    // radius in meters
    type: ['stadium']
  };

  service = new google.maps.places.PlacesService(map);
  service.nearbySearch(request, callback);
};

function callback(results, status) {
  if (status === google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      createMarker(results[i]);
    };
  };
};

function createMarker(place) {
  var placeLoc = place.geometry.location;
  var marker = new google.maps.Marker({
    map: map,
    position: place.geometry.location
  });

  google.maps.event.addListener(marker, 'click', function() {
    infowindow.setContent(place.name);
    infowindow.open(map, this);
  });
};

if( document.readyState === 'complete' ) {
    console.log( 'document is already ready, just execute code here' );
    myInitCode();
} else {
    document.addEventListener('DOMContentLoaded', function () {
        console.log( 'document was not ready, place code here' );
        myInitCode();
    });
}
