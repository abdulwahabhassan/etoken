import 'package:etoken/ui/features/auth/widgets/redemption_point_code_dialog.dart';
import 'package:flutter/material.dart';

import '../../../common/screens/qr_code_scanner_screen.dart';


class LoginDialog extends StatelessWidget {
  const LoginDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: Column(
        children: [
          Icon(Icons.login_rounded, size: 24),
          SizedBox(height: 16),
          Text(
            "How would you like to complete login?",
            textAlign: TextAlign.center,
            style: TextTheme.of(context)
                .labelMedium
                ?.copyWith(color: Colors.black),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          height: 36,
          child: FilledButton(
            onPressed: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder:
                    (context) => RedemptionPointCodeDialog(),
              );
            },
            style: FilledButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(24),
                side: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              spacing: 8,
              children: [
                Flexible(child: Text(
                  "Enter RP Code",
                  style: TextTheme
                      .of(
                    context,
                  )
                      .labelSmall
                      ?.copyWith(
                    color: Colors.deepPurple,
                  ),
                  overflow: TextOverflow.ellipsis,
                )),
                Icon(
                  Icons.keyboard_alt_outlined,
                  size: 16,
                  color: Colors.deepPurple,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          height: 36,
          child: FilledButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (
                      builder,
                      ) => QRCodeScannerScreen(scanType: QRCodeScanType.redemptionBadge)
                ),
              );
            },
            style: FilledButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(24),
                side: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              spacing: 8,
              children: [
                Flexible(child: Text(
                  "Scan RP QR Code",
                  style: TextTheme.of(
                    context,
                  ).labelSmall?.copyWith(
                    color: Colors.deepPurple,
                  ),
                  overflow: TextOverflow.ellipsis,
                )),
                Icon(
                  Icons.qr_code_scanner_rounded,
                  size: 16,
                  color: Colors.deepPurple,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}