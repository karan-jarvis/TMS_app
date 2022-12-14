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
    apiKey: 'AIzaSyC0lUKZcNWgKxEQQTCpYi8soryXdHWGTU4',
    appId: '1:706833710872:web:b1a9bb4cd96184481f686d',
    messagingSenderId: '706833710872',
    projectId: 'teammangementsystem',
    authDomain: 'teammangementsystem.firebaseapp.com',
    databaseURL: 'https://teammangementsystem-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'teammangementsystem.appspot.com',
    measurementId: 'G-52R50GKHQG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFbiloxnO3ukNU7pok-GStb_CZeYZHOws',
    appId: '1:706833710872:android:f8bba8be654e8e6f1f686d',
    messagingSenderId: '706833710872',
    projectId: 'teammangementsystem',
    databaseURL: 'https://teammangementsystem-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'teammangementsystem.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArFr7_zp2mMJparXtnUH_D3k5YLSKQT2Y',
    appId: '1:706833710872:ios:cafeab12f6d58c751f686d',
    messagingSenderId: '706833710872',
    projectId: 'teammangementsystem',
    databaseURL: 'https://teammangementsystem-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'teammangementsystem.appspot.com',
    androidClientId: '706833710872-650l00kaeibdovtp4m0le4tb4ogrln7n.apps.googleusercontent.com',
    iosClientId: '706833710872-u6t8k8bgh9vca5chpr15hlkvqa9fj4u3.apps.googleusercontent.com',
    iosBundleId: 'com.tms.app.tmsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyArFr7_zp2mMJparXtnUH_D3k5YLSKQT2Y',
    appId: '1:706833710872:ios:cafeab12f6d58c751f686d',
    messagingSenderId: '706833710872',
    projectId: 'teammangementsystem',
    databaseURL: 'https://teammangementsystem-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'teammangementsystem.appspot.com',
    androidClientId: '706833710872-650l00kaeibdovtp4m0le4tb4ogrln7n.apps.googleusercontent.com',
    iosClientId: '706833710872-u6t8k8bgh9vca5chpr15hlkvqa9fj4u3.apps.googleusercontent.com',
    iosBundleId: 'com.tms.app.tmsApp',
  );
}
