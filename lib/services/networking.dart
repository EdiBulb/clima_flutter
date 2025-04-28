import 'dart:convert'; // json 관련
import 'package:http/http.dart' as http;

class NetworkHelper {

  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    // await으로 기다려서 받는다.

    http.Response response = await http.get(
        Uri.parse(url)); // 현재 위치로 입력

    // 반응이 있으면 데이터를 가져온다.
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);//데이터 가져옴, 어떤 데이터가 올지 모르기 때문에 var를 쓴다.

    } else {
      print(response.statusCode);
    }
  }
}