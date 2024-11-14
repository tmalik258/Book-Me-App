import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Booking App',
      theme: LoginTheme(
        primaryColor: Colors.blue,            // Changes the primary color
        accentColor: Colors.white,            // Changes accent color for buttons
        pageColorLight: Colors.blue[200],     // Sets the lighter part of the background gradient
        pageColorDark: Colors.blue[900],  // Sets the darker part of the background gradient
      ),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacementNamed('/home');
      },
      onRecoverPassword: _recoverPassword,
    );
  }

  Future<String?> _authUser(LoginData data) async {
    if (data.name == 'user@gmail.com' && data.password == 'password') {
      return null; // Success
    }
    return 'Username or password is incorrect';
  }

  Future<String?> _signupUser(SignupData data) async {
    return null; // Assuming signup is always successful for now
  }

  Future<String?> _recoverPassword(String name) async {
    return null; // Assuming recovery is always successful for now
  }
}
