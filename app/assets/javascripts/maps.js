function initMap() {
  console.log('inside init map');

  var toronto = new google.maps.LatLng(43.642,-79.387);
  var map = new google.maps.Map(document.getElementById('map'), {
    center: toronto,
    zoom: 11
  });


  var courts = [
    ["Marilyn Bell Park Tennis Courts", 43.6308, -79.4331, 10],
    ["Lakeshore Boulebard Parklands Tennis Courts", 43.6336196, -79.43823951, 9],
    ["Jonathan Ashbridge Park", 43.66479575,-79.32022022,	8],
    ["Humber Valley Park Tennis Courts",	43.66432332, -79.52479819, 7],
    ["Hillcrest Park Tennis Courts", 43.67600872, -79.42386171, 6],
    ["Hanlan's Point Park Tennis Courts", 43.61994414, -79.39161271, 5],
    ["Beaches Park Tennis Courts", 43.66616962,-79.29970757, 4],
    ["Westmount Park Tennis Courts", 43.68744812, -79.51912878, 3],
    ["Oriole Park Tennis Courts", 43.6969922, -79.39928015, 2],
    ["Rosedale Park Tennis Courts", 43.68304016, -79.380109, 1]
  ];

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

  for (var i = 0; i < courts.length; i++) {
    var court = courts[i];

    var marker = new google.maps.Marker({
      position: {lat: court[1], lng: court[2]},
      animation: google.maps.Animation.DROP,
      map: map,
      icon: image,
      shape: shape,
      title: court[0],
      zIndex: court[3]
    });
    var contentString = '<h3 id="firstHeading" class="firstHeading">Join this game!</h3>'+
    '<div id="bodyContent">'+ '<p><b><a href="http://localhost:3000/users/profile"' + '>Click Here</a></b> to join this tennis match at <br>' + court[0] + '</p></div>';

    AddInfowWindow(marker, contentString);
  }
}

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
