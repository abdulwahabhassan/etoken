import 'package:flutter/material.dart';

class AppBar extends StatelessWidget {
  final String title;

  const AppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_rounded),
            alignment: Alignment.center,
            iconSize: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextTheme.of(
                    context,
                  ).labelMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(width: 48),
        ],
      ),
    );
  }
}
