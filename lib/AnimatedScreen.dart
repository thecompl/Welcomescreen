import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/Login.dart';

import 'git';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home:AnimatedSplashScreen(
        splash:Image.asset('assets/images/logo.jpg'
        ),
        nextScreen:Welcomescreen(),
        splashTransition:SplashTransition.fadeTransition,
        backgroundColor:Colors.cyan,
      ),

    );
  }
}
