import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart'; //intlインポートする
import 'intro_view.dart';

//page
// import './view/navibar.dart';

void main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  initializeDateFormatting('ja').then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // home: _isLoggedIn == true ? Navigation() : LoginPage(),
      // home: introViewSample(),
      home: FlutterOverboardPage(),
    );
  }
}
