// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Firstw extends StatefulWidget {
  const Firstw({super.key});

  @override
  _FirstwState createState() => _FirstwState();
}

class _FirstwState extends State<Firstw> {
  late SharedPreferences prefs;
  late int badCounter = 0;
  late int okayCounter = 0;
  late int goodCounter = 0;

  @override
  void initState() {
    super.initState();
    initializeCounters();
  }

  Future<void> initializeCounters() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      badCounter = prefs.getInt('badCounter') ?? 0;
      okayCounter = prefs.getInt('okayCounter') ?? 0;
      goodCounter = prefs.getInt('goodCounter') ?? 0;
    });
  }

  Future<void> updateCounter(String counterKey) async {
    int counterValue = prefs.getInt(counterKey) ?? 0;
    counterValue++;
    prefs.setInt(counterKey, counterValue);
    setState(() {
      if (counterKey == 'badCounter') {
        badCounter = counterValue;
      } else if (counterKey == 'okayCounter') {
        okayCounter = counterValue;
      } else if (counterKey == 'goodCounter') {
        goodCounter = counterValue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Center(
        child: Transform.translate(
          offset: Offset(0, -50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/bad');
                  updateCounter('badCounter');
                },
                child: _buildButtonContainer(
                  Colors.red,
                  "Bad",
                  badCounter.toString(),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/okay');
                  updateCounter('okayCounter');
                },
                child: _buildButtonContainer(
                  Colors.yellow,
                  "Okay",
                  okayCounter.toString(),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/good');
                  updateCounter('goodCounter');
                },
                child: _buildButtonContainer(
                  Colors.green,
                  "Good",
                  goodCounter.toString(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonContainer(Color color, String text, String counter) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
      ),
      width: 100,
      height: 100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Count: $counter",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
