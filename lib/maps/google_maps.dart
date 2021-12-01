import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_app/maps/maps_database.dart';

class GoogleMapsScreen extends StatefulWidget {
  int index;
  GoogleMapsScreen(this.index);
  @override
  _GoogleMapsScreenState createState() => _GoogleMapsScreenState(index);
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  int index;
  _GoogleMapsScreenState(this.index);
  maps Maps_data = maps();
  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    super.initState();
    setState(() {
      setcustommarker();
    });
  }

  void setcustommarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'images/icon.png');
  }

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(Utility.map_style);
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(Maps_data.maps_list[index].lat1,
              Maps_data.maps_list[index].long1),
          icon: mapMarker,
          infoWindow: InfoWindow(
            title: Maps_data.maps_list[index].title1,
            snippet: Maps_data.maps_list[index].snippet1,
          )));
      _markers.add(Marker(
          markerId: MarkerId('id-2'),
          position: LatLng(Maps_data.maps_list[index].lat2,
              Maps_data.maps_list[index].long2),
          icon: mapMarker,
          infoWindow: InfoWindow(
            title: Maps_data.maps_list[index].title2,
            snippet: Maps_data.maps_list[index].snippet2,
          )));
      _markers.add(Marker(
          markerId: MarkerId('id-3'),
          position: LatLng(Maps_data.maps_list[index].lat3,
              Maps_data.maps_list[index].long3),
          icon: mapMarker,
          infoWindow: InfoWindow(
            title: Maps_data.maps_list[index].title3,
            snippet: Maps_data.maps_list[index].snippet3,
          )));
      _markers.add(Marker(
          markerId: MarkerId('id-4'),
          position: LatLng(Maps_data.maps_list[index].lat4,
              Maps_data.maps_list[index].long4),
          icon: mapMarker,
          infoWindow: InfoWindow(
            title: Maps_data.maps_list[index].title4,
            snippet: Maps_data.maps_list[index].snippet4,
          )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAMOUS PLACES'),
        backgroundColor: Color(0x80657ED4),
      ),
      body: Center(
          child: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(
              Maps_data.maps_list[index].lat, Maps_data.maps_list[index].long),
          zoom: 11,
        ),
      )),
    );
  }
}

class Utility {
  static String map_style = ''' [
  {
    "featureType": "administrative.land_parcel",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.neighborhood",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.business",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  }
]
  ''';
}
