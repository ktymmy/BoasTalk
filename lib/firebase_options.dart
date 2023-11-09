// // File generated by FlutterFire CLI.
// // ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
// import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
// import 'package:flutter/foundation.dart'
//     show defaultTargetPlatform, kIsWeb, TargetPlatform;

// /// Default [FirebaseOptions] for use with your Firebase apps.
// ///
// /// Example:
// /// ```dart
// /// import 'firebase_options.dart';
// /// // ...
// /// await Firebase.initializeApp(
// ///   options: DefaultFirebaseOptions.currentPlatform,
// /// );
// /// ```
// class DefaultFirebaseOptions {
//   static FirebaseOptions get currentPlatform {
//     if (kIsWeb) {
//       return web;
//     }
//     switch (defaultTargetPlatform) {
//       case TargetPlatform.android:
//         return android;
//       case TargetPlatform.iOS:
//         return ios;
//       case TargetPlatform.macOS:
//         return macos;
//       case TargetPlatform.windows:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions have not been configured for windows - '
//           'you can reconfigure this by running the FlutterFire CLI again.',
//         );
//       case TargetPlatform.linux:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions have not been configured for linux - '
//           'you can reconfigure this by running the FlutterFire CLI again.',
//         );
//       default:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions are not supported for this platform.',
//         );
//     }
//   }

//   static const FirebaseOptions web = FirebaseOptions(
//     apiKey: 'AIzaSyCYj1ViA7_qHO6IM65vleRLA0ak-qhlfDo',
//     appId: '1:295369572356:web:366464395f354ec7d7f551',
//     messagingSenderId: '295369572356',
//     projectId: 'boastalk-a8532',
//     authDomain: 'boastalk-a8532.firebaseapp.com',
//     storageBucket: 'boastalk-a8532.appspot.com',
//     measurementId: 'G-GDQ0M4JHBF',
//   );

//   static const FirebaseOptions android = FirebaseOptions(
//     apiKey: 'AIzaSyAYD_TfGATMUrUraP7YbK42_WVRGgpzBl0',
//     appId: '1:295369572356:android:8fb5576b205a520ed7f551',
//     messagingSenderId: '295369572356',
//     projectId: 'boastalk-a8532',
//     storageBucket: 'boastalk-a8532.appspot.com',
//   );

//   static const FirebaseOptions ios = FirebaseOptions(
//     apiKey: 'AIzaSyBFufDk7KuQthTJhav_M4MXFxTesr6ucIs',
//     appId: '1:295369572356:ios:7859d4dd39cc981ed7f551',
//     messagingSenderId: '295369572356',
//     projectId: 'boastalk-a8532',
//     storageBucket: 'boastalk-a8532.appspot.com',
//     iosBundleId: 'com.example.boastalk',
//   );

//   static const FirebaseOptions macos = FirebaseOptions(
//     apiKey: 'AIzaSyBFufDk7KuQthTJhav_M4MXFxTesr6ucIs',
//     appId: '1:295369572356:ios:a3cef6ab73c6795fd7f551',
//     messagingSenderId: '295369572356',
//     projectId: 'boastalk-a8532',
//     storageBucket: 'boastalk-a8532.appspot.com',
//     iosBundleId: 'com.example.boastalk.RunnerTests',
//   );
// }