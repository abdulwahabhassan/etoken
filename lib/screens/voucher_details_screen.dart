import 'package:etoken/assets/colors/color.dart';
import 'package:etoken/screens/result_screen.dart';
import 'package:etoken/widgets/voucher_detail.dart';
import 'package:flutter/material.dart';

class VoucherDetailsScreen extends StatelessWidget {
  const VoucherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightBlue,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 38),
        child: Container(
          padding: EdgeInsets.only(top: 40, left: 16, right: 16),
          alignment: Alignment.topLeft,
          child: Text(
            "Voucher Details",
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Rowdies",
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                Text(
                  "Voucher is valid for redemption",
                  style: TextTheme.of(context).labelMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16,),
                VoucherDetail(
                  title: "Uber",
                  label: "Redeemable on all rides globally",
                  value: "\$200",
                  onRedeemedNowPressed:
                      () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (buildContext) => ResultScreen(),
                        ),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
