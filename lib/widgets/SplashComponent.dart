import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashComponent extends StatelessWidget {
  const SplashComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 100, child: Lottie.asset('assets/a2.json')),
            SizedBox(
              height: 10,
            ),
            DefaultTextStyle(
                style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 15, 187, 206),
                    fontFamily: 'LilitaOne'),
                child: AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
                  FadeAnimatedText('TERMOMETE',
                      fadeOutBegin: 1.0, duration: Duration(milliseconds: 4000))
                ]))
          ],
        ),
      ),
    );
  }
}
