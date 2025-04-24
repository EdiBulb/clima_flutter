void normalFunction() {
  print('함수 시작');
  print('함수 끝');
}
Future<String> orderPizza() async{
  await Future.delayed(Duration(seconds: 3));
  return '페퍼로니 피자';
}

void main() async {
  // normalFunction();
  // print('쇼핑 시작');
  // await futureFunction();
  // print('쇼핑 끝');

  print('피자 주문...');
  String pizza = await orderPizza();
  print('받은 피자: $pizza');
}

Future<void> futureFunction() async {
  print('택배 주문 완료');

  await Future.delayed(Duration(seconds: 2));
  print('택배 도착!');
}


