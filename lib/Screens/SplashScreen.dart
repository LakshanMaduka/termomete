import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:termomete/widgets/SplashComponent.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateNext();
    super.initState();
  }

  _navigateNext() async {
    await Future.delayed(Duration(milliseconds: 3000));
    Navigator.pushReplacementNamed(context, 'login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashComponent());
  }
}
