import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:termomete/services/googleSignup/google_signUp.dart';

import 'IconComponent.dart';

class BottomIconsWidget extends StatelessWidget {
  const BottomIconsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconWidget(
          name: 'ggl.svg',
          function: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogin();
          },
        ),
        SizedBox(
          width: 10,
        ),
        IconWidget(
          name: 'fb.svg',
        ),
        SizedBox(
          width: 10,
        ),
        IconWidget(
          name: 'insta.svg',
        ),
      ],
    );
  }
}
