import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconWidget extends StatelessWidget {
  String? name;
  Function()? function;
  IconWidget({super.key, this.name,this.function});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0xffdfe1e6)),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)
            ]),
        child: GestureDetector(
          child: SvgPicture.asset(
            'assets/images/${name}',
            height: 20,
          ),
          onTap: function,
        ),
      ),
    );
  }
}
