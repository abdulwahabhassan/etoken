import 'package:etoken/assets/colors/color.dart';
import 'package:etoken/screens/home_screen.dart';
import 'package:etoken/screens/redemption_history_screen.dart';
import 'package:etoken/screens/result_screen.dart';
import 'package:etoken/screens/voucher_details_screen.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        fontFamily: 'Inter',
      ),
      home: HomeScreen()
    );
  }
}
