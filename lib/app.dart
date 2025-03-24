import 'package:etoken/assets/colors/color.dart';
import 'package:etoken/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class ETokenApp extends StatelessWidget {
  const ETokenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EToken NG',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: yellow),
        fontFamily: 'Inter',
      ),
      home: WelcomeScreen()
    );
  }
}

Widget button = ClipRect(
  child: Container(
    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
  ),
);
