import 'dart:async';
import 'dart:math';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';

class AuthService {
  //Original Code
  // Login
  Future<bool> login() async {
    // Simulate a future for response after 2 second.
    return await new Future<bool>.delayed(
        new Duration(
            milliseconds: 800,
        ), () => true
    );
  }

  // Logout
  Future<void> logout() async {
    // Simulate a future for response after 1 second.
    return await new Future<void>.delayed(
        new Duration(
            milliseconds: 600,
        ),
    );
  }
}

