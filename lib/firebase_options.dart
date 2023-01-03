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
    apiKey: 'AIzaSyBtOC4bziXHpeToL92G3CBj2B8QxrMUMl0',
    appId: '1:724442931866:web:84fbb2e7da43804338b523',
    messagingSenderId: '724442931866',
    projectId: 'chat-app-b3687',
    authDomain: 'chat-app-b3687.firebaseapp.com',
    storageBucket: 'chat-app-b3687.appspot.com',
    measurementId: 'G-JTR6DX6DSE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDndDOGixDRqx0nmFGg1II8n41Fnb8jvbo',
    appId: '1:724442931866:android:837f9de714a5e52438b523',
    messagingSenderId: '724442931866',
    projectId: 'chat-app-b3687',
    storageBucket: 'chat-app-b3687.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCljPmLumLa_rp1q5GxNCpUvUE3Lsy_s0o',
    appId: '1:724442931866:ios:f78e26ff352a9c7338b523',
    messagingSenderId: '724442931866',
    projectId: 'chat-app-b3687',
    storageBucket: 'chat-app-b3687.appspot.com',
    iosClientId: '724442931866-l9q3c1rj1q24r0t991pvhi8c11k8r290.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCljPmLumLa_rp1q5GxNCpUvUE3Lsy_s0o',
    appId: '1:724442931866:ios:f78e26ff352a9c7338b523',
    messagingSenderId: '724442931866',
    projectId: 'chat-app-b3687',
    storageBucket: 'chat-app-b3687.appspot.com',
    iosClientId: '724442931866-l9q3c1rj1q24r0t991pvhi8c11k8r290.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}
