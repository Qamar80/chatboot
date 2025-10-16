import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return android; // only Android for now
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAanaKDbjJJOGnib4MPqTd_xm_rkC6QG3I',
    appId: '1:118765295365:android:d03853aeb4e6b2ce75896c',
    messagingSenderId: '118765295365',
    projectId: 'chatboot-63154',
    storageBucket: 'chatboot-63154.firebasestorage.app',
  );
}
