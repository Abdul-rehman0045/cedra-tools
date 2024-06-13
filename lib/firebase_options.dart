import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;

      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD_S1RUP90teFywxtQHpDxjAOqm--txxRk',
    appId: '1:621290493494:android:d297bb0edd5d60561c6a97',
    messagingSenderId: '621290493494',
    projectId: 'cedratools-app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_S1RUP90teFywxtQHpDxjAOqm--txxRk',
    appId: '1:621290493494:ios:5c224022c46a28e71c6a97',
    messagingSenderId: '621290493494',
    projectId: 'cedratools-app',
    iosBundleId: 'com.cedratools',
  );
}
