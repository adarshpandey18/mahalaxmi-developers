// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'API_KEY',
    appId: '1:999578971554:web:d1d610ba30bf00e07656fb',
    messagingSenderId: '999578971554',
    projectId: 'mahalaxmi-developer',
    authDomain: 'mahalaxmi-developer.firebaseapp.com',
    storageBucket: 'mahalaxmi-developer.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'API_KEY',
    appId: '1:999578971554:android:de49b9822acecd5d7656fb',
    messagingSenderId: '999578971554',
    projectId: 'mahalaxmi-developer',
    storageBucket: 'mahalaxmi-developer.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'API_KEY',
    appId: '1:999578971554:ios:02265a00374bbfce7656fb',
    messagingSenderId: '999578971554',
    projectId: 'mahalaxmi-developer',
    storageBucket: 'mahalaxmi-developer.firebasestorage.app',
    iosClientId: '999578971554-qj5u74cfu35ce78ipf83j44v1ulbhkpf.apps.googleusercontent.com',
    iosBundleId: 'com.example.mahalaxmiDevelopers',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'API_KEY',
    appId: '1:999578971554:ios:02265a00374bbfce7656fb',
    messagingSenderId: '999578971554',
    projectId: 'mahalaxmi-developer',
    storageBucket: 'mahalaxmi-developer.firebasestorage.app',
    iosClientId: '999578971554-qj5u74cfu35ce78ipf83j44v1ulbhkpf.apps.googleusercontent.com',
    iosBundleId: 'com.example.mahalaxmiDevelopers',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'API_KEY',
    appId: '1:999578971554:web:67fbcf4daab881b17656fb',
    messagingSenderId: '999578971554',
    projectId: 'mahalaxmi-developer',
    authDomain: 'mahalaxmi-developer.firebaseapp.com',
    storageBucket: 'mahalaxmi-developer.firebasestorage.app',
  );
}
