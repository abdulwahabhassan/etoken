import 'package:etoken/config/router.dart';
import 'package:etoken/data/repositories/user_repository.dart';
import 'package:etoken/ui/common/screens/voucher_details_screen.dart';
import 'package:etoken/ui/features/dashboard/viewmodels/dircet_dashboard_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../features/dashboard/screens/direct_dashboard_screen.dart';
import '../theme/colors.dart';
import '../widgets/app_bar.dart';

enum QRCodeScanType { redemptionBadge, voucher }

class QRCodeScannerScreen extends StatefulWidget {
  final QRCodeScanType scanType;

  const QRCodeScannerScreen({super.key, required this.scanType});

  @override
  State<QRCodeScannerScreen> createState() => _QRCodeScannerScreenState();
}

class _QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
  String? qrCode;

  @override
  Widget build(BuildContext context) {
    String narrationText = switch (widget.scanType) {
      QRCodeScanType.redemptionBadge => "Scan redemption badge QR Code",
      QRCodeScanType.voucher => "Scan voucher QR Code",
    };

    return Scaffold(
      backgroundColor: lightBlue,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 48),
        child: ETokenAppBar(title: "QR Scanner", showBackButton: true),
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 130),
              child: MobileScanner(
                onDetect: (BarcodeCapture barcode) {
                  final String code =
                      barcode.barcodes[0].rawValue ?? "No QR code detected";
                  setState(() {
                    qrCode = code;
                  });
                  switch (widget.scanType) {
                    case QRCodeScanType.redemptionBadge:
                      context.push(dashboardRoute);
                    case QRCodeScanType.voucher:
                      context.push(voucherDetailsRoute);
                  }
                },
                placeholderBuilder:
                    (_, _) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 8,
                      children: [
                        CircularProgressIndicator(
                          strokeWidth: 2,
                          strokeCap: StrokeCap.round,
                          color: Colors.deepPurpleAccent,
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Initializing camera ...",
                          style: TextTheme.of(context).labelMedium,
                        ),
                      ],
                    ),
              ),
            ),
          ),
          Positioned(
            // top: 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   children: [
                //     IconButton(
                //       onPressed: () {
                //         Navigator.of(context).pop();
                //       },
                //       icon: Icon(Icons.arrow_back_ios_rounded, size: 16),
                //     ),
                //     Text(
                //       "QR Scanner",
                //       style: TextStyle(
                //         fontSize: 18,
                //         fontFamily: "Rowdies",
                //         color: Colors.black87,
                //       ),
                //       textAlign: TextAlign.start,
                //     ),
                //   ],
                // ),
                // SizedBox(height: 24),
                Text(
                  "$narrationText to redeem voucher, enjoy massive discounts and transact seamlessly",
                  style: TextTheme.of(context).labelMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    "lib/ui/common/icons/img_qr_code_scanner.png",
                    width: 54,
                    height: 54,
                  ),
                ),
              ],
            ),
          ),
          if (qrCode != null)
            Positioned(
              top: 242,
              right: 12,
              child: Container(
                // color: Colors.white.withAlpha(50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.black.withAlpha(100),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Scanned: $qrCode',
                    style: TextTheme.of(context).labelSmall?.copyWith(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
