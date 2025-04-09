import 'package:flutter/material.dart';
import 'dart:io';

import 'package:go_router/go_router.dart';

class ETokenAppBar extends StatelessWidget {
  final String title;
  final bool showBackButton;

  const ETokenAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: Platform.isIOS ? showBackButton ? 48 : 60 : showBackButton ? 18 : 30 ,
        left: showBackButton ? 8 : 16,
        right: 16,
      ),
      alignment: Alignment.topLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showBackButton)
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back_ios_rounded),
              iconSize: 16,
            ),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Rowdies",
              color: Colors.black87,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
