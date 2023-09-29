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
    apiKey: 'AIzaSyBV2YPMhDvFhQygmFgZbBDrtpyCVR0L6tM',
    appId: '1:914550410014:web:2227046043efa1e622570f',
    messagingSenderId: '914550410014',
    projectId: 'lingo-52cac',
    authDomain: 'lingo-52cac.firebaseapp.com',
    storageBucket: 'lingo-52cac.appspot.com',
    measurementId: 'G-DDN716DGJ2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC92cbFv2-6yhMFWnUBp4l-nT8V5SA5X50',
    appId: '1:914550410014:android:c243151be7e7ac0522570f',
    messagingSenderId: '914550410014',
    projectId: 'lingo-52cac',
    storageBucket: 'lingo-52cac.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6p22stvBDCBkeMooV6_-rLe1G8wbLaUA',
    appId: '1:914550410014:ios:7ea7aeff325a9e3b22570f',
    messagingSenderId: '914550410014',
    projectId: 'lingo-52cac',
    storageBucket: 'lingo-52cac.appspot.com',
    androidClientId: '914550410014-n46js6jkqkjf1vuc1kn92pe836air34p.apps.googleusercontent.com',
    iosClientId: '914550410014-rt38r85rmc26iqr9kepe9rfctt263pi2.apps.googleusercontent.com',
    iosBundleId: 'com.example.btp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6p22stvBDCBkeMooV6_-rLe1G8wbLaUA',
    appId: '1:914550410014:ios:7ea7aeff325a9e3b22570f',
    messagingSenderId: '914550410014',
    projectId: 'lingo-52cac',
    storageBucket: 'lingo-52cac.appspot.com',
    androidClientId: '914550410014-n46js6jkqkjf1vuc1kn92pe836air34p.apps.googleusercontent.com',
    iosClientId: '914550410014-rt38r85rmc26iqr9kepe9rfctt263pi2.apps.googleusercontent.com',
    iosBundleId: 'com.example.btp',
  );
}