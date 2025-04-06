import 'package:flutter/material.dart';

import '../assets/colors/color.dart';

class CouponCodeDialog extends StatefulWidget {
  const CouponCodeDialog({super.key});

  @override
  State<CouponCodeDialog> createState() => _CouponDialogState();
}

class _CouponDialogState extends State<CouponCodeDialog> {
  final FocusNode focusNode = FocusNode();
  TextEditingController couponCodeTextFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => FocusScope.of(context).requestFocus(focusNode),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: Column(
        children: [
          Image.asset(
            "lib/assets/images/img_confetti_spray.png",
            width: 40,
            height: 40,
          ),
          SizedBox(height: 16),
          Text(
            "With coupon code you enjoy massive discounts",
            style: TextTheme.of(
              context,
            ).labelMedium?.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      content: TextField(
        controller: couponCodeTextFieldController,
        style: TextTheme.of(context).bodyMedium,
        cursorColor: blue.withAlpha(100),
        decoration: InputDecoration(
          hintText: "Coupon Code",
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
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        textAlign: TextAlign.center,
        focusNode: focusNode,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      actions: [
        SizedBox(
          height: 36,
          child: TextButton.icon(
            iconAlignment: IconAlignment.end,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.done_all, color: Colors.green, size: 16),
            label: Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                "Done",
                style: TextTheme.of(
                  context,
                ).labelSmall?.copyWith(color: Colors.deepPurple),
              ),
            ),
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(width: 0.5, color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
