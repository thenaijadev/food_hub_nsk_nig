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
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDV0udFCRMeG7fbGIoLwYE-98GXfyg6hzI',
    appId: '1:338883630983:web:f4de04459c304e9bca2522',
    messagingSenderId: '338883630983',
    projectId: 'food-hub-4bb32',
    authDomain: 'food-hub-4bb32.firebaseapp.com',
    storageBucket: 'food-hub-4bb32.appspot.com',
    measurementId: 'G-F70WJDRWG7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpdH5KxmNszWuxDSIYtO5SWu-oLK-unkI',
    appId: '1:338883630983:android:a022cf36c723c219ca2522',
    messagingSenderId: '338883630983',
    projectId: 'food-hub-4bb32',
    storageBucket: 'food-hub-4bb32.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwKVflkOvdbrbZd8rZki3RLmGRc0wsUEE',
    appId: '1:338883630983:ios:5efd184184afe88fca2522',
    messagingSenderId: '338883630983',
    projectId: 'food-hub-4bb32',
    storageBucket: 'food-hub-4bb32.appspot.com',
    iosBundleId: 'com.example.theFoodHubNskNig',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwKVflkOvdbrbZd8rZki3RLmGRc0wsUEE',
    appId: '1:338883630983:ios:2a07d92aa3794799ca2522',
    messagingSenderId: '338883630983',
    projectId: 'food-hub-4bb32',
    storageBucket: 'food-hub-4bb32.appspot.com',
    iosBundleId: 'com.example.theFoodHubNskNig.RunnerTests',
  );
}
