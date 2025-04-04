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
  final FocusNode focusNode = FocusNode();
  final TextEditingController loginIDTextFieldController =
      TextEditingController();
  final TextEditingController passwordTextFieldController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: lightBlue,
      ),
    );
    requestFocus();
  }

  void requestFocus() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Rowdies",
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Login to redeem coupons, enjoy massive discounts and transact seamlessly",
              style: TextTheme.of(context).labelMedium,
            ),
            SizedBox(height: 24),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextField(
                    textInputAction: TextInputAction.next,
                    controller: loginIDTextFieldController,
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
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      isDense: true,
                      filled: true,
                      isCollapsed: true,
                      contentPadding: EdgeInsets.all(12),
                    ),
                    focusNode: focusNode,
                  ),
                  SizedBox(height: 2),
                  TextField(
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    controller: passwordTextFieldController,
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
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      isDense: true,
                      filled: true,
                      isCollapsed: true,
                      contentPadding: EdgeInsets.all(12),
                    ),
                  ),
                  Container(
                    height: 32,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextTheme.of(context).labelSmall?.copyWith(
                          color: blue,
                          decoration: TextDecoration.underline,
                          decorationColor: blue,
                          decorationThickness: 0.5,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 4),
                  SizedBox(
                    width: double.infinity,
                    height: 36,
                    child: FilledButton(
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        await Future.delayed(Duration(seconds: 1));
                        if (context.mounted) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (builder) => const HomeScreen(),
                            ),
                          );
                        }
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                          side: BorderSide(color: Colors.grey, width: 1),
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: TextTheme.of(context).labelSmall?.copyWith(
                          color: blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
