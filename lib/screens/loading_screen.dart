import 'package:clima_flutter/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // lifecycle method.
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  // return current location.
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }


  void somethingThatExpectsLessThan10(int n) {
    if (n > 10) {
      throw 'n is greater than 10, n should always be less than 10.';
    }
  }

  @override
  Widget build(BuildContext context) {
    String myMargin = '15';
    double? myMarginAsADouble;

    try {
      myMarginAsADouble = double.parse(myMargin);
    } catch (e) {
      print(e);
      // myMarginAsADouble = 30.0;
    }
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(myMarginAsADouble ?? 30.0),
        color: Colors.red,
      ),
    );
  }
}
