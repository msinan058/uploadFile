// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCmdz9wreyYQfJ_NZO1BqoQhcLxnqqI3Qc',
    appId: '1:571939453273:web:663c7cc4f1ffb49c7a3448',
    messagingSenderId: '571939453273',
    projectId: 'flutter-upload-4e831',
    authDomain: 'flutter-upload-4e831.firebaseapp.com',
    storageBucket: 'flutter-upload-4e831.appspot.com',
    measurementId: 'G-BWVE0BQBJ9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYG2G2vnOzxJR-RRjSx3KD8jmDPivofoY',
    appId: '1:571939453273:android:95aff8fb44b90be97a3448',
    messagingSenderId: '571939453273',
    projectId: 'flutter-upload-4e831',
    storageBucket: 'flutter-upload-4e831.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBkaIHGYnX0I-oM_tpwr5MNkAAmU3dr-go',
    appId: '1:571939453273:ios:6be2d52fedafd3c07a3448',
    messagingSenderId: '571939453273',
    projectId: 'flutter-upload-4e831',
    storageBucket: 'flutter-upload-4e831.appspot.com',
    iosClientId: '571939453273-nhmrelr6hkdi5c6c7gg8j08eqdrukt87.apps.googleusercontent.com',
    iosBundleId: 'com.example.uploadapp',
  );
}
