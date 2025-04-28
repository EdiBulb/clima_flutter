import 'package:clima_flutter/screens/location_screen.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// apiKey는 변하지 않는 값이라서 상수화
const apiKey = 'f1a9cbd27abe2b22fd966f3723a4145b';

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
    try {
      // 현재 위치 받아오기
      Location location = Location();
      await location.getCurrentLocation();

      // 네트워크 요청
      NetworkHelper networkHelper = NetworkHelper(
          'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

      var weatherData = await networkHelper.getData();

      // LocationScreen으로 이동
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return LocationScreen(locationWeather: weatherData);
          },
        ),
      );

    } catch (e) {
      print(e);
    }
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
