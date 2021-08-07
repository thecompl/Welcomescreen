import 'package:flutter/material.dart';

import 'AnimatedScreen.dart';

void main() => runApp(My_App());

class My_App extends StatefulWidget {
  const My_App({Key? key}) : super(key: key);

  @override
  _My_AppState createState() => _My_AppState();
}

class _My_AppState extends State<My_App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: AnimatedScreen(),
      title: 'MY flutter App',
    );
  }
}
