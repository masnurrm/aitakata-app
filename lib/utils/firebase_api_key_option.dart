import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirebaseOptionAPIKEY{
  static get currentPlatform{
    if (kIsWeb) {
      return dotenv.get('FIREBASE_WEB_API_KEY');
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return dotenv.get('FIREBASE_ANDROID_API_KEY');
      case TargetPlatform.iOS:
        return dotenv.get('FIREBASE_IOS_API_KEY');
      case TargetPlatform.macOS:
        return dotenv.get('FIREBASE_MACOS_API_KEY');
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
}