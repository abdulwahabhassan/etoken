import 'package:etoken/ui/common/theme/colors.dart';
import 'package:etoken/ui/features/welcome/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'ui/navigation/router.dart';

class ETokenApp extends StatelessWidget {
  const ETokenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'EToken NG',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        fontFamily: 'Inter',
      ),
      routerConfig: router,
    );
  }
}
