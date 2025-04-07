import 'package:etoken/core/ui/theme/colors.dart';
import 'package:etoken/features/welcome/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class ETokenApp extends StatelessWidget {
  // final AppNavigatorObserver appNavigatorObserver;
  const ETokenApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // navigatorObservers: [appNavigatorObserver],
      title: 'EToken NG',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        fontFamily: 'Inter',
      ),
      home: WelcomeScreen()
    );
  }
}
