import 'package:etoken/core/ui/theme/colors.dart';
import 'package:etoken/features/dashboard/presentation/screens/direct_dashboard_screen.dart';
import 'package:etoken/core/ui/shared_screens/voucher_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

enum QRCodeScanType {
  redemptionBadge,
  voucher
}
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
      body: Stack(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 230),
              child: MobileScanner(
                onDetect: (BarcodeCapture barcode) {
                  final String code =
                      barcode.barcodes[0].rawValue ?? "No QR code detected";
                  setState(() {
                    qrCode = code;
                  });
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (buildContext) => switch (widget.scanType) {
                        QRCodeScanType.redemptionBadge => DirectDashboardScreen(),
                        QRCodeScanType.voucher => VoucherDetailsScreen(),
                      },
                    ),
                  );
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
                        SizedBox(height: 8,),
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
            top: 40,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "QR Scanner",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Rowdies",
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Text(
                  "$narrationText to redeem voucher, enjoy massive discounts and transact seamlessly",
                  style: TextTheme.of(context).labelMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    "lib/core/ui/icons/img_qr_code_scanner.png",
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
