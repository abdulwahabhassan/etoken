import 'package:flutter/material.dart';

import '../assets/colors/color.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,

      body: Column(
        spacing: 8,
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("lib/assets/images/img_pass.png", width: 80),
                SizedBox(height: 8),
                Text(
                  "Voucher Redeemed Successfully",
                  style: TextTheme.of(
                    context,
                  ).labelMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: SizedBox(
              width: double.infinity,
              height: 36,
              child: FilledButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                style: FilledButton.styleFrom(
                  backgroundColor: blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Done",
                  style: TextTheme.of(
                    context,
                  ).labelSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold,),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
