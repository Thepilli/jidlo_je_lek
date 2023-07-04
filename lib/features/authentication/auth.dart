import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacionar_app/features/authentication/login_or_register.dart';
import 'package:stacionar_app/features/core/home_page/home_page_navigation.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return const HomePageNavigator();
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
