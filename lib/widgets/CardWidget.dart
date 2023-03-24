import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  String? count;
  Color? color1, color2;
  String? title;
  CardWidget({this.count, this.title, this.color1, this.color2, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            color1!,
            color2!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: ListTile(
          title: Text(
            count!,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 60,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              title!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
