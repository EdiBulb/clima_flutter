
import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:flutter/material.dart';

// apiKey는 변하지 않는 값이라서 상수화
const apiKey = 'f1a9cbd27abe2b22fd966f3723a4145b';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //api 사용에 필요한 위도 경도
  late double latitude;
  late double longitude;

  // lifecycle method.
  @override
  void initState() {
    super.initState();
    getLocationData();

  }

  // return current location.
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude!;
    longitude = location.longitude!;

    // 데이터 받아오기
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
