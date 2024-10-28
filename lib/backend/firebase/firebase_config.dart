import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDIrdaJe2qJf46AXKsf8DeBmIJXdaJOeag",
            authDomain: "socios-zd1338.firebaseapp.com",
            projectId: "socios-zd1338",
            storageBucket: "socios-zd1338.appspot.com",
            messagingSenderId: "251553304452",
            appId: "1:251553304452:web:a5109dcd2b40fd001257d1"));
  } else {
    await Firebase.initializeApp();
  }
}
