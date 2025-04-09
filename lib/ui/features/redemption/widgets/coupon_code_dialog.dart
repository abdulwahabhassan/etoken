import 'package:flutter/material.dart';

import '../../../common/theme/colors.dart';


class CouponCodeDialog extends StatelessWidget {

  final TextEditingController couponCodeTextFieldController;
  final FocusNode focusNode = FocusNode();

  CouponCodeDialog({super.key, required this.couponCodeTextFieldController});

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);

    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: Column(
        children: [
          Image.asset(
            "lib/ui/common/icons/img_confetti_spray.png",
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
        textInputAction: TextInputAction.done,
        onSubmitted: (value) => Navigator.pop(context),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
