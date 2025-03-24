import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../assets/colors/color.dart';
import '../widgets/drag_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  final List<String> imageAssets = [
    "lib/assets/images/img_transact.png",
    "lib/assets/images/img_promo.png",
    "lib/assets/images/img_cashback.png",
    "lib/assets/images/img_discount.png",
    "lib/assets/images/img_shopping.png",
  ];

  int currentImageIndex = 0;

  void changeContent() => {
    setState(() {
      currentImageIndex = currentImageIndex + 1;
    })
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: blue,
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
                      imageAssets[currentImageIndex],
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
              Flexible(
                flex: 1,
                child: DragButton(
                  initialImagePath: "lib/assets/images/img_padlock.png",
                  finalImagePath: "lib/assets/images/img_open_padlock.png",
                  initialText: "Slide To Unlock",
                  finalText: "Tap To Get Started",
                  onHorizontalDragUpdate: (dx) => {
                    // switch (dx/255) {
                    //  case double() => throw UnimplementedError(),
                    // }
                  },
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

