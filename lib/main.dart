import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';

void main() {
  runApp(LeaseMateApp());
}

class LeaseMateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LeaseMate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegistrationScreen(),
      },
      debugShowCheckedModeBanner: false, // Remove debug banner
    );
  }
}
