main() {
  String myString = 'abc';

  try {
    double myStringAsADouble = double.parse(myString);

    print(myStringAsADouble + 5);
  }
  catch(e) {
    print(e);
  }

}