//import 'package:books_connect/Screens/Page/signin.dart';
import 'package:books_connect/Screens/signinscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyArS8nQXxUp14qVZE9HPtTp2oUkzNZIvRc",
      //authDomain: "your_auth_domain",
      projectId: "booksconnect-834a5",
      storageBucket: "booksconnect-834a5.appspot.com",
      messagingSenderId: "928203689795",
      appId: "1:928203689795:android:5475f448461c0e133469f6",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SigninScreen(), // Set the SignupScreen as the initial page
    );
  }
}
