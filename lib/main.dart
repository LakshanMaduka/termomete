import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:termomete/Components/SplashComponent.dart';
import 'package:termomete/Screens/RegisterScreen.dart';
import 'package:termomete/Screens/SplashScreen.dart';
import 'package:termomete/Screens/LoginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Termomate',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => AnimatedSplashScreen(
              splash: SplashComponent(),
              nextScreen: LoginScreen(),
              splashIconSize: 300,
              duration: 3000,
              splashTransition: SplashTransition.fadeTransition),
          'login': (context) => LoginScreen(),
          'register': (context) => RegisterScreen()
        });
  }
}
