import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlassEffect extends StatelessWidget {
  final Widget? background;
  final Widget? content;

  const FrostedGlassEffect({super.key, this.background, this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          if (background != null) Positioned.fill(child: background!),
          // Frosted Glass Effect
          Expanded(
            child: Center(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 150,
                  sigmaY: 150,
                ), // Adjust blur strength
                child: content ?? SizedBox(),
                // Container(
                //   width: 300,
                //   height: 200,
                //   padding: EdgeInsets.all(20),
                //   decoration: BoxDecoration(
                //     color: Colors.white.withOpacity(0.2), // Frosted effect
                //     borderRadius: BorderRadius.circular(20),
                //     border: Border.all(
                //       color: Colors.white.withOpacity(0.3), // Subtle border
                //     ),
                //   ),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         "Frosty UI",
                //         style: TextStyle(
                //           fontSize: 24,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.black,
                //         ),
                //       ),
                //       SizedBox(height: 10),
                //       Text(
                //         "This is a glassy, transparent design!",
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //           fontSize: 16,
                //           color: Colors.black.withOpacity(0.9),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
