import 'package:flutter/material.dart';
import 'package:tictactoe/tictac.dart';
import 'homepage.dart';
import 'info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(backgroundColor: Colors.blue),
      initialRoute: '/',
      routes: {
        '/tic': (context) => TicTac(),
        '/info': (context) => Info(),
      },
    );
  }
}
