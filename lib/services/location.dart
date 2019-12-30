import 'package:geolocator/geolocator.dart'; 

class Location{
  double lat;
  double lng;

  Location({this.lat, this.lng});

  Future<void> getLocation() async {
    try{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      lat = position.latitude;
      lng = position.longitude;
      print("Lat is $lat");
      print("Lng is $lng");
    }
    catch(e) {
      print(e);
    }
    
  }

}