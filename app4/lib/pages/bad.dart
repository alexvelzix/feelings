// ignore_for_file: prefer_const_constructors

import 'package:app4/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bad extends StatelessWidget {
  final SharedPreferences prefs;
  
  const Bad({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    int badCounter = prefs.getInt('badCounter') ?? 0;

    return Scaffold(
      body: Column(
        children: [
          Transform.translate(
            offset: Offset(0, 50),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text(
                    "You have felt bad ",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Bad Counter: $badCounter",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Center(
                child: Text(
                  "That is bad to hear.",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp(prefs: prefs,),
                ),
              ),
              child: Text(
                "Return to home page.",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
