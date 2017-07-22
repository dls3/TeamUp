function initMap() {
  console.log('inside init map');
  console.log( document.getElementById('map'));

  var toronto = new google.maps.LatLng(43.642,-79.387);

  var map = new google.maps.Map(document.getElementById('map'), {
    center: toronto,
    zoom: 11
  });

  createMarkers(map);
}

  var courts = [
    ['Beaches Park', 43.66616962,-79.29970757, 4],
    ["Hanlan's Point Park", 43.61994414, -79.39161271, 5],
    ['Malvern Park', 43.80901631, -79.21793821, 3],
    ['Oriole Park', 43.6969922, -79.39928015, 2],
    ['Rosedale Park', 43.68304016, -79.380109, 1],
    ['Shawnee Park', 43.79754498, -79.33870752, 6]
  ];

  // service = new google.maps.places.PlacesService(map);
  // service.nearbySearch(request, callback);
// };


function createMarkers(map) {
  // Adds markers to the map.

  // Marker sizes are expressed as a Size of X,Y where the origin of the image
  // (0,0) is located in the top left of the image.

  // Origins, anchor positions and coordinates of the marker increase in the X
  // direction to the right and in the Y direction down.

  var contentString = '<div id="content">'+
  '<div id="siteNotice">'+
  '</div>'+
  '<h1 id="firstHeading" class="firstHeading">Join this game!</h1>'+
  '<div id="bodyContent">'+ '<p><b>Click here</b> to join this tennis match' +
  '</div>'+
  '</div>';

  var infowindow = new google.maps.InfoWindow({
    content: contentString
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
  for (var i = 0; i < courts.length; i++) {
    var court = courts[i];
    var marker = new google.maps.Marker({
      position: {lat: court[1], lng: court[2]},
      animation: google.maps.Animation.BOUNCE,
      map: map,
      icon: image,
      shape: shape,
      title: court[0],
      zIndex: court[3]
    });
    marker.addListener('click', function() {
      infowindow.open(map, marker);
    });
  };
};
