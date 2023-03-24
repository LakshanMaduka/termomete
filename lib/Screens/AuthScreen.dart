import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:termomete/Screens/MainScreen.dart';

import '../widgets/BottomIconWidget.dart';
import '../widgets/FormWidget.dart';
import '../widgets/IconComponent.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLogin = true;
  @override
  Widget build(BuildContext context) {
    final md = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'TERMOMETE',
                  style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 30, 113, 238),
                      fontFamily: 'LilitaOne'),
                ),
                Container(
                  height: md.height * 0.3,
                  width: double.infinity,
                  child: _isLogin
                      ? Lottie.asset('assets/login2.json')
                      : Lottie.asset('assets/register.json'),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Text(
                          _isLogin ? "Login" : "Register",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.roboto(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FormWidget(isLogin: _isLogin ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(child: Divider()),
                          Text(
                            _isLogin
                                ? "Or Login with..."
                                : 'Or Register with...',
                            style: TextStyle(color: Color(0xff727e93)),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BottomIconsWidget(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _isLogin
                                ? "New to Termomete?"
                                : "Already a member?",
                            style: TextStyle(color: Color(0xff727e93)),
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              child: Text(_isLogin ? "Register" : "Login"))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
