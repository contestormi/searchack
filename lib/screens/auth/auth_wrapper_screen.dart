import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchack/screens/main/main_screen.dart';
import 'package:searchack/screens/auth/auth_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<User?>() != null
        ? const MainPage()
        : const AuthScreen();
  }
}
