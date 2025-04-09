import 'package:flutter/material.dart';

import '../../../common/screens/voucher_details_screen.dart';
import '../../../common/theme/colors.dart';

class VoucherCodeDialog extends StatelessWidget {
  final TextEditingController voucherCodeTextFieldController =
      TextEditingController();
  final TextEditingController pinTextFieldController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  VoucherCodeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);

    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "lib/ui/common/icons/img_voucher_colored.png",
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
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
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
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              TextField(
                controller: pinTextFieldController,
                obscureText: true,
                style: TextTheme.of(context).labelSmall,
                cursorColor: blue.withAlpha(100),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "PIN",
                  hintStyle: TextTheme.of(
                    context,
                  ).labelSmall?.copyWith(fontWeight: FontWeight.normal),
                  fillColor: Colors.transparent,
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color: Colors.grey),
                  ),
                  isDense: true,
                  filled: true,
                  isCollapsed: true,
                  contentPadding: EdgeInsets.all(4),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color: Colors.grey),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
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
                    borderRadius: BorderRadius.circular(24),
                    side: BorderSide(width: 0.5, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
