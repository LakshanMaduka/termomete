import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:termomete/widgets/CardWidget.dart';

import '../widgets/TempretureMeter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    String dropdownvalue = '';
    var items = ['LogOut'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Termomete'),
        actions: [
          DropdownButton(
              items: [
                DropdownMenuItem(
                  child: Container(
                    child: Row(
                        children: [Icon(Icons.exit_to_app), Text('LogOut')]),
                  ),
                  value: 'logout',
                )
              ],
              icon: Icon(Icons.more_vert),
              onChanged: (itemIdenti) {
                if (itemIdenti == 'logout') {
                  FirebaseAuth.instance.signOut();
                }
              })
        ],
      ),
      body: Scaffold(
          body: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Expanded(
                child: CardWidget(
                  count: '22\u00B0',
                  color1: Color.fromARGB(255, 7, 197, 48),
                  color2: Color.fromARGB(255, 30, 113, 238),
                  title: 'Current \n Temperature',
                ),
              ),
              Expanded(
                child: CardWidget(
                  count: '80%',
                  color1: Color.fromARGB(255, 7, 197, 48),
                  color2: Color.fromARGB(255, 30, 113, 238),
                  title: 'Current \n Humidity',
                ),
              ),
            ],
          ),
          MiddleCard(),
          TempretureMeter(),
        ],
      ))),
    );
  }
}

class MiddleCard extends StatelessWidget {
  const MiddleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 7, 197, 48),
              Color.fromARGB(255, 30, 113, 238),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: ListTile(
            title: Text(
              "Good",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "Current Temprature is good!",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
