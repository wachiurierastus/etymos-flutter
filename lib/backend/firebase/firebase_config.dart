import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBCxpPji_J3MvQdoRT7sn_9EV3hiqp2SN0",
            authDomain: "etymos-auth.firebaseapp.com",
            projectId: "etymos-auth",
            storageBucket: "etymos-auth.appspot.com",
            messagingSenderId: "543923773093",
            appId: "1:543923773093:web:de8cc9cf7998255346374c",
            measurementId: "G-46QN06L77M"));
  } else {
    await Firebase.initializeApp();
  }
}
