import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:humming_art/Gallery/gallery_screen.dart';
import 'package:humming_art/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: SplashScreen(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}