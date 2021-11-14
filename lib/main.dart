import 'dart:io';

import 'package:flutter/material.dart';
import 'package:netflix_clone/screen_home.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        nextScreen: const MyHomePage(),
        splash: 'assets/netflixsplash.gif',splashIconSize: 1000,
        animationDuration: const Duration(milliseconds: 5),
        backgroundColor: Colors.black,

      ),
    );
  }
}

