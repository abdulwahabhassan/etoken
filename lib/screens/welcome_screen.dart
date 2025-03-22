import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF051960), Color(0xFF591da9)],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset(
            'lib/assets/images/img_welcome_screen.png',
            fit: BoxFit.fitWidth,
            width: 250,
          ),
          Spacer(),
          Text(
            'Welcome to EToken NG',
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
              fontFamily: 'JosefinSans',
              fontSize: 32,
              fontVariations: [FontVariation("wght", 700)], // Force max bold
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacer(),
          Text(
            'Welcome to EToken NG',
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
              fontFamily: 'JosefinSans',
              fontSize: 24,
              fontVariations: [FontVariation("wght", 200)],
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(24),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFF051960),
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Color(0xFF051960),
                    fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          Spacer(),
        ],
      ),
    );
  }
}
