import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:etoken/assets/colors/color.dart';
import 'package:etoken/widgets/drag_button.dart';
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
      home: Scaffold(
        body: Container(
          color: bluue,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 24),
                Flexible(
                  flex: 9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/images/img_transact.png',
                        fit: BoxFit.fitWidth,
                        width: 200,
                        height: 250,
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          // Professional & Premium - Gradient Color Effect
                          ColorizeAnimatedText(
                            "eToken",
                            textStyle: TextStyle(
                              fontSize: 40,
                              fontFamily: "Rowdies",
                            ),
                            colors: [Colors.white, yellow],
                            textAlign: TextAlign.center,
                          ),
                        ],
                        repeatForever: false,
                        totalRepeatCount: 1,
                      ),
                      SizedBox(height: 16),
                      AnimatedTextKit(
                        animatedTexts: [
                          // Secure & Fintech-like - Typewriter Effect
                          TypewriterAnimatedText(
                            "Fast. Secure. Reliable.",
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: "Rowdies",

                              fontSize: 18,
                            ),
                            speed: Duration(milliseconds: 150),
                            textAlign: TextAlign.center,
                          ),
                        ],
                        repeatForever: false,
                        totalRepeatCount: 1,
                      ),
                      Text(
                        "Powering Digital Transactions",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Rowdies",

                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Flexible(flex: 1, child: DragButton()),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget button = ClipRect(
  child: Container(
    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
  ),
);
