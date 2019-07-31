import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutterpocket/src/utils/constants.dart';
import 'package:flutterpocket/src/my_flutter_app_icons.dart';
class MapExample extends StatefulWidget {
  @override
  MapSample createState() => MapSample();
}

class MapSample extends State<MapExample> {

Completer<GoogleMapController> _controller = Completer();
static const LatLng _center = const LatLng(23.022505, 72.571365);
MapType currentMap  = MapType.normal;
List<String> mapType = ['Add Marker'];
final Set<Marker> _markers = {};
LatLng _lastMapPosition = _center;

var location = new Location();

Map<String,double> userLocation ;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
   
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  void _OnCameraMove(CameraPosition position)
  {
    _lastMapPosition = position.target;
  }
  void OnMarkerButtonPressed()
  {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: "It's good",
          snippet: '2 Star'
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(Constants.ThemeColor),
        title: Text('Map'),
        actions: <Widget>[
          Theme(
              data: Theme.of(context).copyWith(
                cardColor: Color(Constants.ThemeColor),
              ),
              child: PopupMenuButton<String>(tooltip: 'change Swipe',
              icon: Icon(MyFlutterApp.dot_3,color: Color(Constants.FontColor),),
              onSelected: performMarker,
              itemBuilder: (BuildContext context){
                return mapType.map((String option){
                  return PopupMenuItem<String>(
                    value: option,
                    child: Text(option,style: TextStyle(color: Colors.white),),
                  );
                }).toList();
              },
            ),
            ),
        ],
      ),
      body: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
            mapType: currentMap,
            onCameraMove: _OnCameraMove,
            markers: _markers,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(Constants.ThemeColor),
        child: Icon(Icons.map),
        onPressed: (){
          changeMapType();
           _getLocation().then((value) {
              setState(() {
                userLocation = value;
              });
            });
        },
      ),
      
    );
  }
  changeMapType()
  {
    if(currentMap == MapType.satellite)
    {
      setState(() {
        currentMap = MapType.normal;
      });
    }
    else if(currentMap == MapType.normal)
    {
        setState(() {
        currentMap = MapType.satellite;
      });
    }
  }
  performMarker(String action)
  {
      OnMarkerButtonPressed();
  }
  Future<Map<String,double>> _getLocation() async {
    var currentLocation = <String,double>{};
    try{
      currentLocation = (await location.getLocation()) as Map<String, double>;
    }catch(e)
    {
      currentLocation = null;
    }
    return currentLocation;
  }
}