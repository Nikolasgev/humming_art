import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:humming_art/profile_page.dart';
import 'auth_page.dart';



class SignInCheck extends StatelessWidget {
  const SignInCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const ProfilePage();
          } else {
            return const AuthPage();
          }
        }
        ),
    );
  }
}