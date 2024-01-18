import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart'; //intlインポートする

//page
import './view/navibar.dart';

void main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  initializeDateFormatting('ja').then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // home: _isLoggedIn == true ? Navigation() : LoginPage(),
      home: Navigation(),
    );
  }
}
