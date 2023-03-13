import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../Components/IconComponent.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final md = MediaQuery.of(context).size;
    return Scaffold(
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
                child: Lottie.asset('assets/register.json'),
              ),
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Text(
                        "Register",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.roboto(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Email ID',
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Icon(Icons.alternate_email),
                          )),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Icon(Icons.lock_outline_rounded),
                          )),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Icon(Icons.lock_person_outlined),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Register'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 30, 113, 238),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: Size(double.infinity, md.height * 0.06)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Text(
                          'Or Register with...',
                          style: TextStyle(color: Color(0xff727e93)),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconWidget(
                          name: 'ggl.svg',
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already a member?",
                          style: TextStyle(color: Color(0xff727e93)),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('login');
                            },
                            child: Text("Login"))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
