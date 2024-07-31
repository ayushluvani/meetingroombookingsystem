import 'package:flutter/material.dart';
import 'dashbord/homecreen.dart';
import 'login_screen/login.dart';
import 'login_screen/splash_screen.dart'; // Update this path to the correct one

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // try {
  //   await Firebase.initializeApp();
  //   print('Firebase initialized successfully');
  // } catch (e) {
  //   print('Error initializing Firebase: $e');
  // }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Provide PageController here
    );
  }
}
