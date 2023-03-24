import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:termomete/Screens/HomeScreen.dart';
import 'package:termomete/Screens/MainScreen.dart';
import 'package:termomete/services/email/email_signup.dart';
import 'package:termomete/services/googleSignup/google_signUp.dart';
import 'package:termomete/widgets/SplashComponent.dart';
import 'package:termomete/Screens/AuthScreen.dart';
import 'package:termomete/Screens/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
        ChangeNotifierProvider(create: (context) => EmailSignUp()),
      ],
      child: MaterialApp(
          title: 'Termomate',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => AnimatedSplashScreen(
                splash: SplashComponent(),
                nextScreen: HomePage(),
                splashIconSize: 300,
                duration: 3000,
                splashTransition: SplashTransition.fadeTransition),
            'auth': (context) => AuthScreen(),
            'main': (context) => MainScreen()
          }),
    );
  }
}
