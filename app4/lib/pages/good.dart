// ignore_for_file: prefer_const_constructors

import 'package:app4/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Good extends StatelessWidget {
  final SharedPreferences prefs;

  const Good({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Center(
                child: Text("Excellent!",
                    style: TextStyle(
                      fontSize: 35,
                    )),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp(prefs: prefs,),),),
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
