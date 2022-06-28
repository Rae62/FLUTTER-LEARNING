import 'dart:async';
// Futures = Promesse

Future getData() {
  throw Exception('F... React Native');
  return Future.value('I love flutter');
}

main() async {
  try {
    var data = await getData();
    print(data);
  } catch (e) {
    print(e);
  }

  // Future<String> test = Future<String>.delayed(Duration(seconds: 3), () {
  //   throw Exception('Marche po');
  //   // return 'This is the voice !';
  // });

  // test.then((String value) {
  //   print(value);
  // }).catchError((err) {
  //   print(err);
  // });

  // print('waiting room');
}
