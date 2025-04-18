import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:etoken/ui/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../common/theme/colors.dart';
import '../widgets/drag_button.dart';

class WelcomeScreen extends StatefulWidget {
  // final AppNavigatorObserve
  // r appNavigatorObserver;

  const WelcomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final List<String> imageAssets = [
    "lib/ui/common/icons/img_transact.png",
    "lib/ui/common/icons/img_money_wallet.png",
    "lib/ui/common/icons/img_discount.png",
  ];

  final List<String> texts = [
    "Powering Digital Transactions",
    "Send, Receive & Store Vouchers",
    "Enjoy Unlimited Promos & Discounts",
  ];

  int currentContentIndex = 0;

  void changeContent(int index) => {
    setState(() {
      currentContentIndex = index;
    }),
  };

  void onHorizontalDragUpdate(double dx) {
    switch (dx) {
      case <= 85:
        changeContent(0);
        break;
      case <= 170:
        changeContent(1);
        break;
      default:
        changeContent(2);
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(100),
                      shape: BoxShape.circle,
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                      child: Image.asset(
                        imageAssets[currentContentIndex],
                        fit: BoxFit.fitWidth,
                        width: 128,
                        height: 128,
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    "eToken",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Rowdies",
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Fast. Secure. Reliable.",
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: "Rowdies",
                          fontSize: 12,
                        ),
                        speed: Duration(milliseconds: 150),
                        textAlign: TextAlign.center,
                      ),
                    ],
                    repeatForever: false,
                    totalRepeatCount: 1,
                  ),
                  Text(
                    texts[currentContentIndex],
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            DragButton(
              initialImagePath: "lib/ui/common/icons/img_padlock.png",
              finalImagePath: "lib/ui/common/icons/img_open_padlock.png",
              initialText: "Slide To Unlock",
              finalText: "Tap To Get Started",
              onHorizontalDragUpdate: onHorizontalDragUpdate,
              initialColor: blue,
              finalColor: Colors.white,
              onPressed: () {
                context.push(loginRoute);
              },
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
