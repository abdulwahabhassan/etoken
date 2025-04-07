import 'package:flutter/material.dart';

import '../../../../core/ui/theme/colors.dart';
import '../../../../core/ui/shared_screens/voucher_details_screen.dart';

class VoucherCodeDialog extends StatelessWidget {
  VoucherCodeDialog({super.key});

  final TextEditingController voucherCodeTextFieldController = TextEditingController();
  final FocusNode focusNode = FocusNode();


  @override
  Widget build(BuildContext context) {

    FocusScope.of(context).requestFocus(focusNode);

    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "lib/core/ui/icons/img_voucher_colored.png",
            width: 32,
            height: 32,
          ),
          SizedBox(height: 16),
          Text(
            "Enter voucher code to redeem voucher",
            textAlign: TextAlign.center,
            style: TextTheme.of(
              context,
            ).labelMedium?.copyWith(color: Colors.black),

          ),
        ],
      ),
      content: TextField(
        controller: voucherCodeTextFieldController,
        style: TextTheme.of(context).bodyMedium,
        cursorColor: blue.withAlpha(100),
        decoration: InputDecoration(
          hintText: "Voucher Code",
          hintStyle: TextTheme.of(context).labelSmall?.copyWith(
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
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
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      actions: [
        SizedBox(
          height: 36,
          child: TextButton.icon(
            iconAlignment: IconAlignment.end,
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (buildContext) => VoucherDetailsScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.keyboard_double_arrow_right_rounded,
              color: Colors.green,
              size: 16,
            ),
            label: Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                "Proceed",
                style: TextTheme.of(
                  context,
                ).labelSmall?.copyWith(color: Colors.deepPurple),
                overflow: TextOverflow.ellipsis,
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
