

import 'package:app4/pages/bad.dart';
import 'package:app4/pages/firstw.dart';
import 'package:app4/pages/good.dart';
import 'package:app4/pages/okay.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Press The Button'),
      routes: {
        '/firstw': (context) => const Firstw(),
        '/good': (context) => Good(prefs: prefs,),
        '/okay': (context) => Okay(prefs: prefs,),
        '/bad': (context) => Bad(prefs: prefs), // Pass prefs to Bad route
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Firstw(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "How are you feeling today?",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
