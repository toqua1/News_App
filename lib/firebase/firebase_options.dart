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
    apiKey: 'AIzaSyDV7SpaVhO--Ms4_WdHWdeoAUQG8_Cks5k',
    appId: '1:964162108272:web:3dbd6af41344693ebdadb5',
    messagingSenderId: '964162108272',
    projectId: 'news-app-1be4e',
    authDomain: 'news-app-1be4e.firebaseapp.com',
    storageBucket: 'news-app-1be4e.appspot.com',
    measurementId: 'G-CFJX79RRLK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBuNk0z5HDgpHSSt-lAwUdeHN-zMbSMteM',
    appId: '1:964162108272:android:c7a555387d5d332dbdadb5',
    messagingSenderId: '964162108272',
    projectId: 'news-app-1be4e',
    storageBucket: 'news-app-1be4e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAkq7dXc-EXgiq4wovQDI_ZHe7-pKfZdc0',
    appId: '1:964162108272:ios:ac7209d5a6e04832bdadb5',
    messagingSenderId: '964162108272',
    projectId: 'news-app-1be4e',
    storageBucket: 'news-app-1be4e.appspot.com',
    iosBundleId: 'com.example.newsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAkq7dXc-EXgiq4wovQDI_ZHe7-pKfZdc0',
    appId: '1:964162108272:ios:ac7209d5a6e04832bdadb5',
    messagingSenderId: '964162108272',
    projectId: 'news-app-1be4e',
    storageBucket: 'news-app-1be4e.appspot.com',
    iosBundleId: 'com.example.newsApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDV7SpaVhO--Ms4_WdHWdeoAUQG8_Cks5k',
    appId: '1:964162108272:web:fdb50cd9842bd3ffbdadb5',
    messagingSenderId: '964162108272',
    projectId: 'news-app-1be4e',
    authDomain: 'news-app-1be4e.firebaseapp.com',
    storageBucket: 'news-app-1be4e.appspot.com',
    measurementId: 'G-N2F7Y22FWX',
  );
}
