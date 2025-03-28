import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBbdB7kv9OudpTTi0Xhmgj2u8qe52L_9pE",
            authDomain: "hoy-si-fio-7c5yyn.firebaseapp.com",
            projectId: "hoy-si-fio-7c5yyn",
            storageBucket: "hoy-si-fio-7c5yyn.firebasestorage.app",
            messagingSenderId: "977081590795",
            appId: "1:977081590795:web:278a9395a268867115930e",
            measurementId: "G-FB4R9RW580"));
  } else {
    await Firebase.initializeApp();
  }
}
