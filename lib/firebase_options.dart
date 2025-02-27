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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCBP6Z9XufcPT1itP3npk6i0XRa9Eq5ac0',
    appId: '1:350133867060:web:595e792c0bec93ef477061',
    messagingSenderId: '350133867060',
    projectId: 'taskapp-59439',
    authDomain: 'taskapp-59439.firebaseapp.com',
    storageBucket: 'taskapp-59439.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfloqn_iRkq-IgAXabtDH0P8aSYnmGGUc',
    appId: '1:350133867060:android:65c6cd788d8bfb5e477061',
    messagingSenderId: '350133867060',
    projectId: 'taskapp-59439',
    storageBucket: 'taskapp-59439.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArvEKkXfYX8iBdySX4GV53NyhrFCnG4rs',
    appId: '1:350133867060:ios:78c4c17c7e088f0a477061',
    messagingSenderId: '350133867060',
    projectId: 'taskapp-59439',
    storageBucket: 'taskapp-59439.firebasestorage.app',
    iosBundleId: 'com.example.taskApp',
  );
}
