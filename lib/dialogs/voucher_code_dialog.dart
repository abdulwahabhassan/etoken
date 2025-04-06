import 'package:flutter/material.dart';

import '../assets/colors/color.dart';
import '../screens/voucher_details_screen.dart';

class VoucherCodeDialog extends StatefulWidget {
  VoucherCodeDialog({super.key});

  final FocusNode focusNode = FocusNode();

  @override
  State<VoucherCodeDialog> createState() => _VoucherCodeDialogState();
}

class _VoucherCodeDialogState extends State<VoucherCodeDialog> {
  TextEditingController voucherCodeTextFieldController = TextEditingController();
  final FocusNode focusNode = FocusNode();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
          (_) => FocusScope.of(context).requestFocus(focusNode),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "lib/assets/images/img_voucher_colored.png",
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
