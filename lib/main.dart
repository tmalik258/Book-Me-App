import 'mainscreen.dart';
import 'login.dart';
import 'signup.dart';
import 'package:flutter/material.dart';
import 'widgets/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      initialRoute: '/splash',  // Set splash as the initial route
      routes: {
        '/splash': (context) => const SplashScreen(),  // Add splash route
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => const MainScreen(),
      },
    );
  }
}
