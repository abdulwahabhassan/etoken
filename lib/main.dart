import 'package:etoken/app.dart';
import 'package:etoken/assets/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: bluue,
    ),
  );

  runApp(const ETokenApp());
}
