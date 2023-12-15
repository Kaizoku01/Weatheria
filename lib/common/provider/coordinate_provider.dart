import 'package:flutter/material.dart';

class CoordinateProvider with ChangeNotifier{
  double latitude = 0.0;
  double longitude = 0.0;

  void updateCoordinates({required double lat, required double lon}){
    latitude = lat;
    longitude = lon;
    notifyListeners();
  }

}