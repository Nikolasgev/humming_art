import 'package:flutter/material.dart';
import 'package:humming_art/auth/model/sign_in_check.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHomeScreen();
  }

  _navigateToHomeScreen() async {
    await Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SignInCheck() ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('splash'),
    );
  }
}