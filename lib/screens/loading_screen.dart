import 'package:clima_flutter/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima_flutter/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getLocationData();  // 그냥 호출만, await이나 return 없이
    });
  }

  // 현재 위치를 받아오고 날씨 데이터를 가져오는 함수
  void getLocationData() async {
    // create object
    var weatherData = await WeatherModel().getLocationWeather(); // Future 결과값을 사용할거라 await을 붙임


      // LocationScreen으로 이동
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return LocationScreen(locationWeather: weatherData);
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // 로딩 화면
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
