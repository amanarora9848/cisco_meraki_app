import 'home.page.dart';
import 'login.page.dart';
import 'auth.service.dart';
import 'package:flutter/material.dart';
import 'eval.dart';

AuthService appAuth = new AuthService();

void main() async {
  // Set default home.
  Widget _defaultHome = new Login();
  // Get result of the login function.
  bool _result = await appAuth.login();
  if (_result) {
    _defaultHome = new MyApp();
  }
  // Run app!
  runApp(new MaterialApp(
    title: 'App',
    home: _defaultHome,
    routes: <String, WidgetBuilder>{
      // Set routes for using the Navigator.
      '/home': (BuildContext context) => new MyApp(),
      '/login': (BuildContext context) => new Login(),
      '/EvalPage1': (BuildContext context) => new EvalPage(),
    },
  ));
}