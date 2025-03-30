import 'package:etoken/assets/colors/color.dart';
import 'package:etoken/widgets/voucher_detail.dart';
import 'package:flutter/material.dart';
import '../widgets/app_bar.dart' as ab;

class VoucherDetailsScreen extends StatelessWidget {
  const VoucherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightBlue,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: Padding(
          padding: EdgeInsets.only(top: 40),
          child: ab.AppBar(title: "Voucher Details"),
        ),
      ),
      body: Center(child: SingleChildScrollView(
        child:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: VoucherDetail(
            title: "Uber",
            label: "Redeemable on all rides globally",
            value: "\$200",
          ),
        ),
      ),)
    );
  }
}
