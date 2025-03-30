import 'package:etoken/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../assets/colors/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: lightBlue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                "eToken",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Rowdies",
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    onSubmitted: (text) {},
                    style: TextTheme.of(context).bodyMedium,
                    cursorColor: blue.withAlpha(100),
                    decoration: InputDecoration(
                      icon: Icon(Icons.person, color: Colors.black),
                      hintText: "Enter login ID",
                      hintStyle: TextTheme.of(
                        context,
                      ).labelSmall?.copyWith(fontWeight: FontWeight.normal),
                      fillColor: blue.withAlpha(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      isDense: true,
                      filled: true,
                      isCollapsed: true,
                      contentPadding: EdgeInsets.all(12),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    obscureText: true,
                    onSubmitted: (text) {},
                    style: TextTheme.of(context).bodyMedium,
                    cursorColor: blue.withAlpha(100),
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock, color: Colors.black),
                      hintText: "Enter password",
                      hintStyle: TextTheme.of(
                        context,
                      ).labelSmall?.copyWith(fontWeight: FontWeight.normal),
                      fillColor: blue.withAlpha(16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      isDense: true,
                      filled: true,
                      isCollapsed: true,
                      contentPadding: EdgeInsets.all(12),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (builder) => const HomeScreen()),
                  );
                },
                style: FilledButton.styleFrom(
                  backgroundColor: blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Login",
                  style: TextTheme.of(
                    context,
                  ).labelMedium?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
